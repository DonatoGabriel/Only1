only1.ui.usuario = (function () {
    function inicializar() {
        beanABotones();
    }

    function beanABotones() {
        $("#btn_fml").on("click", function (event) {
            event.preventDefault();
            only1.service.usuario.userIsValid($("#username").val(), $("#usuario_pass").val())
                    .done(validLoginForm);
        });

        $("#menuUserInfo").on("click", function (event) {
            event.preventDefault();
            $("#configInfo").hide();
            $("#userInfo").show();
            $("#menuConfigInfo").removeClass("active");
            $("#menuUserInfo").addClass("active");
        });

        $("#menuConfigInfo").on("click", function (event) {
            event.preventDefault();
            $("#userInfo").hide();
            $("#configInfo").show();
            $("#menuUserInfo").removeClass("active");
            $("#menuConfigInfo").addClass("active");
        });
        
        $("._uspwed").keyup(function (){
            passwordNoVacias();
        });
    }

    function passwordNoVacias() {
        var anterior = $("input[name='usuario_pass_anterior']").val(),
                nueva = $("input[name='usuario_pass']").val(),
                confirmacion = $("input[name='usuario_pass_confirmar']").val();
        
        if (anterior != "" && nueva != "" && confirmacion != "") {
            $(".btn-pd").removeAttr("disabled");
        } else {
            $(".btn-pd").attr("disabled", "true");
        }
    }

    function validLoginForm(flag) {
        //Si los datos son correctos
        if (flag == true) {
            $(".alert").hide();
            $("#_fml").submit();
        } else {
            showErrorMessage();
        }
    }

    function showErrorMessage() {
        $(".alert").fadeIn();
    }

    return{
        inicializar: inicializar
    };
})();

$(document).ready(function () {
    only1.ui.usuario.inicializar();
    $(".alert").hide();
});


