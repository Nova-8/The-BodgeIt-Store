<%@ page import="java.sql.*" %>
<%@ page import="java.sql.PreparedStatement" %>

<%@ include file="/dbconnection.jspf" %>
<jsp:include page="/header.jsp"/>

<%
String username = (String) session.getAttribute("username");
String usertype = (String) session.getAttribute("usertype");

String password1 = (String) request.getParameter("password1");
String password2 = (String) request.getParameter("password2");
String okresult = null;
String failresult = null;

if (password1 != null && password1.length() > 0) {
    if (!password1.equals(password2)) {
        failresult = "The passwords you have supplied are different.";
    } else if (password1.length() < 5) {
        failresult = "You must supply a password of at least 5 characters.";
    } else {
        PreparedStatement insertStmt = null;
        PreparedStatement selectStmt = null;
        ResultSet rs = null;
        try {
            String insertQuery = "INSERT INTO Users (name, type, password) VALUES (?, 'USER', ?)";
            String selectQuery = "SELECT * FROM Users WHERE (name = ? AND password = ?)";

            insertStmt = conn.prepareStatement(insertQuery);
            selectStmt = conn.prepareStatement(selectQuery);

            // Definir os parâmetros das consultas
            insertStmt.setString(1, username);
            insertStmt.setString(2, password1);
            selectStmt.setString(1, username);
            selectStmt.setString(2, password1);

            // Executar as consultas
            insertStmt.executeUpdate();
            rs = selectStmt.executeQuery();

            okresult = "Your password has been changed";

            if (request.getMethod().equals("GET")) {
                conn.createStatement().execute("UPDATE Score SET status = 1 WHERE task = 'PASSWD_GET'");
            }
        } catch (SQLException e) {
            failresult = "System error.";
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (insertStmt != null) {
                insertStmt.close();
            }
            if (selectStmt != null) {
                selectStmt.close();
            }
        }
    }
}

%>
<h3>Your profile</h3>
<%
if (failresult != null) {
    out.println("<p style=\"color:red\">" + failresult + "</p><br/>");
}
if (okresult != null) {
    out.println("<p style=\"color:green\">" + okresult + "</p><br/>");
}
%>
Change your password: <br/><br/>
<form method="POST">
    <center>
    <table>
    <tr>
        <td>Name</td>
        <td><%=username%></td>
    </tr>
    <tr>
        <td>New Password:</td>
        <td><input id="password1" name="password1" type="password"/></td>
    </tr>
    <tr>
        <td>Repeat Password:</td>
        <td><input id="password2" name="password2" type="password"/></td>
    </tr>
    <tr>
        <td></td>
        <td><input id="submit" type="submit" value="Submit"/></td>
    </tr>
    </table>
    </center>
</form>

<%


%>

<jsp:include page="/footer.jsp"/>
