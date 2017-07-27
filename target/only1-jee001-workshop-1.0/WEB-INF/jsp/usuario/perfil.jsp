<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Only-1</title>
        <link rel="icon" href="img/Logo-V1-Mini.png" type="image/png" sizes="16x16">
        <link rel="stylesheet" type="text/css" href="css/lib/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/app/only1-fonts.css">
        <link rel="stylesheet" type="text/css" href="css/app/only1-stylesheet.css">
    </head>
    <body>
        <div class="nav">
            <nav>
                <a href="./"><span class="logo" title="Only1"></span></a>
                <span class="cog"><a href="./signout" title="Cerrar Sesi&oacute;n"><i class="fa fa-sign-out" aria-hidden="true"></i></a></span>
                <span class="cog"><a href=""><i class="fa fa-cog" aria-hidden="true"></i></a></span>
                <span class="cog">
                    <a href="./<c:out value="${usuario.username}"/>" title="Perfil"><i class="fa fa-user" aria-hidden="true"></i></a>
                </span>
                <span class="cog"><a href=""><i class="fa fa-search" aria-hidden="true"></i></a></span>
            </nav>
        </div>
        <div class="container">
            <div class="_usm">
                <div class="_uimp" title="Cambiar im&aacute;gen de Perfil">
                    <button class="profilePicThumb">
                        <c:choose>
                            <c:when test="${usuario.imagen != null}">
                                <img class="profilePic img" src="${usuario.imagen}" alt="Foto de perfil">
                            </c:when>    
                            <c:otherwise>
                                <img class="profilePic img" src="./img/user/_uipd.png" alt="Foto de perfil">
                            </c:otherwise>
                        </c:choose>
                    </button>
                    <form action="./saveImageProfile" method="POST">
                        <input name="imgageProfile" type="file" accept="image/jpeg"/>
                        <input type="submit" value="Guardar"/>
                    </form>
                </div>
                <div class="_ugin">
                    <div class="_upi">
                        <div>
                            <div class="username">
                                <span><c:out value="${usuario.username}"/></span>
                                <a href="#popup" class="btn-p">Editar perfil</a>
                            </div>
                        </div>
                        <div class="name"><span><c:out value="${usuario.nombre}"/></span></div>
                    </div>
                    <div class="_uci">
                        <span><strong>999</strong> - Publicaciones</span>
                        <span><strong>999</strong> - Seguidores</span>
                        <span><strong>999</strong> - Seguidos</span>
                    </div>
                    <div id="popup" class="popupOverlay">
                        <div class="popup">
                            <div>
                                <ul class="menu">
                                    <li><a id="menuUserInfo" class="active" href=""><i class="fa fa-user" aria-hidden="true"></i></a></li>
                                    <li><a id="menuConfigInfo" href=""><i class="fa fa-cog" aria-hidden="true"></i></a></li>
                                </ul>
                                <a class="close" href="#">&times;</a>
                            </div>
                            <div class="content">
                                <div id="userInfo">
                                    <form action="./save" method="POST">
                                            <div class="input input--Only1">
                                                <label class="input__label input__label--Only1" for="nombre">
                                                    Nombre
                                                </label>
                                                <input class="input__field input__field--Only1" type="text" name="nombre" id="nombre" value="<c:out value="${usuario.nombre}"/>" required="" title="Nombre Completo" />
                                            </div>
                                            <div class="input input--Only1">
                                                <label class="input__label input__label--Only1" for="username">
                                                    Nombre de Usuario
                                                </label>
                                                <input class="input__field input__field--Only1" type="text" name="username" value="<c:out value="${usuario.username}"/>" id="username" title="Nombre de Usuario" required="" />
                                            </div>
                                            <div class="input input--Only1">
                                                <label class="input__label input__label--Only1" for="email_o_telefono">
                                                    Correo Electr&oacute;nico o N&uacute;mero de Teléfono
                                                </label>
                                                <input class="input__field input__field--Only1" type="text" name="email_o_telefono" value="<c:out value="${usuario.username}"/>" id="email_o_telefono" title="Correo Electr&oacute;nico o N&uacute;mero de Teléfono" required="" />
                                            </div>
                                            <div>
                                                <input class="input__field input__field--Only1 btn" type="submit" value="Guardar" title="Guardar" />
                                            </div>
                                    </form>
                                </div>
                                <div id="configInfo">
                                  <form action="./save" method="POST">
                                        <div class="input input--Only1">
                                            <label class="input__label input__label--Only1">
                                                Contrase&ntilde;a anterior
                                            </label>
                                            <input class="input__field input__field--Only1 _uspwed" type="password" name="usuario_pass_anterior" title="Contrase&ntilde;a Anterior" required="" />
                                        </div>
                                        <div class="input input--Only1">
                                            <label class="input__label input__label--Only1" for="usuario_pass">
                                                Nueva contrase&ntilde;a
                                            </label>
                                            <input class="input__field input__field--Only1 _uspwed" type="password" name="usuario_pass" id="usuario_pass" title="Nueva Contrase&ntilde;a" required="" />
                                        </div>
                                        <div class="input input--Only1">
                                            <label class="input__label input__label--Only1">
                                                Confirmar contrase&ntilde;a
                                            </label>
                                            <input class="input__field input__field--Only1 _uspwed" type="password" name="usuario_pass_confirmar" title="Confirmar Contrase&ntilde;a" required="" />
                                        </div>
                                        <div>
                                            <input class="input__field input__field--Only1 btn btn-pd" type="submit" value="Guardar" title="Guardar" disabled="true" />
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- _usm -->
            <div class="_ucnt">
                <div class="thumbnail">
                    <img src="./img/user/_uipd.png">
                    <div class="overlay">
                        <div class="content-data">
                            <span>999 <i class="fa fa-heart" aria-hidden="true"></i></span>
                            <span>999 <i class="fa fa-comment" aria-hidden="true"></i></span>
                        </div>
                    </div>
                </div>
                <div class="thumbnail">
                    <img src="./img/user/_uipd.png">
                    <div class="overlay">
                        <div class="content-data">
                            <span>999 <i class="fa fa-heart" aria-hidden="true"></i></span>
                            <span>999 <i class="fa fa-comment" aria-hidden="true"></i></span>
                        </div>
                    </div>
                </div>
                <div class="thumbnail">
                    <img src="./img/user/_uipd.png">
                    <div class="overlay">
                        <div class="content-data">
                            <span>999 <i class="fa fa-heart" aria-hidden="true"></i></span>
                            <span>999 <i class="fa fa-comment" aria-hidden="true"></i></span>
                        </div>
                    </div>
                </div>
                <div class="thumbnail">
                    <img src="./img/user/_uipd.png">
                    <div class="overlay">
                        <div class="content-data">
                            <span>999 <i class="fa fa-heart" aria-hidden="true"></i></span>
                            <span>999 <i class="fa fa-comment" aria-hidden="true"></i></span>
                        </div>
                    </div>
                </div>
                <div class="thumbnail">
                    <img src="./img/user/_uipd.png">
                    <div class="overlay">
                        <div class="content-data">
                            <span>999 <i class="fa fa-heart" aria-hidden="true"></i></span>
                            <span>999 <i class="fa fa-comment" aria-hidden="true"></i></span>
                        </div>
                    </div>
                </div>
                <div class="thumbnail">
                    <img src="./img/user/_uipd.png">
                    <div class="overlay">
                        <div class="content-data">
                            <span>999 <i class="fa fa-heart" aria-hidden="true"></i></span>
                            <span>999 <i class="fa fa-comment" aria-hidden="true"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- Container -->
        <!-- Lib JS -->
        <script src="js/lib/jquery-1.11.1.js"></script>
        
        <!-- JS de la aplicacion -->
        <script src="js/app/only1.js"></script>
        <script src="js/app/events.js"></script>
        <script src="js/app/service/service.js"></script>
        <script src="js/app/service/usuario/usuario.js"></script>
        <script src="js/app/ui/ui.js"></script>
        <script src="js/app/ui/usuario/usuario.js"></script>
    </body>
</html>
