/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bailen.radioOnline.servlet;

import com.bailen.radioOnline.Cancion;
import com.bailen.radioOnline.Incidencia;
import com.bailen.radioOnline.Usuario;
import com.bailen.radioOnline.recursos.Jamendo;
import com.bailen.radioOnline.recursos.REJA;
import java.io.File;
import java.util.ArrayList;
import java.util.Vector;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

/**
 *
 * @author tfg
 */
@Controller
@RequestMapping("/")
public class servlet {

    private REJA reja;
    private Jamendo jamendo;
    Usuario usuario;
    ArrayList<Cancion> canc;
    int cancActual;
  
    public servlet() {
        reja = new REJA();
        jamendo = new Jamendo();
        usuario= new Usuario();
        usuario.setApiKey("717c03766e5fafba6ecf4781338a7547");
        canc=new ArrayList<>();
        cancActual=0;
    }

    public REJA getReja() {
        return reja;
    }

    public void setReja(REJA reja) {
        this.reja = reja;
    }

    public Jamendo getJamendo() {
        return jamendo;
    }

    public void setJamendo(Jamendo jamendo) {
        this.jamendo = jamendo;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/html")
    public @ResponseBody ModelAndView portada() {
       
        ModelAndView model=new ModelAndView("index");
        model=random(model);
        return model;
    }
    
    @RequestMapping(value = "/identificado", method = RequestMethod.GET, produces = "text/html")
    public @ResponseBody ModelAndView identificado() {
       
        ModelAndView model=new ModelAndView("identificado");
        cancActual=0;
        model.addObject("actual",cancActual);
        model=random(model);
        
        
        
        return model;
    }

    @RequestMapping(value = "/random", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody ModelAndView random(ModelAndView model) {

        usuario.setApiKey("717c03766e5fafba6ecf4781338a7547");
        ArrayList<Cancion> canciones=new ArrayList<>();
        Cancion[] inter=reja.random(usuario.getApiKey());
        for(int i=0;i<inter.length;++i){
            canciones.add(inter[i]);
        }
        int cont=0;
        model.addObject("cont", cont) ;
        model.addObject("canciones", canciones) ;
        canc=(ArrayList<Cancion>)canciones.clone();
        cancActual=0;
        model.addObject("actual",cancActual);
        return model;
    }
    
    @RequestMapping(value = "/ratings/{rating}/{idCancion}/{fav}", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody ModelAndView ratings(@PathVariable String rating, @PathVariable String idCancion, @PathVariable String fav) {
        
        int cancActual=-1;
        Incidencia error=reja.ratings(usuario.getApiKey(), rating, idCancion, fav);
        for(int i=0; i<canc.size();++i){
            if(canc.get(i).getId()==Integer.parseInt(idCancion)){
                cancActual=i;
            }
        }
        if (error.getError()){
            ModelAndView model=new ModelAndView("identificado");
            model.addObject("canciones", canc);
            model.addObject("actual",cancActual);
            model.addObject("error",error.getMessage());
            return model;
        }else{
            ModelAndView model=new ModelAndView("identificado");
            model.addObject("canciones", canc);
            model.addObject("actual",cancActual);
            model.addObject("error","la puntuacion se realizo correctamente");
            return model;
        }
    }
    
    /*@RequestMapping(value = "/ratings/{rating}/{idCancion}/{fav}", method = RequestMethod.GET, produces = "application/json")
    public void ratings(HttpServletRequest req, HttpServletResponse resp, ModelAndView model) {
        
        Incidencia error=reja.ratings(usuario.getApiKey(), (String)req.getAttribute("rating"), (String)req.getAttribute("idCancion"), (String)req.getAttribute("fav"));
        if (error.getError()){
            model.addObject("error",error.getMessage());
            
        }else{
            
            model.addObject("error","la puntuacion se realizo correctamente");
            
        }
    }*/
    
    @RequestMapping(value = "/randomId", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody ModelAndView randomId() {

        ArrayList<Cancion> canciones=new ArrayList<>();
        Cancion[] inter=reja.random(usuario.getApiKey());
        for(int i=0;i<inter.length;++i){
            canciones.add(inter[i]);
        }
        ModelAndView model=new ModelAndView("identificado");
        model.addObject("canciones", canciones) ;
        canc=(ArrayList<Cancion>)canciones.clone();
        cancActual=0;
        model.addObject("actual",cancActual);
        
        return model;
    }

    @RequestMapping(value = "/login/{email}", method = RequestMethod.GET, produces = "application/json")
    public 
    String login(@PathVariable String email) {

        usuario.setEmail(email);
        usuario.setApiKey(reja.login(usuario.getEmail()).getApiKey());
        
        
        return "redirect:/identificado";
    }

    @RequestMapping(value = "/recommendations", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody
    ModelAndView recommendations() {

        ArrayList<Cancion> canciones=new ArrayList<>();
        Cancion[] inter=reja.recommendations(usuario.getApiKey());
        for(int i=0;i<inter.length;++i){
            canciones.add(inter[i]);
        }
        ModelAndView model=new ModelAndView("identificado");
        model.addObject("canciones", canciones) ;
        canc=(ArrayList<Cancion>)canciones.clone();
        cancActual=0;
        model.addObject("actual",cancActual);
        
        return model;
        
    }

    @RequestMapping(value = "/favourites", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody
    ModelAndView favourites() {

         ArrayList<Cancion> canciones=new ArrayList<>();
        Cancion[] inter=reja.favourites(usuario.getApiKey());
        for(int i=0;i<inter.length;++i){
            canciones.add(inter[i]);
        }
        ModelAndView model=new ModelAndView();
        model.addObject("canciones", canciones) ;
        canc=(ArrayList<Cancion>)canciones.clone();
        cancActual=0;
        model.addObject("actual",cancActual);
        
        return model;
        
       
    }

    /*@RequestMapping(value = "/canciones", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody
    String canc() {

        Vector<Integer> ids = new Vector<Integer>();
        ids.add(1084838);
        ids.add(1036981);
        ids.add(1029393);
        
        String ret=new String();
        Cancion[] vec=jamendo.canciones(ids);
        for( int i=0;i<vec.length;i++){
            ret+=vec[i].toString()+"/n";
        }
        return ret;
        
    }*/

}
