package com.asaenf.authorisation;

public class CodeHolder {

    protected String token = "";

    public synchronized boolean hasToken() {
        return !this.token.isEmpty();
    }

    public synchronized void setToken(final String token) {
        this.token = token;
    }

    public synchronized String getAndClearToken() {
        final String tokenToReturn = this.token;
        this.token = "";
        return tokenToReturn;
    }
}
