package com.asaenf.http;

import com.asaenf.model.AudioProfile;
import com.asaenf.profiling.ProfilingService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spotify.apollo.RequestContext;
import com.spotify.apollo.Response;
import com.spotify.apollo.Status;
import com.spotify.apollo.route.AsyncHandler;
import com.spotify.apollo.route.Route;
import com.spotify.apollo.route.RouteProvider;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.concurrent.CompletionStage;
import java.util.stream.Stream;

import static java.util.concurrent.CompletableFuture.completedFuture;

public class HttpGetAudioProfilesResource implements RouteProvider {

    private final ProfilingService profilingService;
    private final ObjectMapper objectMapper;
    private static final Logger LOGGER = LoggerFactory.getLogger(HttpGetAudioProfilesResource.class);

    public HttpGetAudioProfilesResource(final ProfilingService profilingService, final ObjectMapper objectMapper) {
        this.profilingService = profilingService;
        this.objectMapper = objectMapper;
    }

    @Override
    public Stream<? extends Route<? extends AsyncHandler<?>>> routes() {
        return Stream.of(
                Route.async(
                        "GET",
                        "/top/track/audioprofiles/",
                        this::getAudioProfileForTopTracks));
    }


    private CompletionStage<Response<String>> getAudioProfileForTopTracks(final RequestContext context) {
        LOGGER.info("Request for audio profiles received");
        final List<AudioProfile> profiles = profilingService.getAudioProfiles(context);
        Response response;
        try {
            final String responseAsJson = objectMapper.writeValueAsString(profiles);
            response = Response.forStatus(Status.OK).withPayload(responseAsJson);
        } catch (final JsonProcessingException e) {
            response = Response.forStatus(Status.INTERNAL_SERVER_ERROR).withPayload("Error getting audio profiles");
        }

        return completedFuture(response);
    }

}
