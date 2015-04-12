/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bailen.radioOnline.recursos;

import com.bailen.radioOnline.Cancion;
import java.util.StringTokenizer;

import java.util.Vector;
import org.codehaus.jackson.map.ObjectMapper;

import org.springframework.web.client.RestTemplate;

/**
 *
 * @author tfg
 */
public class Jamendo {

    public Jamendo() {
    }
    
    
    
    public Cancion[] canciones(Vector<Integer> ids) {
        String url = "http://api.jamendo.com/v3.0/tracks/?client_id=567e43c5&format=jsonpretty&limit=10&imagesize=600&id=";
	for(Integer id: ids){
            url += id + "+";
	}
		
	String canc= new RestTemplate().getForObject(url, String.class, url);
        StringTokenizer st = new StringTokenizer(canc,"[",true);
        st.nextToken();st.nextToken();
        canc="["+st.nextToken();
        try{
            
        ObjectMapper a=new ObjectMapper();
        Cancion[] listilla= a.readValue(canc, Cancion[].class);
        return listilla;
        
        }catch(Exception e){return null;}
        
    }
    
}
