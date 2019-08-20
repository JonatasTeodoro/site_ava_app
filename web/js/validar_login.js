function verificarLoginSenha() {
    var botao = document.getElementById("btnLogar");
    botao.innerHTML = "<i class='fa fa-spinner fa-pulse'></i> Validando";
    botao.disabled = true;
    var email = document.getElementById("usuario").value;
    var senha = document.getElementById("senha").value;
    var retorno = false;
    var a;
    $.ajax({
        url: 'VerificarLoginSenha?email=' + email + "&senha=" + ascii_to_hexa(senha),
        async: false,
        success: function (data)
        {
            var obj = $.parseJSON(data);

            if (obj.login[0].status == 1) {
                //Já existe
                alert("E-mail ou senha incorretos!");
                botao.innerHTML = "<i class='fa fa-sign-in'></i> Entrar";
                botao.disabled = false;
                retorno = false;
            } else {
                //Continua
                botao.innerHTML = "<i class='fa fa-spinner fa-pulse'></i> Entrando";
                retorno = true;
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

