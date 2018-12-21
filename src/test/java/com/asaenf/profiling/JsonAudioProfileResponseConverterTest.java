package com.asaenf.profiling;

import static org.assertj.core.api.Assertions.assertThat;

import com.asaenf.model.AudioProfile;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.util.List;
import org.junit.Before;
import org.junit.Test;

public class JsonAudioProfileResponseConverterTest {

  String jsonResponse =
      "{\n"
          + "  \"audio_features\": [\n"
          + "    {\n"
          + "      \"danceability\": 0.808,\n"
          + "      \"energy\": 0.626,\n"
          + "      \"key\": 7,\n"
          + "      \"loudness\": -12.733,\n"
          + "      \"mode\": 1,\n"
          + "      \"speechiness\": 0.168,\n"
          + "      \"acousticness\": 0.00187,\n"
          + "      \"instrumentalness\": 0.159,\n"
          + "      \"liveness\": 0.376,\n"
          + "      \"valence\": 0.37,\n"
          + "      \"tempo\": 123.99,\n"
          + "      \"type\": \"audio_features\",\n"
          + "      \"id\": \"4JpKVNYnVcJ8tuMKjAj50A\",\n"
          + "      \"uri\": \"spotify:track:4JpKVNYnVcJ8tuMKjAj50A\",\n"
          + "      \"track_href\": \"https://api.spotify.com/v1/tracks/4JpKVNYnVcJ8tuMKjAj50A\",\n"
          + "      \"analysis_url\": \"https://api.spotify.com/v1/audio-analysis/4JpKVNYnVcJ8tuMKjAj50A\",\n"
          + "      \"duration_ms\": 535223,\n"
          + "      \"time_signature\": 4\n"
          + "    }\n"
          + "  ]\n"
          + "}";

  String jsonResponseWithNullEntries =
      "{\n"
          + "  \"audio_features\": [\n"
          + "    {\n"
          + "      \"danceability\": 0.808,\n"
          + "      \"energy\": 0.626,\n"
          + "      \"key\": 7,\n"
          + "      \"loudness\": -12.733,\n"
          + "      \"mode\": 1,\n"
          + "      \"speechiness\": 0.168,\n"
          + "      \"acousticness\": 0.00187,\n"
          + "      \"instrumentalness\": 0.159,\n"
          + "      \"liveness\": 0.376,\n"
          + "      \"valence\": 0.37,\n"
          + "      \"tempo\": 123.99,\n"
          + "      \"type\": \"audio_features\",\n"
          + "      \"id\": \"4JpKVNYnVcJ8tuMKjAj50A\",\n"
          + "      \"uri\": \"spotify:track:4JpKVNYnVcJ8tuMKjAj50A\",\n"
          + "      \"track_href\": \"https://api.spotify.com/v1/tracks/4JpKVNYnVcJ8tuMKjAj50A\",\n"
          + "      \"analysis_url\": \"https://api.spotify.com/v1/audio-analysis/4JpKVNYnVcJ8tuMKjAj50A\",\n"
          + "      \"duration_ms\": 535223,\n"
          + "      \"time_signature\": 4\n"
          + "    },\n"
          + "    null\n"
          + "  ]\n"
          + "}";


  AudioProfile expected = new AudioProfile(0.808, 0.626, 7, -12.733, 1, 0.168, 0.00187,0.159,
      0.376,0.37,123.99,"audio_features", "4JpKVNYnVcJ8tuMKjAj50A",
      "spotify:track:4JpKVNYnVcJ8tuMKjAj50A",
      "https://api.spotify.com/v1/tracks/4JpKVNYnVcJ8tuMKjAj50A",
      "https://api.spotify.com/v1/audio-analysis/4JpKVNYnVcJ8tuMKjAj50A", 535223, 4 );

  JsonAudioProfileResponseConverter converter;

  @Before
  public void setUp(){
    converter = new JsonAudioProfileResponseConverter(new ObjectMapper());
  }


  @Test
  public void jsonResponseIsParsedToJavaObject() throws IOException {

    final List<AudioProfile> profile =
        converter.getAudioProfile(jsonResponse);

    assertThat(profile).hasSize(1);
    assertThat(profile.get(0)).isEqualTo(expected);


  }

  @Test
  public void responseWithNullEntriesAreProcessedCorrectly() throws IOException {
    final List<AudioProfile> profile =
        converter.getAudioProfile(jsonResponseWithNullEntries);

    assertThat(profile).hasSize(2);
    assertThat(profile).containsExactlyInAnyOrder(null, expected);
  }

}
