/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bailen.radioOnline.servlet;

import com.bailen.radioOnline.Cancion;
import com.bailen.radioOnline.Usuario;
import com.bailen.radioOnline.recursos.Jamendo;
import com.bailen.radioOnline.recursos.REJA;
import java.io.File;
import java.util.ArrayList;
import java.util.Vector;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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

    public servlet() {
        reja = new REJA();
        jamendo = new Jamendo();
        usuario= new Usuario();
        usuario.setApiKey("717c03766e5fafba6ecf4781338a7547");
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
       
        return new ModelAndView("identificado");
    }

    @RequestMapping(value = "/random", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody ModelAndView random(ModelAndView model) {

        ArrayList<Cancion> canciones=new ArrayList<>();
        Cancion[] inter=reja.random(usuario.getApiKey());
        for(int i=0;i<inter.length;++i){
            canciones.add(inter[i]);
        }
        int cont=0;
        model.addObject("cont", cont) ;
        model.addObject("canciones", canciones) ;
        return model;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody
    String login() {

        usuario.setEmail("gasparbailen@gmail.com");
        return reja.login(usuario.getEmail());
    }

    @RequestMapping(value = "/recommendations", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody
    String recommendations() {

        return reja.recommendations(usuario.getApiKey());
    }

    @RequestMapping(value = "/favourites", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody
    String favourites() {

        return reja.favourites(usuario.getApiKey());
    }

    @RequestMapping(value = "/canciones", method = RequestMethod.GET, produces = "application/json")
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
        
    }

}
