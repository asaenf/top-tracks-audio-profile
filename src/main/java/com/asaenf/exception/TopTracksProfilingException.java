package com.asaenf.exception;

public class TopTracksProfilingException extends RuntimeException{

  public TopTracksProfilingException() {
  }

  public TopTracksProfilingException(final String message) {
    super(message);
  }

  public TopTracksProfilingException(final String message, final Throwable cause) {
    super(message, cause);
  }

  public TopTracksProfilingException(final Throwable cause) {
    super(cause);
  }

  public TopTracksProfilingException(final String message, final Throwable cause,
                                     final boolean enableSuppression,
                                     final boolean writableStackTrace) {
    super(message, cause, enableSuppression, writableStackTrace);
  }
}
