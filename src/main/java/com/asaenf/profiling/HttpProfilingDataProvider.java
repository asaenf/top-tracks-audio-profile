package com.asaenf.profiling;

import com.asaenf.exception.TopTracksProfilingException;
import com.asaenf.model.AudioProfile;
import com.spotify.apollo.Request;
import com.spotify.apollo.RequestContext;
import com.spotify.apollo.Response;
import com.spotify.apollo.StatusType;
import okio.ByteString;

import java.util.List;
import java.util.concurrent.CompletionStage;
import java.util.stream.Collectors;

public class HttpProfilingDataProvider implements ProfilingDataProvider {

    private final AudioProfileResponseConverter responseConverter;
    private final String url;

    public HttpProfilingDataProvider(final AudioProfileResponseConverter responseConverter,
                                     final String url
    ) {
        this.responseConverter = responseConverter;
        this.url = url;
    }

    public List<AudioProfile> getAudioProfilesForTracks(final List<String> trackIds, final RequestContext
            requestContext, final String token) {

        final Request request = Request.forUri(getUri(trackIds), "GET").withHeader("Authorization:", "Bearer " + token);
        final CompletionStage<Response<ByteString>>
                future = requestContext.requestScopedClient().send(request);
        try {
            final Response<ByteString> resp = future.toCompletableFuture().get();
            if (resp.status().family().equals(StatusType.Family.SUCCESSFUL) && resp.payload().isPresent()) {
                final ByteString payload = resp.payload().get();
                return responseConverter.getAudioProfile(payload.utf8());
            } else {
                throw new TopTracksProfilingException("Unable to get audio profiling data, http status: " +
                        resp.status().code());
            }
        } catch (final Exception e) {
            throw new TopTracksProfilingException("Unable to get audio profiling data", e);
        }
    }

    private String getUri(final List<String> trackIds) {
        return url.concat(trackIds.stream().map(str -> str.split(":")).map(arr -> arr[2]).collect(Collectors.joining(",")));
    }


}
