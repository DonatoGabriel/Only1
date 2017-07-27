/*
 * Usuario Repository
 * 15/07/2017
 * V 1.0
 * @author Donato Gabriel
 */
package com.only1.repository;

import com.only1.domain.Usuario;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

    List<Usuario> findByUsernameContainsIgnoreCase(String username);

    Usuario findByUsernameAndUsuarioPass(String username, String usuarioPass);
}
