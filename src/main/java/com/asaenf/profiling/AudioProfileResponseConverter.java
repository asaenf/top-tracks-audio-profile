package com.asaenf.profiling;


import com.asaenf.model.AudioProfile;
import java.io.IOException;
import java.util.List;

public interface AudioProfileResponseConverter {

  List<AudioProfile> getAudioProfile(final String response) throws IOException;
}
