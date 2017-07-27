/*
 * Usuario Service
 * 15/07/2017
 * V 1.0
 * @author Donato Gabriel
 */
package com.only1.service;

import com.only1.domain.Usuario;
import java.util.List;

public interface UsuarioService {

    Usuario findUserById(Long id);

    List<Usuario> findUserByUsername(String username);

    void saveUser(Usuario usuario);
    
    void removeUser(Long id);
    
    Usuario findUserByUsernameAndUsuarioPass(String username, String usuarioPass);
}
