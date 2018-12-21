package com.asaenf.http;

import static java.util.concurrent.CompletableFuture.completedFuture;

import com.asaenf.profiling.HttpProfilingDataProvider;
import com.spotify.apollo.RequestContext;
import com.spotify.apollo.Response;
import com.spotify.apollo.Status;
import com.spotify.apollo.route.AsyncHandler;
import com.spotify.apollo.route.Route;
import com.spotify.apollo.route.RouteProvider;
import java.util.concurrent.CompletionStage;
import java.util.stream.Stream;

public class HttpGetResource implements RouteProvider {

  private final HttpProfilingDataProvider httpProfilingDataProvider;

  public HttpGetResource(final HttpProfilingDataProvider httpProfilingDataProvider) {
    this.httpProfilingDataProvider = httpProfilingDataProvider;
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
    //TODO
    /*
      1. get top tracks for user
      2. get audio profiles for tracks
     */
    final Response response = Response.forStatus(Status.OK).withPayload("Hello");
    return completedFuture(response);
  }

}
