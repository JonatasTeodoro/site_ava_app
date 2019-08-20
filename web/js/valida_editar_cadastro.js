function validarEditarCadastro() {
    var nome = document.getElementById("nome");
    var email = document.getElementById("email");
    var emailAtual = document.getElementById("emailAtual");
    var cidade = document.getElementById("emailAtual");
    var telefone = document.getElementById("telefone");
    var retorno = false;

    if (nome.value == "") {
        alert("Nome em branco!");
        nome.focus();
        return false;
    }

    if (email.value == "") {
        alert("E-mail em branco!");
        email.focus();
        return false;
    }
    
    if (cidade.value == "") {
        alert("Cidade em branco!");
        cidade.focus();
        return false;
    }
    
    if (telefone.value == "") {
        alert("Telefone em branco!");
        telefone.focus();
        return false;
    }


    if (email.value != emailAtual.value) {
        return verificarEmailCadastrado(email);
    }

    document.getElementById("btnVoltar").style.visibility = 'hidden';
    document.getElementById("btnSenha").style.visibility = 'hidden';
    document.getElementById("btnSalvar").innerHTML = "<i class='fa fa-spinner fa-pulse'></i>";
    document.getElementById("formEditarUsuario").submit();

}


function verificarEmailCadastrado(email) {
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
                alert("E-mail j\u00e1 cadastrado!");
                email.focus();
                retorno = false;
            } else {
                //Continua
                document.getElementById("btnVoltar").style.visibility = 'hidden';
                document.getElementById("btnSenha").style.visibility = 'hidden';
                document.getElementById("btnSalvar").innerHTML = "<i class='fa fa-spinner fa-pulse'></i>";
                document.getElementById("formEditarUsuario").submit();
            }

        }
    }).done(function () {
        a = true;
    });
    console.log(a);
    return retorno;
}


