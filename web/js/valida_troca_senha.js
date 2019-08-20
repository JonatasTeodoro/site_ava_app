function validarTrocaDeSenha() {
    var atual = document.getElementById("atual");
    var nova = document.getElementById("nova");
    var repete = document.getElementById("repete");
    var id = document.getElementById("id_usuario");

    if (atual.value == "") {
        alert("Senha atual em branco!");
        atual.focus();
        return false;
    }

    if (nova.value == "") {
        alert("Nova senha em branco!");
        nova.focus();
        return false;
    }

    if (repete.value == "") {
        alert("Repete senha em branco!");
        repete.focus();
        return false;
    }

    if (nova.value != repete.value) {
        alert("As senhas n\u00e3o correspondem");
        repete.focus();
        return false;
    }

    if (nova.value.length < 8) {
        alert("A senha deve conter pelo menos 8 caracteres!");
        repete.focus();
        return false;
    }

    var retorno = verificarSenhaCadastrado(atual.value, id.value, nova.value);
    return false;
}


function verificarSenhaCadastrado(senha, id, nova) {
    var retorno = false;
    var a;
    $.ajax({
        url: 'VerificarSenhaAtual?senha=' + ascii_to_hexa(senha) + "&id=" + id,
        async: false,
        success: function (data)
        {
            var obj = $.parseJSON(data);

            if (obj.login[0].status == 0) {
                //Confere
                alert("Senha atual incorreta!");

            } else {
                //Diferente
                //document.getElementById("formAlterarSenha").submit();
                alteraSenhaCadastrado(nova, id);
            }

        }
    }).done(function () {
        a = true;
    });
    console.log(a);
    return retorno;
}


function alteraSenhaCadastrado(senha, id) {
    var retorno = false;
    var a;
    $.ajax({
        url: 'AlterarSenhaUsuario?senha=' + ascii_to_hexa(senha) + "&id=" + id,
        async: false,
        success: function (data)
        {
            var obj = $.parseJSON(data);

            if (obj.login[0].status == 0) {
                alert("Erro ao alterar senha!");
            } else {
                document.getElementById("atual").value = "";
                document.getElementById("nova").value = "";
                document.getElementById("repete").value = "";
                alert("Senha alterada com sucesso!");
            }

        }
    }).done(function () {
        a = true;
    });
    console.log(a);
    return retorno;
}

function ascii_to_hexa(str) {
    var arr1 = [];
    for (var n = 0, l = str.length; n < l; n++)
    {
        var hex = Number(str.charCodeAt(n)).toString(16);
        arr1.push(hex);
    }
    return arr1.join('');
}


