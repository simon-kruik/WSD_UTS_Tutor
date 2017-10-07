<%@page import="uts.wsd.Tutor"%>
<%@page import="uts.wsd.Student"%>
<%@page import="uts.wsd.User" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styles.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>index.jsp</title>
    </head>
    <body>

        <%
        
        Student student = (Student)session.getAttribute("student");
        Tutor tutor = (Tutor)session.getAttribute("tutor");
        
        if (student == null && tutor == null) { %>
        
        <table class="login" style="float:left">
            <p class="login">You are not logged in</p>
                <tr class="login">
                    <td class="login"><a href="login.jsp">Login</a></td><td class="login">|</td>
                    <td class="login"><a href="register.jsp">Register</a></td>
                </tr>
                        
        <% } else if (student != null ){ %>
        
            <table style="float:right">
                <tr><td>You are logged in as <%=student.getName()%></td>
                    <td>&lt;<%=student.getEmail()%>&gt;</td>

                </tr>
                <tr>
                    <td></td>
                    <td><a href="logout.jsp">Logout</a>
                </tr>
            </table>
                    
            <ul>
                <li><a href="account.jsp">My Account</a></li>
            </ul>
            
        <% } 
        else if (tutor != null ){ %>
        
            <table style="float:right">
                <tr><td>You are logged in as <%=tutor.getName()%></td>
                    <td>&lt;<%=tutor.getEmail()%>&gt;</td>

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
