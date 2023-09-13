<!DOCTYPE html>
<html>
<head>
    <title>Exemplo de Vulnerabilidade de XSS</title>
</head>
<body>
    <h1>Comentários</h1>
    <div id="comentarios">
        <!-- Os comentários dos usuários são exibidos aqui -->
    </div>
    <form>
        <input type="text" id="novoComentario" placeholder="Digite seu comentário">
        <button onclick="adicionarComentario()">Enviar</button>
    </form>

    <script>
        function adicionarComentario() {
            var comentario = document.getElementById("novoComentario").value;
            var comentarioDiv = document.createElement("div");
            comentarioDiv.innerHTML = comentario;
            document.getElementById("comentarios").appendChild(comentarioDiv);
        }
    </script>
</body>
</html>
