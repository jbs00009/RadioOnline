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
public class Item {
    
    private int _id;

    public Item() {
    }

    public Item(@JsonProperty("_id")int _id) {
        this._id = _id;
    }

    public int getId() {
        return _id;
    }

    public void setId(int _id) {
        this._id = _id;
    }
    
    
}
