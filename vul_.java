String username = "steve";
String password = "blue";
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/test?" +
                  "user=" + username + "&password=" + password); // Sensitive
