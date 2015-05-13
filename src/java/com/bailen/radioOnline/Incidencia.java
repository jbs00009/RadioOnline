/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bailen.radioOnline;

import org.codehaus.jackson.annotate.JsonProperty;

/**
 *
 * @author tfg
 */
public class Incidencia {
    
    Boolean error;
    String message;

    public Incidencia(@JsonProperty("error") Boolean error,@JsonProperty("message") String message) {
        this.error = error;
        this.message = message;
    }

    public Incidencia() {
    }

    public Boolean getError() {
        return error;
    }

    public void setError(Boolean error) {
        this.error = error;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

   
    
    
}
