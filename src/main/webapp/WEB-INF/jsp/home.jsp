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
            Usuario Logueado
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
