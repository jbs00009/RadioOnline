package com.bailen.radioOnline;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Usuario {

    String name;
    String email;
    String photoUrl;
    String token;
    String apiKey;
    String token2;

    public Usuario(@JsonProperty("apiKey") String apiKey) {
        this.apiKey = apiKey;
    }

    public Usuario() {

    }

    public Usuario(String aname, String aemail, String aphoto, String aprofile) {
        this.name = aname;
        this.email = aemail;
        this.photoUrl = aphoto;
        this.token = aprofile;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getToken2() {
        return token2;
    }

    public void setToken2(String token2) {
        this.token2 = token2;
    }

    public String getApiKey() {
        return apiKey;
    }

    public void setApiKey(String apiKey) {
        this.apiKey = apiKey;
    }

}
