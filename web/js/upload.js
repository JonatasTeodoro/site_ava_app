

function uploadImagem() {
    document.getElementById('btnUpload').innerHTML = "<i class='fa fa-spinner fa-pulse'></i>";

    var teste = document.getElementById('upload_file').files.length;

    if (teste == 0) {
        alert('Insira uma imagem!');
        document.getElementById('btnUpload').innerHTML = "<i class='fa fa-send menu'></i>";
    } else {

        var request = new XMLHttpRequest();
        request.upload.addEventListener("progress", uploadProgress, false);

        //envia o form
        var formData = new FormData();

        formData.append("file", document.getElementById('upload_file').files[0]);
        formData.append("comentario", ascii_to_hexa(document.getElementById('comentario').value));
        request.open("POST", "EnviarImagem");
        request.send(formData);
    }

}

function uploadProgress(event) {
    if (event.lengthComputable) {

        var nomeArquivo = document.getElementById('upload_file').value;

        var percent = Math.round(event.loaded * 100 / event.total);

        if (nomeArquivo != "") {
            //cálculo simples de porcentagem.
            //document.getElementById('progressbar').value = percent; //atualiza o valor da progress bar.
            document.getElementById('btnUpload').innerHTML = percent + "%";

        }

        if (percent == 100) {
            sleep(5000);
            window.location.replace('pagina_principal.jsp');
        }

    } else {
        //não é possível computar o progresso =/
    }
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

function sleep(milliseconds) {
    var start = new Date().getTime();
    for (var i = 0; i < 1e7; i++) {
        if ((new Date().getTime() - start) > milliseconds) {
            break;
        }
    }
}

