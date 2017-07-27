/*
 * Usuario
 * 14/07/2017
 * V 1.0
 * @author Donato Gabriel
 */
package com.only1.domain;

import java.sql.Blob;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
//import java.util.List;

@Entity
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    private String nombre;

    @NotNull
    @Size(max = 20)
    private String username;

    @NotNull
    private String email_o_telefono;

    @NotNull
    @Column(name = "usuario_pass")
    private String usuarioPass;

    private String imagen;

    @NotNull
    private boolean activo;

    @NotNull
    private byte tipo;
    //private List<Usuario> seguidores; // Tabla de Seguidores(Relacion autoreferencial - N a N)
    //private List<Contenido> likes; // Tabla de Likes(Relacion Contenido - N a N)

    // ----------------- Constructor ----------------- //
    public Usuario() {
    }

    public Usuario(Long id, String nombre, String username, String email_o_telefono, String usuario_pass, String imagen, boolean activo, byte tipo) {
        this.id = id;
        this.nombre = nombre;
        this.username = username;
        this.email_o_telefono = email_o_telefono;
        this.usuarioPass = usuario_pass;
        this.imagen = imagen;
        this.activo = activo;
        this.tipo = tipo;
    }

    public Usuario(String nombre, String usuario, String email_o_telefono, String usuario_pass, String imagen, boolean activo, byte tipo) {
        this.nombre = nombre;
        this.username = usuario;
        this.email_o_telefono = email_o_telefono;
        this.usuarioPass = usuario_pass;
        this.imagen = imagen;
        this.activo = activo;
        this.tipo = tipo;
    }

    // ----------------- Getter ----------------- //
    public Long getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail_o_telefono() {
        return email_o_telefono;
    }

    public String getUsuario_pass() {
        return usuarioPass;
    }

    public String getImagen() {
        return imagen;
    }

    public boolean isActivo() {
        return activo;
    }

    public byte getTipo() {
        return tipo;
    }

    // ----------------- Setter ----------------- //
    public void setId(Long id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setEmail_o_telefono(String email_o_telefono) {
        this.email_o_telefono = email_o_telefono;
    }

    public void setUsuario_pass(String usuario_pass) {
        this.usuarioPass = usuario_pass;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public void setTipo(byte tipo) {
        this.tipo = tipo;
    }

}
