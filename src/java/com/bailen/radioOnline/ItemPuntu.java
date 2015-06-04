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
public class ItemPuntu {
    
    int id;
    int rating;
    Boolean fav;
    
    public ItemPuntu(@JsonProperty("_id")int id,@JsonProperty("rating")int rating,@JsonProperty("fav")int fav){
        this.id=id;
        this.rating=rating;
        this.fav = fav==1;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Boolean getFav() {
        return fav;
    }

    public void setFav(Boolean fav) {
        this.fav = fav;
    }
    
    
}
