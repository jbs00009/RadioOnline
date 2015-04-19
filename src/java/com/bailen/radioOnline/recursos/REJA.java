/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bailen.radioOnline.recursos;

import com.bailen.radioOnline.Cancion;
import com.bailen.radioOnline.Item;
import java.util.ArrayList;

import java.util.List;
import java.util.StringTokenizer;
import java.util.Vector;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;


/**
 *
 * @author tfg
 */
public class REJA {

    Jamendo jamendo;
    
    public REJA() {
        jamendo=new Jamendo();
    }
    
    
    
    public String login(String email){
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
    params.add("email", email);
    String result = new RestTemplate().postForObject( "http://ceatic.ujaen.es:8075/radioapi/v1/login", params, String.class) ;
    return result;
    }
    
    public Cancion[] random(String apiKey){
        HttpHeaders header=new HttpHeaders();
        header.set("Authorization", apiKey);
        HttpEntity entity=new HttpEntity(header);
        String lista=new String();
        HttpEntity<String> response;
        response = new RestTemplate()
                .exchange("http://ceatic.ujaen.es:8075/radioapi/v1/random",HttpMethod.GET,entity, String.class,lista);
      
        String canc= response.getBody();
        StringTokenizer st = new StringTokenizer(canc,"[",true);
        st.nextToken();st.nextToken();
        canc="["+st.nextToken();
        
        try{
            
        ObjectMapper a=new ObjectMapper();
        Item[] listilla= a.readValue(canc, Item[].class);
        Vector<Integer> ids=new Vector<>();
        for(int i=0;i<listilla.length;++i){
            ids.add(listilla[i].getId());
        }
        return jamendo.canciones(ids);
        
        }catch(Exception e){return null;}
        
        //return response.getBody();
        
        
    }
    
    public String recommendations(String apiKey){
        HttpHeaders header=new HttpHeaders();
        header.set("Authorization", apiKey);
        HttpEntity entity=new HttpEntity(header);
        String lista=new String();
        HttpEntity<String> response;
        response = new RestTemplate()
                .exchange("http://ceatic.ujaen.es:8075/radioapi/v1/recommendations",HttpMethod.GET,entity, String.class,lista);
      
        return response.getBody();
    }
    
    public String favourites(String apiKey){
        HttpHeaders header=new HttpHeaders();
        header.set("Authorization", apiKey);
        HttpEntity entity=new HttpEntity(header);
        String lista=new String();
        HttpEntity<String> response;
        response = new RestTemplate()
                .exchange("http://ceatic.ujaen.es:8075/radioapi/v1/favourites",HttpMethod.GET,entity, String.class,lista);
      
        return response.getBody();
    }
}
