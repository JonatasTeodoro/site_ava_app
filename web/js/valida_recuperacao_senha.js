function validarRecuperacaoDeSenha() {
    var nova = document.getElementById("nova");
    var repete = document.getElementById("repete");

    if (nova.value.length < 8) {
        alert("A senha deve conter pelo menos 8 caracteres!");
        nova.focus();
        return false;
    }

    if (nova.value != repete.value) {
        alert("As senhas n\u00e3o correspondem");
        nova.focus();
        return false;
    }

    return true;
}


