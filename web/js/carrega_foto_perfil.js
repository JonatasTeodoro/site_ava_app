function atualizarImgPerfil() {
    var img = document.getElementById('imgPerfilUsuario');
    var imgTemp = document.getElementById('imgTempUsuario');
    img.style.display = 'block';
    imgTemp.style.display = 'none';
    img.src = img.src;
}

function imagemTemporaria() {
    var img = document.getElementById('imgPerfilUsuario');
    var imgTemp = document.getElementById('imgTempUsuario');
    img.style.display = 'none';
    imgTemp.style.display = 'block';
    img.src = img.src;
}

function checkImgOnline() {
    try {
        var url_atual = window.location.href;
        url_atual = url_atual.replace('/br.com.avamodelismo.app/EfetuarLogin', '/br.com.avamodelismo.app/Documentos/avatar/');
        url_atual = url_atual.replace('/br.com.avamodelismo.app/pagina_principal.jsp', '/br.com.avamodelismo.app/Documentos/avatar/');
        imageUrl = url_atual + document.getElementById("url_imagem_perfil").value;
        var img = new Image();
        img.src = imageUrl;
        if (img.height > 0) {
            atualizarImgPerfil();
            clearInterval(ponteiro);
        } else {
            imagemTemporaria();
        }
    } catch (error) {
        clearInterval(ponteiro);
    }
}

checkImgOnline();
const ponteiro = setInterval("checkImgOnline()", 5000);