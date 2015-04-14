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

    public REJA() {
    }
    
    
    
    public String login(String email){
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
    params.add("email", email);
    String result = new RestTemplate().postForObject( "http://ceatic.ujaen.es:8075/radioapi/v1/login", params, String.class) ;
    return result;
    }
    
    public String random(String apiKey){
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
        return Integer.toString(listilla[0].getId());
        
        }catch(Exception e){return e.getLocalizedMessage();}
        
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
