<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Only-1</title>
        <link rel="icon" href="img/Logo-V1-Mini.png" type="image/png" sizes="16x16">
        <link rel="stylesheet" type="text/css" href="css/app/only1-fonts.css">
        <link rel="stylesheet" type="text/css" href="css/app/only1-stylesheet.css">
    </head>
    <body>
        <div class="nav">
            <nav>
                <span class="logo" title="Only1"></span>
                <span class="slogan" title="Todo en un solo lugar">Todo en un solo lugar</span>
            </nav>
        </div>
        <div class="container">
            <div class="info">
                <div>
                    DESKTOP AND MOBILE IMAGE (INSIDE APP IMAGE)
                </div>
            </div>
            <div class="form">
                <div class="formContainer">
                    <h1 class="logo-t" title="Only1">Only1</h1>
                    <div class="separador">
                        <div class="line"></div>
                        <div class="circle">o</div>
                        <div class="line"></div>
                    </div>
                    <div class="_frl">
                        <form action="./save" method="POST">
                            <!--<span>Registrarse con FB</span>-->
                                <div class="input input--Only1">
                                    <label class="input__label input__label--Only1" for="nombre">
                                        Nombre Completo
                                    </label>
                                    <input class="input__field input__field--Only1" type="text" name="nombre" id="nombre" required="" title="Nombre Completo" />
                                </div>
                                <div class="input input--Only1">
                                    <label class="input__label input__label--Only1" for="username">
                                        Nombre de Usuario
                                    </label>
                                    <input class="input__field input__field--Only1" type="text" name="username" id="username" title="Nombre de Usuario" required="" />
                                </div>
                                <div class="input input--Only1">
                                    <label class="input__label input__label--Only1" for="email_o_telefono">
                                        Correo Electr&oacute;nico o N&uacute;mero de Teléfono
                                    </label>
                                    <input class="input__field input__field--Only1" type="text" name="email_o_telefono" id="email_o_telefono" title="Correo Electr&oacute;nico o N&uacute;mero de Teléfono" required="" />
                                </div>
                                <div class="input input--Only1">
                                    <label class="input__label input__label--Only1" for="usuario_pass">
                                        Contrase&ntilde;a
                                    </label>
                                    <input class="input__field input__field--Only1" type="password" name="usuario_pass" id="usuario_pass" title="Contrase&ntilde;a" required="" />
                                </div>
                                <div>
                                    <input class="input__field input__field--Only1 btn" type="submit" value="Registrarte" title="Registrarte" />
                                </div>
                        </form>
                    </div>
                    <div class="alert alert-danger" role="alert"><strong>Los datos ingresados son incorrectos, intenta nuevamente.</strong></div>
                </div>
                <div class="formContainer _qtn">
                    <span>¿Ten&eacute;s una cuenta? <a href="" class="color _lkli" title="Entra">Entra</a></span>
                </div>
                <div class="descarga">
                    <p>Descarga la aplicación.</p>
                    <img src="img/disponible_play.png">
                    <img src="img/disponible_app.png">
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
