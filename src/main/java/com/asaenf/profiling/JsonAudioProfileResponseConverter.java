package com.asaenf.profiling;

import com.asaenf.model.AudioProfile;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class JsonAudioProfileResponseConverter implements AudioProfileResponseConverter {

  private final ObjectMapper mapper;

  public JsonAudioProfileResponseConverter(final ObjectMapper mapper) {this.mapper = mapper;}

  public List<AudioProfile> getAudioProfile(final String response) throws IOException {

    final Map<String, Object> resp = mapper.readValue(response, new TypeReference<Map<String, Object>>()
    {});
    final List<Object> audioProfilesJson = (List<Object>)resp.get("audio_features");
    final List<AudioProfile> audioprofiles =
        mapper.convertValue(audioProfilesJson, new TypeReference<List<AudioProfile>>() {});

    return audioprofiles;
  }
}
