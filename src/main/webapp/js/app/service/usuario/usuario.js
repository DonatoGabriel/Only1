only1.service.usuario = (function(){
    var serviceUrl = "/only1/api/usuario/";
    
    function userIsValid(username, password){
        var serviceUrlUserIsValid = serviceUrl + "isValid/" + username + "/" + password;
        return $.get(serviceUrlUserIsValid);
    }
    
    return{
        userIsValid: userIsValid
    };
})();


