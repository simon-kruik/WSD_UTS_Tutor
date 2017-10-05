<%-- 
    Document   : account
    Created on : 11/09/2017, 3:19:09 PM
    Author     : Simon
--%>

<%@page import="uts.wsd.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="SHORTCUT ICON" href="favicon.ico" />
        <link rel="icon" href="favicon.ico" type="image/ico" />        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Account | UTSTutor</title>
        <%
           Student student = (Student)session.getAttribute("student");
           String email = request.getParameter("email");
           String name = request.getParameter("name");
           String password = request.getParameter("password");
           String dob = request.getParameter("dob");
        %>
        <title>View account</title>
    </head>
    <body>
        <h1>Welcome, <%=student.getName()%></h1>
        <p>Your email is <%=student.getEmail()%></p>
        <p>Your name is <%=name%></p>
        <p>Your password is <%=password%></p>
        <p>Your date of birth is <%=dob%></p>
        <a href="edit_account.jsp">Edit account details</a>
        
    </body>
</html>
