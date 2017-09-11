<%-- 
    Document   : loginVerify
    Created on : 11/09/2017, 10:46:29 AM
    Author     : Simon
--%>

<%@page import="uts.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% String studentsFilePath = application.getRealPath("WEB-INF/students.xml"); 
   String tutorsFilePath = application.getRealPath("WEB-INF/tutors.xml");
%>


<%
    String email = request.getParameter("email-field");
    String password = request.getParameter("password-field");
    
    
    %>
<html>
    <head>
        <link rel="SHORTCUT ICON" href="favicon.ico" />
        <link rel="icon" href="favicon.ico" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logging in...</title>
        
    <p>Email: <%= email %></p>
    <p>Password: <%= password %>
    </head>
    
</html>
