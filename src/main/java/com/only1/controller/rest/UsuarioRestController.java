package com.only1.controller.rest;

import com.only1.domain.Usuario;
import com.only1.service.impl.UsuarioServiceImpl;
import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/api/usuario")
public class UsuarioRestController {

    @Autowired
    private UsuarioServiceImpl usuarioServiceImpl;
    @Autowired
    private HttpServletRequest request;
    private Usuario usuario;

    @GetMapping("/isValid/{username}/{password}")
    public Boolean isValid(@PathVariable String username, @PathVariable String password) {
        usuario = usuarioServiceImpl.findUserByUsernameAndUsuarioPass(username, password);
        return usuario != null;
    }
    
    @PostMapping("/saveImageProfile")
    public void saveImageProfile(HttpSession session, @RequestParam("imgageProfile") MultipartFile multipartFile) throws IOException{
        //Verificacion archivo vacio
        if(!multipartFile.isEmpty()){
            String path = request.getServletContext().getRealPath("/uploads/_usimp/");
            //Verificacion archivo ya existe
            if(! new File(path).exists()){
                new File(path).mkdir(); //Creates the directory named by this abstract pathname.
            }
            
            //Armado del guardado de la imagen
            String originalName = multipartFile.getOriginalFilename();
            String filePath = path + originalName;
            File destiny = new File(filePath);
            multipartFile.transferTo(destiny);
            
            //Setear los datos al usuario
            usuario = (Usuario) session.getAttribute("usuario");
            usuario.setImagen(filePath);
            usuarioServiceImpl.saveUser(usuario);
        }
    }
}
