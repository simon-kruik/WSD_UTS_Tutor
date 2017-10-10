<%-- 
    Document   : login
    Created on : 11/09/2017, 10:39:00 AM
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styles.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="SHORTCUT ICON" href="favicon.ico" />
        <link rel="icon" href="favicon.ico" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <%
        String errorMessage = " ";
        if (session.getAttribute("errorMessage") != null) {
            errorMessage = (String)session.getAttribute("errorMessage");
        }
        %>
    <body>
        <h1>Please login:</h1>
        <table>
            <form action="loginVerify.jsp" method="post">
            <tr>
                <td>Email: </td>
                <td>
                    <input name="email" type="text"/>
                </td>                
                <% if (errorMessage.contains("Email")) { %>
                <td style="color:red"> <%=errorMessage%></td>
                <% } %>
            </tr>
            <tr>
                <td>Password: </td>
                <td>
                    <input name="password" type="password"/>
                </td>
                <% if (errorMessage.contains("Password")) { %>
                <td style="color:red"> <%=errorMessage%></td>
                <% } %>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Login"/></td>
                
            </tr>
            </form>
        </table>
        
        <a href="index.jsp">Return to main page</a>
        
    </body>
</html>
