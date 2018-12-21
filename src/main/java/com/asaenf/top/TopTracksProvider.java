package com.asaenf.top;

import com.spotify.apollo.RequestContext;
import java.util.List;

public interface TopTracksProvider {

   List<String> getTopTracksIds(final RequestContext requestContext);
}
