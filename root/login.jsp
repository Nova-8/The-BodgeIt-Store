<%@ page import="java.sql.*" %>
<%@ include file="/dbconnection.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
<jsp:include page="/header.jsp"/>

<%
boolean loggedIn = false;
String username = request.getParameter("username");
String password = request.getParameter("password");
String debug = "Clear";

if (request.getMethod().equals("POST") && username != null) {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
        conn = /* obtain database connection */;

        stmt = conn.prepareStatement("SELECT * FROM Users WHERE (name = ? AND password = ?)");
        stmt.setString(1, username);
        stmt.setString(2, password);
        rs = stmt.executeQuery();

        if (rs.next()) {
            loggedIn = true;
            // Resto do seu código de autenticação
        }
    } catch (Exception e) {
        // Tratamento de erro
    } finally {
        // Fechar recursos
    }
}
%>

<h3>Login</h3>
Please enter your credentials: <br/><br/>
<form method="POST">
    <center>
        <table>
            <tr>
                <td>Username:</td>
                <td><input id="username" name="username" value="<c:out value="${username}"/>"/></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input id="password" name="password" type="password"/></td>
            </tr>
            <tr>
                <td></td>
                <td><input id="submit" type="submit" value="Login"/></td>
            </tr>
        </table>
    </center>
</form>

<%
if ("true".equals(request.getParameter("debug"))) {
    out.println("DEBUG: " + debug + "<br/><br/>");
}

if (request.getMethod().equals("POST") && username != null) {
    if (loggedIn) {
        // Resto do seu código de exibição
    } else {
        out.println("<p style=\"color:red\">You supplied an invalid name or password.</p>");
    }
}
%>

If you dont have an account with us then please <a href="register.jsp">Register</a> now for a free account.
<br/><br/>

<jsp:include page="/footer.jsp"/>
</body>
</html>
