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
<jsp:useBean id="usersApp" class="uts.wsd.UsersApplication" scope="application">
    <jsp:setProperty name="usersApp" property="studentsFilePath" value="<%=studentsFilePath%>"/>
    <jsp:setProperty name="usersApp" property="tutorsFilePath" value="<%=tutorsFilePath%>"/>
</jsp:useBean>


<%
    String email = request.getParameter("email-field");
    String password = request.getParameter("password-field");
    Students students = usersApp.getStudents();
    Tutors tutors = usersApp.getTutors();
    Student student = null;
    Tutor tutor = null;
    // SIMON IS COOL
%>
<html>
    <head>
        <link rel="SHORTCUT ICON" href="favicon.ico" />
        <link rel="icon" href="favicon.ico" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logging in...</title>
    </head>
    <body>
        <% student = students.login(email, password);
           if (student != null) {
               session.setAttribute("student",student);
               session.setAttribute("tutor",null);
           }
           else {
               tutor = tutors.login(email, password);
               if (tutor != null) {
                   session.setAttribute("student", null);
                   session.setAttribute("tutor", tutor);
               }
           }
           if (student != null || tutor != null) {
        %>
        <h2>
            Success!
        </h2>
        <p>
        Successfully logged in as <%=student.getName()%>. Please click <a href="home.jsp">here</a> to go to the main page.
        </p> 
        <% } 
else if (student == null && tutor == null) {
        %>
        <h2 style="color: red">
            Failure!
        </h2>
        <P>
            Login failed. Please click <a href="login.jsp">here</a> to try again.
        </P>
        <% } %>
    </body>
    
</html>
