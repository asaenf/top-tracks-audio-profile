package com.asaenf.top;

import com.asaenf.exception.TopTracksProfilingException;
import com.spotify.apollo.*;
import okio.ByteString;
import org.junit.Before;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Mock;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CompletionStage;
import java.util.concurrent.ExecutionException;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;

public class HttpTopTracksProviderTest {

    HttpTopTracksProvider topTracksProvider;
    List<String> validRanges = Arrays.asList("short_term", "medium_term", "long_term");
    String url = "https://url";

    @Mock
    UserTopTracksResponseConverter userTopTracksResponseConverter;


    @Mock
    Client client;

    @Mock
    CompletionStage completionStage;

    ArgumentCaptor<Request> requestArgumentCaptor = ArgumentCaptor.forClass(Request.class);

    @Mock
    CompletableFuture<Response<ByteString>> completableFuture;

    @Mock
    Response<ByteString> response;

    @Mock
    RequestContext requestContext;

    @Mock
    Request request;

    Optional<String> optNPresent, optRPresent, optNotPresent;
    Optional<ByteString> respOptional;

    private String token;

    @Mock
    StatusType statusType;


    @Before
    public void setUp() throws ExecutionException, InterruptedException {
        initMocks(this);
        optNotPresent = Optional.empty();
        respOptional = Optional.of(ByteString.encodeUtf8("someresponse"));
        topTracksProvider = new HttpTopTracksProvider(validRanges, url, userTopTracksResponseConverter,
                1, 50);
        when(requestContext.request()).thenReturn(request);
        when(requestContext.requestScopedClient()).thenReturn(client);
        when(client.send(any(Request.class))).thenReturn(completionStage);
        when(completionStage.toCompletableFuture()).thenReturn(completableFuture);
        when(completableFuture.get()).thenReturn(response);
        when(statusType.family()).thenReturn(StatusType.Family.SUCCESSFUL);
        when(response.status()).thenReturn(statusType);
        when(response.payload()).thenReturn(respOptional);
    }

    @Test(expected = IllegalArgumentException.class)
    public void invalidTimeRangeThrowsException() {
        optRPresent = Optional.of("invalid_term");
        when(request.parameter("time_range")).thenReturn(optRPresent);

        topTracksProvider.getTopTracksIds(requestContext, token);

    }

    @Test
    public void noTimeRangeAndNoTopLimitUsesDefaultAndMakesSuccessfulCall() throws IOException {
        topTracksProvider.getTopTracksIds(requestContext, token);

        verify(client).send(requestArgumentCaptor.capture());
        assertThat(requestArgumentCaptor.getValue().uri()).isEqualTo
                ("https://url?limit=10&time_range=medium_term");
        verify(userTopTracksResponseConverter).getTopTrackUris("someresponse");
    }

    @Test(expected = IllegalArgumentException.class)
    public void invalidTopLimitThrowsException() {
        optNPresent = Optional.of("3f");
        when(request.parameter("n")).thenReturn(optNPresent);

        topTracksProvider.getTopTracksIds(requestContext, token);
    }

    @Test(expected = IllegalArgumentException.class)
    public void outOfRangeMinTopLimitThrowsException() {
        optNPresent = Optional.of("0");
        when(request.parameter("n")).thenReturn(optNPresent);

        topTracksProvider.getTopTracksIds(requestContext, token);
    }

    @Test(expected = IllegalArgumentException.class)
    public void outOfRangeMaxTopLimitThrowsException() {
        optNPresent = Optional.of("51");
        when(request.parameter("n")).thenReturn(optNPresent);

        topTracksProvider.getTopTracksIds(requestContext, token);
    }

    @Test
    public void ifRangeAndTopIsSetTheseValuesAreUsedAndMakesSuccessfulCall() throws IOException {
        optNPresent = Optional.of("1");
        optRPresent = Optional.of("short_term");
        when(request.parameter("time_range")).thenReturn(optRPresent);
        when(request.parameter("n")).thenReturn(optNPresent);

        topTracksProvider.getTopTracksIds(requestContext, token);


        verify(client).send(requestArgumentCaptor.capture());
        assertThat(requestArgumentCaptor.getValue().uri()).isEqualTo
                ("https://url?limit=1&time_range=short_term");
        verify(userTopTracksResponseConverter).getTopTrackUris("someresponse");
    }

    @Test(expected = TopTracksProfilingException.class)
    public void unsuccessfulCallThrowsException() {
        when(statusType.family()).thenReturn(StatusType.Family.SERVER_ERROR);

        topTracksProvider.getTopTracksIds(requestContext, token);
    }
}
