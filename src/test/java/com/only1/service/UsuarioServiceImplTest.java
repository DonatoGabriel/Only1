package com.only1.service;

import com.only1.ApplicationConfig;
import com.only1.domain.Usuario;
import com.only1.service.impl.UsuarioServiceImpl;
import java.util.List;
import javax.validation.ConstraintViolationException;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.dao.InvalidDataAccessApiUsageException;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = ApplicationConfig.class)
@Transactional
public class UsuarioServiceImplTest {
    
    @Autowired
    private UsuarioServiceImpl usuarioServiceImpl;
    private Usuario usuario;
    
    @Test
    public void findUserById_ConUsuarioExistente_RetornaUsuario(){
        Long id = 1L;
        usuario = usuarioServiceImpl.findUserById(id);
        
        assertNotNull(usuario);
        assertEquals(usuario.getId(), id);
        assertEquals(usuario.getUsername(), "g.donato");
    }
    
    @Test
    public void findUserById_ConUsuarioInexistente_RetornaNull(){
        assertNull(usuarioServiceImpl.findUserById(0L));
    }
    
    @Test(expected = InvalidDataAccessApiUsageException.class)
    public void findUserById_ConNull_LanzaExcepcion(){
        usuarioServiceImpl.findUserById(null);
    }
    
    @Test
    public void findUserByUsername_ConNombreUsuarioExistente_RetornaListaUsuario(){
        String username = "g.donato";
        List<Usuario> usuarios = usuarioServiceImpl.findUserByUsername(username);
        
        assertNotNull(usuarios);
        assertEquals(usuarios.get(0).getUsername(), username);
        assertEquals(usuarios.get(0).getNombre(), "Donato Gabriel");
    }
    
    @Test
    public void findUserByUsername_ConNombreUsuarioInexistente_RetornaListaVacia(){
        assertTrue(usuarioServiceImpl.findUserByUsername("userTest").isEmpty());
    }
    
    @Test(expected = InvalidDataAccessApiUsageException.class)
    public void findUserByUsername_ConNull_RetornaExepcion(){
        usuarioServiceImpl.findUserByUsername(null);
    }
    /*
    @Test
    public void saveUser_ConUsuarioNuevo_NoRetorno(){
        usuarioServiceImpl.saveUser(new Usuario(0L, "User Test", "username", "email_o_telefono", "usuario_pass", null, true, 2););
        usuario = usuarioServiceImpl.findUserById(0L);
        
        assertNotNull(usuario);
        assertEquals(usuario.getNombre(), "User Test");
        assertEquals(usuario.getUsername(), "username");
    }*/
    
    @Test
    public void saveUser_ConUsuarioExistente_NoRetorno(){
        usuario = usuarioServiceImpl.findUserById(1L);
        usuario.setEmail_o_telefono("email_test.com");
        usuarioServiceImpl.saveUser(usuario);
        usuario = usuarioServiceImpl.findUserById(1L);
        
        assertNotNull(usuario);
        assertEquals(usuario.getNombre(), "Donato Gabriel");
        assertEquals(usuario.getUsername(), "g.donato");
        assertEquals(usuario.getEmail_o_telefono(), "email_test.com");
    }
    
    @Test(expected = ConstraintViolationException.class)
    public void saveUser_ConUsuarioSinDatos_LanzaExcepcion(){
        usuarioServiceImpl.saveUser(new Usuario());
    }
    
    @Test(expected = InvalidDataAccessApiUsageException.class)
    public void saveUser_ConNul_LanzaExcepcion(){
        usuarioServiceImpl.saveUser(null);
    }
    
    @Test
    public void removeUser_ConIdExistente_NoRetorno(){
        usuarioServiceImpl.removeUser(1L);
        usuario = usuarioServiceImpl.findUserById(1L);
        
        assertNull(usuario);
    }
    
    @Test(expected = EmptyResultDataAccessException.class)
    public void removeUser_ConUsuarioInexistente_NoRetorno(){
        usuarioServiceImpl.removeUser(0L);
    }
    
    @Test(expected = InvalidDataAccessApiUsageException.class)
    public void removeUser_ConNull_LanzaExcepcion() {
        usuarioServiceImpl.removeUser(null);
    }
    
    @Test
    public void findUserByUsernameAndUsuarioPass_ConDatosCorrectos_RetornaUsuario() {
        usuario = usuarioServiceImpl.findUserByUsernameAndUsuarioPass("g.donato", "Headofthepack!");
        assertNotNull(usuario);
        assertEquals(usuario.getNombre(), "Donato Gabriel");
        assertEquals(usuario.getEmail_o_telefono(), "e.donatogabriel@gmail.com");
    }
    
    @Test
    public void findUserByUsernameAndUsuarioPass_ConDatosIncorrectos_RetornaNull() {
        usuario = usuarioServiceImpl.findUserByUsernameAndUsuarioPass("UserTest123", "UserTest123");
        assertNull(usuario);
    }
}
