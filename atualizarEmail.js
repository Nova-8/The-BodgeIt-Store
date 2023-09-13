function atualizarEmail(novoEmail) {
  // Código para enviar uma solicitação HTTP POST para atualizar o e-mail
  // Aqui, estou simplificando e não mostrando o código real de envio da solicitação.
  // Vamos assumir que a URL de atualização é '/atualizar-email'
  var xhr = new XMLHttpRequest();
  xhr.open("POST", "/atualizar-email", true);
  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
  xhr.send("email=" + novoEmail);
}

// Exemplo de uso do código para atualizar o e-mail
var novoEmail = "novoemail@example.com";
atualizarEmail(novoEmail);
