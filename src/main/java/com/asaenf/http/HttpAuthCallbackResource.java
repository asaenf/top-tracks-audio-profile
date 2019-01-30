package com.asaenf.http;

import com.asaenf.authorisation.CodeHolder;
import com.asaenf.exception.TopTracksProfilingException;
import com.spotify.apollo.RequestContext;
import com.spotify.apollo.Response;
import com.spotify.apollo.Status;
import com.spotify.apollo.route.AsyncHandler;
import com.spotify.apollo.route.Route;
import com.spotify.apollo.route.RouteProvider;

import java.util.Observable;
import java.util.concurrent.CompletionStage;
import java.util.stream.Stream;

import static java.util.concurrent.CompletableFuture.completedFuture;

public class HttpAuthCallbackResource extends Observable implements RouteProvider {

    private final CodeHolder codeHolder;

    public HttpAuthCallbackResource(final CodeHolder codeHolder) {
        this.codeHolder = codeHolder;
    }

    @Override
    public Stream<? extends Route<? extends AsyncHandler<?>>> routes() {
        return Stream.of(
                Route.async(
                        "GET",
                        "/callback",
                        this::callback));
    }

    private CompletionStage<Response<String>> callback(final RequestContext requestContext) {
        final Response response;
        if (requestContext.request().parameter("code").isPresent()) {
            final String code = requestContext.request().parameter("code").get();
            codeHolder.setToken(code);
            synchronized (codeHolder) {
                codeHolder.notify();
            }
            response = Response.forStatus(Status.OK).withPayload("OK");
        } else {
            throw new TopTracksProfilingException("Unable to get code");

        }
        return completedFuture(response);
    }
}
