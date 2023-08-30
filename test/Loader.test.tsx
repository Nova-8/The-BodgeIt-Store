<!DOCTYPE html>
<html>
<head>
    <title>Página Vulnerável</title>
</head>
<body>
    <h1>Bem-vindo</h1>
    <p>Olá, <span id="nome"></span>!</p>
    <script>
        var nome = prompt("Digite seu nome:");
        document.getElementById("nome").textContent = nome;
    </script>
</body>
</html>
