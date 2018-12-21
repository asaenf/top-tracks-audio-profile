package com.asaenf.profiling;

import com.asaenf.model.AudioProfile;
import java.util.List;

public interface TrackProfiles {


  List<AudioProfile> getAudioProfilesForTracks(List<String> trackIds);


}
