function agendar(tipo)
{

    var r = confirm("Voc\u00ea ser\u00e1 aproximadamente o n\u00famero " + buscaPosicaoAtual() + " na fila geral!\nContinuar?");
    if (r == true) {
        cadastrarNaFila(tipo);
    } else {

    }
}


function buscaPosicaoAtual() {

    var retorno = 0;
    var a;
    $.ajax({
        url: 'BuscarPosicaoAtual',
        async: false,
        success: function (data)
        {
            var obj = $.parseJSON(data);
            retorno = obj.posicao;

        }
    }).done(function () {
        a = true;
    });
    console.log(a);
    return retorno;
}


function cadastrarNaFila(tipo) {
    var a;
    $.ajax({
        url: 'AgendarNaFila?tipo=' + tipo,
        async: false,
        success: function (data)
        {

            var obj = $.parseJSON(data);
            alert(obj.mensagem);
            $('#myModal').hide();
            $('.modal-backdrop').remove();


        }
    }).done(function () {
        a = true;
    });
    console.log(a);
}