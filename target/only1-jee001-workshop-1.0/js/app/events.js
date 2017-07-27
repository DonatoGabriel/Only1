var color;
var events = (function () {
    function obtenerColor() {
        var letters = ['3777f9', '3aad58', 'd15252', '5e49f6'];
        return '#' + letters[Math.floor(Math.random() * letters.length)];
    }

    function printColor(color) {
        //Color al menú
        $('.nav').css('background-color', color);

        //Color al link
        $('.color').css('color', color);

        //Color a botones
        $('.btn').css('background-color', color);
        
        //Color del borde de los input
        $('.input__field--Only1').on('focus', function () {
            $(this).css('box-shadow', '0px 0px 0px 2px' + color);
        });

        $('.input__field--Only1').on('blur', function () {
            $(this).css('box-shadow', '');
        });
    }

    function showLogin() {
        //Formulario - Login
        $('._frl').empty();
        $('._frl').html("<form action='./login' method='POST' id='_fml'>\n\
                        <div class='input input--Only1'><label class='input__label input__label--Only1' for='username'>Nombre de Usuario</label>\n\
                        <input class='input__field input__field--Only1' type='text' name='username' id='username' required='' /></div>\n\
                        <div class='input input--Only1'><label class='input__label input__label--Only1' for='usuario_pass'> Contrase&ntilde;a</label>\n\
                        <input class='input__field input__field--Only1' type='password' name='usuario_pass' id='usuario_pass' required='' /></div>\n\
                        <div><input id='btn_fml' class='input__field input__field--Only1 btn' type='submit' value='Entrar' /></div>\n\
                        </form>");

        //Pregunta - Registro
        $('._qtn').empty();
        $('._qtn').html("<div class='formContainer _qtn'><span>¿No ten&eacute;s una cuenta? \n\
                         <a href='#' class='color _lklr'>Reg&iacutestrate</a></span></div>");

        //Se vuelven a colocar los colores (Los mismos que los anteriores)
        printColor(color);
        
        //Inicializar funciones de usuario
        only1.ui.usuario.inicializar();
    }

    function showRegistro() {
        //Formulario - Login
        $('._frl').empty();
        $('._frl').html("<form action='./save' method='POST'>\n\
                        <div class='input input--Only1'><label class='input__label input__label--Only1' for='nombre'>Nombre Completo</label>\n\
                        <input class='input__field input__field--Only1' type='text' name='nombre' id='nombre' required='' /></div>\n\
                        <div class='input input--Only1'><label class='input__label input__label--Only1' for='username'>Nombre de Usuario</label>\n\
                        <input class='input__field input__field--Only1' type='text' name='username' id='username' required='' /></div>\n\
                        <div class='input input--Only1'><label class='input__label input__label--Only1' for='email_o_telefono'>Correo Electr&oacute;nico o N&uacute;mero de Teléfono</label>\n\
                        <input class='input__field input__field--Only1' type='text' name='email_o_telefono' id='email_o_telefono' required='' /></div>\n\
                        <div class='input input--Only1'><label class='input__label input__label--Only1' for='usuario_pass'>Contrase&ntilde;a</label>\n\
                        <input class='input__field input__field--Only1' type='password' name='usuario_pass' id='usuario_pass' required='' /></div>\n\
                        <div><input class='input__field input__field--Only1 btn' type='submit' value='Registrarte' /></div>\n\
                        </form>");
        
        //Pregunta - Login
        $('._qtn').empty();
        $('._qtn').html("<div class='formContainer _qtn'><span>¿Ten&eacute;s una cuenta? \n\
                         <a href='' class='color _lkli'>Entra</a></span></div>");
        
        //Se vuelven a colocar los colores (Los mismos que los anteriores)
        printColor(color);
    }

    return{
        obtenerColor: obtenerColor,
        printColor: printColor,
        showLogin: showLogin,
        showRegistro: showRegistro
    };
})();

$(document).ready(function () {
    //Obtener color al azar
    color = events.obtenerColor();

    events.printColor(color);

    //Mostrar Login
    $('._lkli').on('click', function (event) {
        event.preventDefault();
        events.showLogin();
        
        $('._lklr').on('click', function (event) {
            event.preventDefault();
            events.showRegistro();
        });
    });
    
});

// $(window).resize(function () { fondoFullScreen(); });