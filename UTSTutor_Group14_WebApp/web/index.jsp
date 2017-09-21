<%@page import="uts.wsd.User" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>index.jsp</title>
    </head>
    <body>
        
        <jsp:useBean id="user" class="uts.wsd.User" scope="session"/> 
        
        <%
        
        User myUser = (User)session.getAttribute("user");
        
        if (myUser.getName() == null) { %>
        
        <table style="float:right">
                <tr><td>You are not logged in</td></tr>
                <tr>
                    <td><a href="login.jsp">Login</a></td><td>|</td>
                    <td><a href="register.jsp">Register</a></td>
                </tr>
                        
        <% } else { %>
        
            <table style="float:right">
                <tr><td>You are logged in as <jsp:getProperty name="user" property="name"/></td>
                    <td>&lt;<jsp:getProperty name="user" property="email"/>&gt;</td>

                </tr>
                <tr>
                    <td></td>
                    <td><a href="logout.jsp">Logout</a>
                </tr>
            </table>
                    
            <ul>
                <li><a href="account.jsp">My Account</a></li>
            </ul>
            
        <% } %>
     
    </body>
</html>
