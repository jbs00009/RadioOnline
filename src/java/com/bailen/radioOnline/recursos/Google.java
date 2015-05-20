/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bailen.radioOnline.recursos;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson.JacksonFactory;
import com.google.api.services.plus.Plus;
import com.google.api.services.plus.model.Person;
import com.google.gson.Gson;
import java.io.IOException;

/**
 *
 * @author tfg
 */
public class Google {

    private static final HttpTransport TRANSPORT = new NetHttpTransport();

    /*
     * Default JSON factory to use to deserialize JSON.
     */
    private static final JacksonFactory JSON_FACTORY = new JacksonFactory();

    /*
     * Gson object to serialize JSON responses to requests to this servlet.
     */
    private static final Gson GSON = new Gson();

    /*
     * This is the Client ID that you generated in the API Console.
     */
    private static final String CLIENT_ID = "579659090224-bdget8j5n88t9v5uuokvqabior0opv8p.apps.googleusercontent.com";

    /*
     * This is the Client Secret that you generated in the API Console.
     */
    private static final String CLIENT_SECRET = "J2i5ZKKECM6F2JJBNFKnc7EX";

    public Person getPerson(String tokenData) {

        try {
            GoogleCredential credential = new GoogleCredential.Builder()
                    .setJsonFactory(JSON_FACTORY)
                    .setTransport(TRANSPORT)
                    .setClientSecrets(CLIENT_ID, CLIENT_SECRET).build()
                    .setAccessToken(tokenData);
            // Create a new authorized API client.
            Plus service = new Plus.Builder(TRANSPORT, JSON_FACTORY, credential)
                    .build();
            Person a = service.people().get("me").execute();
            return a;
            
        } catch (IOException e) {
            return null;
        }

    }

}
