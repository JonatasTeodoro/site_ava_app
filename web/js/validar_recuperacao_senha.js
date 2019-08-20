function validarRecuperacao() {
    var email = document.getElementById("email");

    if (email.value == "") {
        alert("E-mail n\u00e3o informado!");
        email.focus();
        return false;
    }

    var retorno = verificarEmailExiste(email);

    return retorno;


}

function verificarEmailExiste(email) {
    var retorno = false;
    var a;
    $.ajax({
        url: 'VerificarEmailExistente?usuario=' + email.value,
        async: false,
        success: function (data)
        {
            var obj = $.parseJSON(data);

            if (obj.login[0].status == 1) {
                //Já existe
                document.getElementById("btnSubmit").innerHTML = "<i class='fa fa-spinner fa-pulse'></i> enviando";
                document.getElementById("btnSubmit").disabled = true;
                retorno = true;
            } else {
                //Continua
                alert("E-mail n\u00e3o cadastrado no sistema!");
                retorno = false;
            }

        }
    }).done(function () {
        a = true;
    });
    console.log(a);
    return retorno;
}