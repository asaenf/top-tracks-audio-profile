package com.asaenf.profiling;

import com.asaenf.authorisation.AuthorisationProvider;
import com.asaenf.exception.TopTracksProfilingException;
import com.asaenf.top.TopTracksProvider;
import com.spotify.apollo.RequestContext;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;

import java.util.Arrays;
import java.util.List;

import static org.junit.Assert.fail;
import static org.mockito.Mockito.*;
import static org.mockito.MockitoAnnotations.initMocks;

public class ProfilingServiceTest {

    ProfilingService profilingService;

    @Mock
    ProfilingDataProvider profilingDataProvider;
    @Mock
    TopTracksProvider topTracksProvider;
    @Mock
    RequestContext context;
    @Mock
    AuthorisationProvider authorisationProvider;

    List<String> ids = Arrays.asList("t1", "t2");
    private final String token = "token";

    @Before
    public void setUp() {
        initMocks(this);
        profilingService = new ProfilingService(profilingDataProvider, topTracksProvider, authorisationProvider);
        when(authorisationProvider.authoriseUser()).thenReturn(token);
    }

    @Test
    public void serviceGetsTopTracksAndProfilesByCallingProviders() {
        when(topTracksProvider.getTopTracksIds(context, token)).thenReturn(ids);
        profilingService.getAudioProfiles(context);

        verify(topTracksProvider).getTopTracksIds(context, token);
        verify(profilingDataProvider).getAudioProfilesForTracks(ids, context, token);
    }

    @Test
    public void whenTopTrackProviderThrowsExceptionItsPropagated() {
        when(topTracksProvider.getTopTracksIds(context, token)).thenThrow(TopTracksProfilingException.class);

        try {
            profilingService.getAudioProfiles(context);
            fail("Expected exception");
        } catch (final TopTracksProfilingException e) {
            //expected
            verifyZeroInteractions(profilingDataProvider);
        }
    }

    @Test
    public void whenAudioProfileProviderThrowsExceptionThisIsPropagated() {
        when(profilingDataProvider.getAudioProfilesForTracks(ids, context, token)).thenThrow(TopTracksProfilingException.class);
        when(topTracksProvider.getTopTracksIds(context, token)).thenReturn(ids);
        try {
            profilingService.getAudioProfiles(context);
            fail("Expected exception");
        } catch (final TopTracksProfilingException e) {
            //expected
            verify(topTracksProvider).getTopTracksIds(context, token);
        }
    }
}
