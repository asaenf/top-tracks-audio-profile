package com.asaenf.profiling;

import com.asaenf.authorisation.AuthorisationProvider;
import com.asaenf.model.AudioProfile;
import com.asaenf.top.TopTracksProvider;
import com.spotify.apollo.RequestContext;

import java.util.List;

public class ProfilingService {

    private final ProfilingDataProvider profilingDataProvider;
    private final TopTracksProvider topTracksProvider;
    private final AuthorisationProvider authorisationProvider;

    public ProfilingService(final ProfilingDataProvider profilingDataProvider, final TopTracksProvider topTracksProvider, final AuthorisationProvider authorisationProvider) {
        this.profilingDataProvider = profilingDataProvider;
        this.topTracksProvider = topTracksProvider;
        this.authorisationProvider = authorisationProvider;
    }


    public List<AudioProfile> getAudioProfiles(final RequestContext context) {
        final String token = authorisationProvider.authoriseUser();
        final List<String> topTrackIds = topTracksProvider.getTopTracksIds(context, token);
        final List<AudioProfile> audioProfiles = profilingDataProvider.getAudioProfilesForTracks(topTrackIds, context, token);
        return audioProfiles;
    }


}
