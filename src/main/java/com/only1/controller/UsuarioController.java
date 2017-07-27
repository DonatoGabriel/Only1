package com.only1.controller;

import com.only1.domain.Usuario;
import com.only1.service.impl.UsuarioServiceImpl;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Scope("session")
public class UsuarioController {

    @Autowired
    private UsuarioServiceImpl usuarioServiceImpl;
    private Usuario usuario;

    @RequestMapping("/")
    public String index(HttpSession session) {
        if (session.getAttribute("usuario") != null) {
            return "home";
        } else {
            return "index";
        }
    }

    @PostMapping("/save")
    public String save(Usuario usuario, HttpSession session) {
        usuarioServiceImpl.saveUser(usuario);
        session.setAttribute("usuario", usuario); //Guadar usuario en session;
        return "redirect:/";
    }

    @PostMapping("/login")
    public String login(Usuario user, HttpSession session) {
        usuario = usuarioServiceImpl.findUserByUsernameAndUsuarioPass(user.getUsername(), user.getUsuario_pass());
        if (usuario != null) {
            session.setAttribute("usuario", usuario);
        }
        return "redirect:/";
    }
    
    @RequestMapping("/signout")
    public String signout(HttpSession session){
        session.removeAttribute("usuario");
        return "redirect:/";
    }
    
    @RequestMapping("/{username}")
    public String perfil(){
        return "usuario/perfil";
    }
}
