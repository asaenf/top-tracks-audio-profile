package com.asaenf.top;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class JsonUserTopTracksResponseConverter implements UserTopTracksResponseConverter {

  private final ObjectMapper mapper;

  public JsonUserTopTracksResponseConverter(final ObjectMapper mapper) {
    this.mapper = mapper;
  }

  @Override
  public List<String> getTopTrackUris(final String response) throws IOException {
    final Map<String, Object>
        resp = mapper.readValue(response, new TypeReference<Map<String, Object>>()
    {});
    final List<Map<String, Object>> topItems = (List<Map<String, Object>> )resp.get("items");
    return topItems.stream().map(item -> (String)item.get("uri")).collect(Collectors.toList());
  }
}
