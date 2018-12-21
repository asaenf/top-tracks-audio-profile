package com.asaenf.profiling;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;

import com.asaenf.exception.TopTracksProfilingException;
import com.spotify.apollo.Client;
import com.spotify.apollo.Request;
import com.spotify.apollo.RequestContext;
import com.spotify.apollo.Response;
import com.spotify.apollo.StatusType;
import java.io.IOException;
import java.util.Arrays;
import java.util.Optional;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CompletionStage;
import java.util.concurrent.ExecutionException;
import okio.ByteString;
import org.junit.Before;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Mock;

public class HttpProfilingDataProviderTest {

  HttpProfilingDataProvider profilingDataProvider;

  @Mock
  AudioProfileResponseConverter responseConverter;


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

  @Mock Request request;

  Optional<ByteString> respOptional;

  @Mock
  StatusType statusType;

  @Before
  public void setUp() throws ExecutionException, InterruptedException {
    initMocks(this);
    profilingDataProvider = new HttpProfilingDataProvider(responseConverter, "https://url?tracks=");
    respOptional= Optional.of(ByteString.encodeUtf8("someresponse"));
    when(requestContext.request()).thenReturn(request);
    when(requestContext.requestScopedClient()).thenReturn(client);
    when(client.send(any(Request.class))).thenReturn(completionStage);
    when(completionStage.toCompletableFuture()).thenReturn(completableFuture);
    when(completableFuture.get()).thenReturn(response);
    when(statusType.family()).thenReturn(StatusType.Family.SUCCESSFUL);
    when(response.status()).thenReturn(statusType);
    when(response.payload()).thenReturn(respOptional);
  }

  @Test(expected = TopTracksProfilingException.class)
  public void unsuccessfulCallThrowsException(){
    when(statusType.family()).thenReturn(StatusType.Family.SERVER_ERROR);

    profilingDataProvider.getAudioProfilesForTracks(Arrays.asList("t1","t2"), requestContext);
  }

  @Test
  public void successfulCallReturnsProfileData() throws IOException {
    profilingDataProvider.getAudioProfilesForTracks(Arrays.asList("t1","t2"), requestContext);

    verify(client).send(requestArgumentCaptor.capture());
    assertThat(requestArgumentCaptor.getValue().uri()).isEqualTo
        ("https://url?tracks=t1,t2");
    verify(responseConverter).getAudioProfile("someresponse");
  }
}
