package com.asaenf.profiling;

import com.asaenf.model.AudioProfile;
import com.spotify.apollo.RequestContext;

import java.util.List;

public interface ProfilingDataProvider {

    List<AudioProfile> getAudioProfilesForTracks(final List<String> trackIds, final RequestContext
            requestContext, String token);
}
