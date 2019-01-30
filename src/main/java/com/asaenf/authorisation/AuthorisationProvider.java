package com.asaenf.authorisation;

import com.asaenf.exception.TopTracksProfilingException;
import com.wrapper.spotify.SpotifyApi;
import com.wrapper.spotify.SpotifyHttpManager;
import com.wrapper.spotify.exceptions.SpotifyWebApiException;
import com.wrapper.spotify.model_objects.credentials.AuthorizationCodeCredentials;
import com.wrapper.spotify.requests.authorization.authorization_code.AuthorizationCodeRequest;
import com.wrapper.spotify.requests.authorization.authorization_code.AuthorizationCodeUriRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.awt.*;
import java.io.IOException;
import java.net.URI;

public class AuthorisationProvider {


    private final URI redirectUri;

    private static final Logger LOGGER = LoggerFactory.getLogger(AuthorisationProvider.class);
    private final CodeHolder codeHolder;

    private final SpotifyApi spotifyApi;
    private final AuthorizationCodeUriRequest authorizationCodeUriRequest;

    public AuthorisationProvider(final String clientId, final String clientSecret, final String state, final String scopes, final String redirectUri, final CodeHolder codeHolder) {
        this.redirectUri = SpotifyHttpManager.makeUri(redirectUri);
        this.codeHolder = codeHolder;
        spotifyApi = new SpotifyApi.Builder()
                .setClientId(clientId)
                .setClientSecret(clientSecret)
                .setRedirectUri(this.redirectUri)
                .build();
        authorizationCodeUriRequest = spotifyApi.authorizationCodeUri()
                .state(state)
                .scope(scopes)
                .show_dialog(true)
                .build();
    }

    public String authoriseUser() {
        LOGGER.info("Asking user to authorise");
        initiateAuthorisation();
        synchronized (codeHolder) {
            try {
                LOGGER.info("Waiting for code callback");
                codeHolder.wait();
            } catch (final InterruptedException e) {
                e.printStackTrace();
            }
        }

        final String code = codeHolder.getAndClearToken();
        LOGGER.info("Got code, requesting token");
        final AuthorizationCodeRequest authorizationCodeRequest = spotifyApi.authorizationCode(code)
                .build();
        try {
            final AuthorizationCodeCredentials creds = authorizationCodeRequest.execute();
            LOGGER.info("Token request completed");
            return creds.getAccessToken();
        } catch (final IOException | SpotifyWebApiException e) {
            throw new TopTracksProfilingException("Unable to get access token", e);
        }
    }

    private void initiateAuthorisation() {
        final URI uri = authorizationCodeUriRequest.execute();
        if (Desktop.isDesktopSupported() && Desktop.getDesktop().isSupported(Desktop.Action.BROWSE)) {
            try {
                Desktop.getDesktop().browse(uri);
            } catch (final IOException e) {
                throw new TopTracksProfilingException("Can not open window for user to authorise", e);
            }
        }
    }

}
