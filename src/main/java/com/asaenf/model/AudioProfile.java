package com.asaenf.model;

import java.util.Objects;

public class AudioProfile {

  private double danceability;
  private double energy;
  private double key;
  private double loudness;
  private double mode;
  private double speechiness;
  private double acousticness;
  private double instrumentalness;
  private double liveness;
  private double valence;
  private double tempo;
  private String type;
  private String id;
  private String uri;
  private String track_href;
  private String analysis_url;
  private double duration_ms;
  private double time_signature;



  private AudioProfile() {
    //needed for jackson
  }

  public AudioProfile(final double danceability, final double energy, final double key, final
  double loudness,
                       final double mode, final double speechiness,
                       final double acousticness, final double instrumentalness, final double liveness,
                       final double valence, final double tempo,
                       final String type, final String id, final String uri,
                       final String track_href,
                       final String analysis_url, final double duration_ms, final double time_signature) {
    this.danceability = danceability;
    this.energy = energy;
    this.key = key;
    this.loudness = loudness;
    this.mode = mode;
    this.speechiness = speechiness;
    this.acousticness = acousticness;
    this.instrumentalness = instrumentalness;
    this.liveness = liveness;
    this.valence = valence;
    this.tempo = tempo;
    this.type = type;
    this.id = id;
    this.uri = uri;
    this.track_href = track_href;
    this.analysis_url = analysis_url;
    this.duration_ms = duration_ms;
    this.time_signature = time_signature;
  }

  public double getDanceability() {
    return danceability;
  }

  public void setDanceability(final double danceability) {
    this.danceability = danceability;
  }

  public double getEnergy() {
    return energy;
  }

  public void setEnergy(final double energy) {
    this.energy = energy;
  }

  public double getKey() {
    return key;
  }

  public void setKey(final double key) {
    this.key = key;
  }

  public double getLoudness() {
    return loudness;
  }

  public void setLoudness(final double loudness) {
    this.loudness = loudness;
  }

  public double getMode() {
    return mode;
  }

  public void setMode(final double mode) {
    this.mode = mode;
  }

  public double getSpeechiness() {
    return speechiness;
  }

  public void setSpeechiness(final double speechiness) {
    this.speechiness = speechiness;
  }

  public double getAcousticness() {
    return acousticness;
  }

  public void setAcousticness(final double acousticness) {
    this.acousticness = acousticness;
  }

  public double getInstrumentalness() {
    return instrumentalness;
  }

  public void setInstrumentalness(final double instrumentalness) {
    this.instrumentalness = instrumentalness;
  }

  public double getLiveness() {
    return liveness;
  }

  public void setLiveness(final double liveness) {
    this.liveness = liveness;
  }

  public double getValence() {
    return valence;
  }

  public void setValence(final double valence) {
    this.valence = valence;
  }

  public double getTempo() {
    return tempo;
  }

  public void setTempo(final double tempo) {
    this.tempo = tempo;
  }

  public String getType() {
    return type;
  }

  public void setType(final String type) {
    this.type = type;
  }

  public String getId() {
    return id;
  }

  public void setId(final String id) {
    this.id = id;
  }

  public String getUri() {
    return uri;
  }

  public void setUri(final String uri) {
    this.uri = uri;
  }

  public String getTrack_href() {
    return track_href;
  }

  public void setTrack_href(final String track_href) {
    this.track_href = track_href;
  }

  public String getAnalysis_url() {
    return analysis_url;
  }

  public void setAnalysis_url(final String analysis_url) {
    this.analysis_url = analysis_url;
  }

  public double getDuration_ms() {
    return duration_ms;
  }

  public void setDuration_ms(final double duration_ms) {
    this.duration_ms = duration_ms;
  }

  public double getTime_signature() {
    return time_signature;
  }

  public void setTime_signature(final double time_signature) {
    this.time_signature = time_signature;
  }

  @Override
  public boolean equals(final Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    final AudioProfile that = (AudioProfile) o;
    return Objects.equals(danceability, that.danceability) &&
           Objects.equals(energy, that.energy) &&
           Objects.equals(key, that.key) &&
           Objects.equals(loudness, that.loudness) &&
           Objects.equals(mode, that.mode) &&
           Objects.equals(speechiness, that.speechiness) &&
           Objects.equals(acousticness, that.acousticness) &&
           Objects.equals(instrumentalness, that.instrumentalness) &&
           Objects.equals(liveness, that.liveness) &&
           Objects.equals(valence, that.valence) &&
           Objects.equals(tempo, that.tempo) &&
           Objects.equals(type, that.type) &&
           Objects.equals(id, that.id) &&
           Objects.equals(uri, that.uri) &&
           Objects.equals(track_href, that.track_href) &&
           Objects.equals(analysis_url, that.analysis_url) &&
           Objects.equals(duration_ms, that.duration_ms) &&
           Objects.equals(time_signature, that.time_signature);
  }

  @Override
  public int hashCode() {

    return Objects
        .hash(danceability, energy, key, loudness, mode, speechiness, acousticness,
            instrumentalness,
            liveness, valence, tempo, type, id, uri, track_href, analysis_url, duration_ms,
            time_signature);
  }

  @Override
  public String toString() {
    return "AudioProfile{" +
           "danceability='" + danceability + '\'' +
           ", energy='" + energy + '\'' +
           ", key='" + key + '\'' +
           ", loudness='" + loudness + '\'' +
           ", mode='" + mode + '\'' +
           ", speechiness='" + speechiness + '\'' +
           ", acousticness='" + acousticness + '\'' +
           ", instrumentalness='" + instrumentalness + '\'' +
           ", liveness='" + liveness + '\'' +
           ", valence='" + valence + '\'' +
           ", tempo='" + tempo + '\'' +
           ", type='" + type + '\'' +
           ", id='" + id + '\'' +
           ", uri='" + uri + '\'' +
           ", track_href='" + track_href + '\'' +
           ", analysis_url='" + analysis_url + '\'' +
           ", duration_ms='" + duration_ms + '\'' +
           ", time_signature='" + time_signature + '\'' +
           '}';
  }
}
