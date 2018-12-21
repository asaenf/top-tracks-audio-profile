package com.asaenf.top;

import java.io.IOException;
import java.util.List;

public interface UserTopTracksResponseConverter {


  List<String> getTopTrackUris(final String response) throws IOException;
}
