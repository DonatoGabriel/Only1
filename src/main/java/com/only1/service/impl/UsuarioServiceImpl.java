/*
 * Usuario Service Impl
 * 15/07/2017
 * V 1.0
 * Detalles: Obtener tipo de usuario
 * @author Donato Gabriel
 */
package com.only1.service.impl;

import com.only1.domain.Usuario;
import com.only1.repository.UsuarioRepository;
import com.only1.service.UsuarioService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;

@Service
@Transactional
public class UsuarioServiceImpl implements UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Override
    public Usuario findUserById(Long id) {
        return usuarioRepository.findOne(id);
    }

    @Override
    public List<Usuario> findUserByUsername(String username) {
        return usuarioRepository.findByUsernameContainsIgnoreCase(username);
    }

    @Override
    public void saveUser(@Validated Usuario usuario) {
        usuarioRepository.saveAndFlush(usuario);
    }

    @Override
    public void removeUser(Long id) {
        usuarioRepository.delete(id);
    }

    @Override
    public Usuario findUserByUsernameAndUsuarioPass(String username, String usuarioPass) {
        return usuarioRepository.findByUsernameAndUsuarioPass(username, usuarioPass);
    }
}
