/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bailen.radioOnline.servlet;

import com.bailen.radioOnline.recursos.Jamendo;
import com.bailen.radioOnline.recursos.REJA;
import java.io.File;
import java.util.Vector;
import org.springframework.stereotype.Controller;
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

    public servlet() {
        reja = new REJA();
        jamendo = new Jamendo();
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

    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/html")
    public @ResponseBody ModelAndView portada() {
       
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/random", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody
    String random() {

        return reja.random("717c03766e5fafba6ecf4781338a7547");
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody
    String login() {

        return reja.login("gasparbailen@gmail.com");
    }

    @RequestMapping(value = "/recommendations", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody
    String recommendations() {

        return reja.recommendations("717c03766e5fafba6ecf4781338a7547");
    }

    @RequestMapping(value = "/favourites", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody
    String favourites() {

        return reja.favourites("717c03766e5fafba6ecf4781338a7547");
    }

    @RequestMapping(value = "/canciones", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody
    String canc() {

        Vector<Integer> ids = new Vector<Integer>();
        ids.add(1084838);
        ids.add(1036981);
        ids.add(1029393);

        return jamendo.canciones(ids).toString();
    }

}
