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
    Student student = null;
    Tutor tutor = null;
    Students students = usersApp.getStudents();
    Tutors tutors = usersApp.getTutors();
    
    // Setting Tutor and Student values to null so they can be checked later on.
    if(request.getParameter("email") != null) {
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    
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
        <!--<p> Test if first user = <students.getStudents().get(0).getEmail()> // Checks if the students list has been loaded correctly -->
        <!--<p> Test if first tutor = <tutors.getTutors().get(0).getEmail()></p>// Checks if the tutors list has been loaded correctly-->
        <% 
           student = students.login(email, password);
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
        }
        else {
            if (session.getAttribute("student")!= null);{
                student = (Student)session.getAttribute("student");
            }
            if (session.getAttribute("tutor")!= null);{
                tutor = (Tutor)session.getAttribute("tutor");
            }
        }
           if (student != null) {
        %>
        <h2>
            Success!
        </h2>
        <p>
        Successfully logged in as Student: <%=student.getName()%>. <!--Please click <a href="main.jsp">here</a> to go to the main page. -->
        </p> 
        <% } 
         if (tutor != null) {
        %>
        <h2>
            Success!
        </h2>
        <p>
        Successfully logged in as Tutor: <%=tutor.getName()%>. 
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
