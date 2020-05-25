package com.example.homew72.controller;

import com.example.homew72.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.time.LocalDateTime;

@Controller
public class MainController {

    @Autowired
    UserRepository ur;

    @RequestMapping("/")
    public String mainPage(Model model, Principal principal, HttpServletRequest uriBuilder, Pageable page, @RequestParam(value = "page",defaultValue = "") String p){
        var uri = uriBuilder.getRequestURI();

        try{
            var user = ur.findUserByMail(principal.getName());
            model.addAttribute("user",user);
        }catch (NullPointerException e){
            model.addAttribute("nouser",true);
        }
        return "index";
    }
}
