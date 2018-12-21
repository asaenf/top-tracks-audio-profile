package com.asaenf.top;

import com.asaenf.exception.TopTracksProfilingException;
import com.spotify.apollo.Request;
import com.spotify.apollo.RequestContext;
import com.spotify.apollo.Response;
import com.spotify.apollo.StatusType;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.CompletionStage;
import okio.ByteString;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HttpTopTracksProvider implements TopTracksProvider{

  private static final Logger LOG = LoggerFactory.getLogger(HttpTopTracksProvider.class);

  private final List<String> validTimeRanges;
  private final String topTracksForUserUrl;
  private final UserTopTracksResponseConverter responseConverter;
  private final int minTracks;
  private final int maxTracks;

  public HttpTopTracksProvider(final List<String> validTimeRanges,
                               final String topTracksForUserUrl,
                               final UserTopTracksResponseConverter responseConverter,
                               final int minTracks, final int maxTracks) {
    this.validTimeRanges = validTimeRanges;
    this.topTracksForUserUrl = topTracksForUserUrl;
    this.responseConverter = responseConverter;
    this.minTracks = minTracks;
    this.maxTracks = maxTracks;
  }

  public List<String> getTopTracksIds(final RequestContext requestContext) {
    final int tracksToGet = getTopN(requestContext);
    final String timeRange = getTimeRange(requestContext);
    final String topTracksUrl =
        topTracksForUserUrl + "?limit=" + tracksToGet + "&time_range=" + timeRange;

    LOG.info("Getting user top tracks using URL", topTracksUrl);

    final CompletionStage<Response<ByteString>> responseFuture =
        requestContext.requestScopedClient().send(Request.forUri(topTracksUrl, "GET"));

    final Response<ByteString> resp;
    try{
      resp = responseFuture.toCompletableFuture().get();
      }catch (final Exception e){
      throw new TopTracksProfilingException("Unable to get top tracks for current user", e);
    }
    if (resp.status().family().equals(StatusType.Family.SUCCESSFUL) && resp.payload().isPresent()) {
      return getTrackUrisFromPayload(resp.payload().get());
    }else{
      throw new TopTracksProfilingException("Unable to get top tracks for current user");
    }
  }

  private List<String> getTrackUrisFromPayload(final ByteString payload) {
    try {
      return responseConverter.getTopTrackUris(payload.utf8());
    } catch (final IOException e) {
      LOG.error("Unable to parse top tracks response", e);
      throw new TopTracksProfilingException("Unable to parse top tracks response", e);
    }
  }

  private int getTopN(final RequestContext context) {
    int topN = 10;
    if (context.request().parameter("n").isPresent()) {
      final String topNParam = context.request().parameter("n").get();
      try {
        topN = Integer.parseInt(topNParam);
        if(topN<=maxTracks && topN>=minTracks){
          return topN;
        }
       else{
          throw new IllegalArgumentException("Can only request between 1 and 50 songs");
        }
      } catch (final NumberFormatException e) {
        final String message = "Query parameter 'n' not a valid integer:\" + topNParam";
        LOG.error(message);
        throw new IllegalArgumentException(message);
      }
    }
    LOG.debug("Using default top N value");
    return topN;
  }

  private String getTimeRange(final RequestContext context) {
    String timeRange = "medium_term";
    if (context.request().parameter("time_range").isPresent()) {
      final String range = context.request().parameter("time_range").get();
      if (validTimeRanges.contains(range)) {
        timeRange = range;
      } else {
        final String message = "Query parameter 'time_range' not a valid range:" + range;
        LOG.error(message);
        throw new IllegalArgumentException(message);
      }
    }
    LOG.debug("Using default time range value");
    return timeRange;
  }
}
