package com.asaenf;

import com.asaenf.http.HttpGetResource;
import com.asaenf.profiling.AudioProfileResponseConverter;
import com.asaenf.profiling.HttpProfilingDataProvider;
import com.asaenf.profiling.JsonAudioProfileResponseConverter;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spotify.apollo.Environment;
import com.spotify.apollo.httpservice.HttpService;
import com.spotify.apollo.httpservice.LoadingException;

public class ProjectRunner {

    public static void main(final String... args) throws LoadingException {
      System.out.println("Do stuff");

      HttpService.boot(ProjectRunner::configure, "test-service", args);
    }

  public static void configure(final Environment environment) {
    final ObjectMapper mapper = new ObjectMapper();
    mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
    final AudioProfileResponseConverter responseConverter = new JsonAudioProfileResponseConverter(
        mapper);
        final HttpProfilingDataProvider httpProfilingDataProvider = new HttpProfilingDataProvider
        (responseConverter, "https://api.spotify.com/v1/audio-features/?ids="
           );

    environment
        .routingEngine().registerAutoRoutes(new HttpGetResource(httpProfilingDataProvider));

  }
}
