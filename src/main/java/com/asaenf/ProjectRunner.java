package com.asaenf;

import com.asaenf.authorisation.AuthorisationProvider;
import com.asaenf.authorisation.CodeHolder;
import com.asaenf.http.HttpAuthCallbackResource;
import com.asaenf.http.HttpGetAudioProfilesResource;
import com.asaenf.profiling.*;
import com.asaenf.top.HttpTopTracksProvider;
import com.asaenf.top.JsonUserTopTracksResponseConverter;
import com.asaenf.top.TopTracksProvider;
import com.asaenf.top.UserTopTracksResponseConverter;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spotify.apollo.Environment;
import com.spotify.apollo.httpservice.HttpService;
import com.spotify.apollo.httpservice.LoadingException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

public class ProjectRunner {

    private static final List<String> VALID_TIME_RANGES = Arrays.asList("short_term", "medium_term", "long_term");
    private static final Logger LOGGER = LoggerFactory.getLogger(ProjectRunner.class);

    public static void main(final String... args) throws LoadingException, IOException, InterruptedException {

        HttpService.boot(ProjectRunner::configure, "audio-profile-service", args);
        LOGGER.info("Started");
    }

    public static void configure(final Environment environment) {

        final com.typesafe.config.Config config = environment.config();
        final String clientId = config.getString("clientId");
        final String clientSecret = config.getString("clientSecret");
        final String state = config.getString("state");
        final String redirectUri = config.getString("redirecturi");
        final String scopes = config.getString("scopes");

        final ObjectMapper mapper = new ObjectMapper();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        final AudioProfileResponseConverter responseConverter = new JsonAudioProfileResponseConverter(
                mapper);
        final ProfilingDataProvider httpProfilingDataProvider = new HttpProfilingDataProvider
                (responseConverter, "https://api.spotify.com/v1/audio-features/?ids="
                );
        final UserTopTracksResponseConverter userTopTracksResponseConverter = new JsonUserTopTracksResponseConverter(mapper);
        final TopTracksProvider topTracksProvider = new HttpTopTracksProvider(VALID_TIME_RANGES, "https://api.spotify.com/v1/me/top/tracks", userTopTracksResponseConverter, 1, 50);
        final CodeHolder codeHolder = new CodeHolder();
        final AuthorisationProvider authorisationProvider = new AuthorisationProvider(clientId, clientSecret, state, scopes, redirectUri, codeHolder);

        final ProfilingService profilingService = new ProfilingService(httpProfilingDataProvider, topTracksProvider, authorisationProvider);
        environment
                .routingEngine().registerAutoRoutes(new HttpGetAudioProfilesResource(profilingService, mapper)).registerAutoRoutes(new HttpAuthCallbackResource(codeHolder));

    }
}
