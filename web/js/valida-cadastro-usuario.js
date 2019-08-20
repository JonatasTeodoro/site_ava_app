function validarNovoCadastro() {
    var botao = document.getElementById("btnCadastrar");
    botao.innerHTML = "<i class='fa fa-spinner fa-pulse'></i> Verificando";
    botao.disabled = true;

    var cidade = document.getElementById("cidade");
    var nome = document.getElementById("nome");
    var telefone = document.getElementById("telefone");
    var senha = document.getElementById("senha");
    var repeteSenha = document.getElementById("repetirSenha");
    var email = document.getElementById("email");



    if (nome.value == "") {
        alert("Nome em branco!");
        nome.focus();
        botao.innerHTML = "<i class='fa fa-save'></i> Cadastrar";
        botao.disabled = false;
        return false;
    }
    
    if (email.value == "") {
        alert("E-mail em branco!");
        email.focus();
        botao.innerHTML = "<i class='fa fa-save'></i> Cadastrar";
        botao.disabled = false;
        return false;
    }

    if (cidade.value == "") {
        alert("Cidade em branco!");
        cidade.focus();
        botao.innerHTML = "<i class='fa fa-save'></i> Cadastrar";
        botao.disabled = false;
        return false;
    }

    if (telefone.value == "") {
        alert("Telefone em branco!");
        telefone.focus();
        botao.innerHTML = "<i class='fa fa-save'></i> Cadastrar";
        botao.disabled = false;
        return false;
    }


    if (senha.value.length < 8) {
        alert("A senha deve conter pelo menos 8 caracteres!");
        senha.focus();
        botao.innerHTML = "<i class='fa fa-save'></i> Cadastrar";
        botao.disabled = false;
        return false;
    }

    if (senha.value != repeteSenha.value) {
        alert("As senhas n\u00e3o correspondem!");
        repeteSenha.focus();
        repeteSenha.style.backgroundColor = '#f750505e';
        botao.innerHTML = "<i class='fa fa-save'></i> Cadastrar";
        botao.disabled = false;
        return false;
    }



    botao.style.backgroundColor = 'gray';
    botao.innerHTML = "<i class='fa fa-spinner fa-pulse'></i> Cadastrando";
    botao.disabled = true;

    var retorno = verificarEmailCadastrado(email);

    return retorno;

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
                var botao = document.getElementById("btnCadastrar");
                botao.innerHTML = "<i class='fa fa-save'></i> Cadastrar";
                botao.disabled = false;
                email.focus();
                retorno = false;
            } else {
                //Continua
                retorno = true;
            }

        }
    }).done(function () {
        a = true;
    });
    console.log(a);
    return retorno;
}




