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
public class itemRadios {
    
    private int idItem;

    public itemRadios(@JsonProperty("idItem")int idItem) {
        this.idItem = idItem;
    }

    public itemRadios() {
    }

    public int getIdItem() {
        return idItem;
    }

    public void setIdItem(int idItem) {
        this.idItem = idItem;
    }
    
    
    
}
