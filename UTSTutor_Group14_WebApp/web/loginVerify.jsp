<%-- 
    Document   : loginVerify
    Created on : 11/09/2017, 10:46:29 AM
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String email = request.getParameter("email-field");
    String password = request.getParameter("password-field");
    
    
    
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logging in...</title>
    <p>Emword %>ail: <%= email %></p>
    <p>Password: <%= password %>
    </head>
    
</html>
