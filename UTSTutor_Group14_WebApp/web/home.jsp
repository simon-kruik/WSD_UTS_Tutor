<%-- 
    Document   : home
    Created on : 09/09/2017, 2:59:55 PM
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

<html>
    <head>
        <link rel="SHORTCUT ICON" href="favicon.ico" />
        <link rel="icon" href="favicon.ico" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <body>
        
       

            <% Students students = usersApp.getStudents();
           Tutors tutors = usersApp.getTutors();
           
           String email = request.getParameter("email");
           String name = request.getParameter("name");
           String password = request.getParameter("password");
           String dob = request.getParameter("dob");


           if (request.getParameter("type").equals("Student") && students.checkEmail(email)) {
              Student user = new Student(name,email,password,dob);
              session.setAttribute("type","student");
              session.setAttribute("user",user);
              students.addStudent(user);
              usersApp.updateStudentXML(students, studentsFilePath);
              
           }
           else if (request.getParameter("type").equals("Tutor") && tutors.checkEmail(email)) {
              Tutor user = new Tutor(name,email,password,dob);
              session.setAttribute("type","tutor");
              session.setAttribute("user",user);
              tutors.addTutor(user);
              usersApp.updateTutorsXML(tutors, tutorsFilePath);
           }
           
        %>
        
        <p>Welcome, <%=name%>!</p>
        <p>Your Email is <%=email%>.</p>
        <p>Your password is <%=password%>.</p>
        <p>Your dob is <%-=dob%>.</p>
        
    </body>
</html>
    