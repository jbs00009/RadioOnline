/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bailen.radioOnline.recursos;

import com.bailen.radioOnline.Cancion;
import com.bailen.radioOnline.Incidencia;
import com.bailen.radioOnline.Item;
import com.bailen.radioOnline.ItemPuntu;
import com.bailen.radioOnline.Usuario;
import com.bailen.radioOnline.itemRadios;
import java.io.IOException;
import java.util.StringTokenizer;
import java.util.Vector;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
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
        jamendo = new Jamendo();
    }
//Metodos post
    public Usuario login(String email) {
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("email", email);
        String result = new RestTemplate().postForObject("http://sinbad2.ujaen.es/apiradio/v2/login", params, String.class);
        //return result;
        
        try {

            ObjectMapper a = new ObjectMapper();
            Usuario listilla = a.readValue(result, Usuario.class);
            return listilla;

        } catch (Exception e) {
            return null;
        }
        
    }
    
    public Incidencia ratings(String apiKey,String rating,String idCancion,String fav) {
        MultiValueMap<String, String> params1 = new LinkedMultiValueMap<>();
        params1.add("rating", (rating));
        params1.add("idCancion", (idCancion));
        params1.add("fav", (fav));
        
        HttpHeaders headers=new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        headers.add("Authorization", apiKey);
        
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params1, headers);
        
        String result = new RestTemplate().postForObject("http://sinbad2.ujaen.es/apiradio/v2/ratings", request, String.class);
                        
        try {

            ObjectMapper a = new ObjectMapper();
            Incidencia listilla = a.readValue(result, Incidencia.class);
            return listilla;

        } catch (Exception e) {
            return null;
            
        }
        
    }
//Metodos get
    public Cancion[] random(String apiKey) throws IOException{
        HttpHeaders header = new HttpHeaders();
        header.set("Authorization", apiKey);
        HttpEntity entity = new HttpEntity(header);
        String lista = new String();
        HttpEntity<String> response;
        response = new RestTemplate()
                .exchange("http://sinbad2.ujaen.es/apiradio/v2/random", HttpMethod.GET, entity, String.class, lista);

        String canc = response.getBody();
        StringTokenizer st = new StringTokenizer(canc, "[", true);
        st.nextToken();
        st.nextToken();
        canc = "[" + st.nextToken();

        try {

            ObjectMapper a = new ObjectMapper();
            Item[] listilla = a.readValue(canc, Item[].class);
            Vector<Integer> ids = new Vector<>();
            for (int i = 0; i < listilla.length; ++i) {
                ids.add(listilla[i].getId());
            }
            return jamendo.canciones(ids);

        } catch (Exception e) {
            //return null;
            throw new IOException("no se han recibido canciones");
        }

    }
    
    public Cancion[] getRatings(String apiKey) throws IOException{
        HttpHeaders header = new HttpHeaders();
        header.set("Authorization", apiKey);
        HttpEntity entity = new HttpEntity(header);
        String lista = new String();
        HttpEntity<String> response;
        response = new RestTemplate()
                .exchange("http://sinbad2.ujaen.es/apiradio/v2/ratings", HttpMethod.GET, entity, String.class, lista);

        String canc = response.getBody();
        StringTokenizer st = new StringTokenizer(canc, "[", true);
        st.nextToken();
        st.nextToken();
        canc = "[" + st.nextToken();

        try {

            ObjectMapper a = new ObjectMapper();
            ItemPuntu[] listilla = a.readValue(canc, ItemPuntu[].class);
            Vector<Integer> ids = new Vector<>();
            Vector<Cancion> punt=new Vector<>();
            //como jamendo solo devuelve 10 canciones llamamos las veces necesarias
            for(int i=0;i<(listilla.length/10)+1;++i){
                ids.clear();
                //aunque le mandemos mas ids de la cuenta solo devolvera las 10 primeras canciones y 
                //de esta forma controlamos el desborde
                for(int j=i*10;j<listilla.length;++j){
                    ids.add(listilla[j].getId());
                }
                Cancion[] listilla1= jamendo.canciones(ids);
                for(int k=0;k<listilla1.length;++k){
                    punt.add(listilla1[k]);
                }
            }
            
            
            for(int i=0;i<punt.size();++i){
                punt.get(i).setRating(listilla[i].getRating());
                punt.get(i).setFav(listilla[i].getFav());
            }
            
            return punt.toArray(new Cancion[punt.size()]);
            
        } catch (Exception e) {
            //return null;
            throw new IOException("no se han recibido canciones");
        }

    }

    public Cancion[] recommendations(String apiKey) throws IOException{
        HttpHeaders header = new HttpHeaders();
        header.set("Authorization", apiKey);
        HttpEntity entity = new HttpEntity(header);
        String lista = new String();
        HttpEntity<String> response;
        response = new RestTemplate()
                .exchange("http://sinbad2.ujaen.es/apiradio/v2/recommendations", HttpMethod.GET, entity, String.class, lista);

        String canc = response.getBody();
        StringTokenizer st = new StringTokenizer(canc, "[", true);
        st.nextToken();
        st.nextToken();
        canc = "[" + st.nextToken();

        try {

            ObjectMapper a = new ObjectMapper();
            itemRadios[] listilla = a.readValue(canc, itemRadios[].class);
            Vector<Integer> ids = new Vector<>();
            for (int i = 0; i < listilla.length; ++i) {
                ids.add(listilla[i].getIdItem());
            }
            return jamendo.canciones(ids);

        } catch (Exception e) {
            throw new IOException("no se han recibido canciones");
        }
    }
    
    public Cancion[] artistFav(String apiKey) throws IOException{
        HttpHeaders header = new HttpHeaders();
        header.set("Authorization", apiKey);
        HttpEntity entity = new HttpEntity(header);
        String lista = new String();
        HttpEntity<String> response;
        response = new RestTemplate()
                .exchange("http://sinbad2.ujaen.es/apiradio/v2/favouriteArtists", HttpMethod.GET, entity, String.class, lista);

        String canc = response.getBody();
        StringTokenizer st = new StringTokenizer(canc, "[", true);
        st.nextToken();
        st.nextToken();
        canc = "[" + st.nextToken();

        try {

            ObjectMapper a = new ObjectMapper();
            Item[] listilla = a.readValue(canc, Item[].class);
            Vector<Integer> ids = new Vector<>();
            for (int i = 0; i < listilla.length; ++i) {
                ids.add(listilla[i].getId());
            }
            return jamendo.canciones(ids);

        } catch (Exception e) {
            throw new IOException("no se han recibido canciones");
        }
    }

    public Cancion[] favourites(String apiKey) throws IOException{
        HttpHeaders header = new HttpHeaders();
        header.set("Authorization", apiKey);
        HttpEntity entity = new HttpEntity(header);
        String lista = new String();
        HttpEntity<String> response;
        response = new RestTemplate()
                .exchange("http://sinbad2.ujaen.es/apiradio/v2/favourites", HttpMethod.GET, entity, String.class, lista);

        String canc = response.getBody();
        StringTokenizer st = new StringTokenizer(canc, "[", true);
        st.nextToken();
        st.nextToken();
        canc = "[" + st.nextToken();
        
        try {
            ObjectMapper a = new ObjectMapper();
            Item[] listilla = a.readValue(canc, Item[].class);
            Vector<Integer> ids = new Vector<>();
            for (int i = 0; i < listilla.length; ++i) {
                ids.add(listilla[i].getId());
            }
            return jamendo.canciones(ids);

        } catch (Exception e) {
            throw new IOException("no se han recibido canciones");
        }
    }
}
