<%-- 
    Document   : register
    Created on : 11/09/2017, 3:17:50 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register an account</title>
        <link rel="SHORTCUT ICON" href="favicon.ico" />
        <link rel="icon" href="favicon.ico" type="image/ico" />
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
               
        <h1>Hello World!</h1>
        <table>
            <tr>
            <form action="login.jsp" method="post">
        <td>Email</td>  
                <td><input type="text" name="email"></td>
            
            </tr>
            
      <tr>
            <td>Full Name</td>  
                <td><input type="text" name="name"></td>
            
            </tr>
        
       <tr>
            <td>Password</td>  
                <td><input type="password" name="password"></td>
            
            </tr>
            <tr>
                <td>Date of Birth</td>
                <td><input type="date" name="dob"></td>
            </tr>
            <tr>
                <td>User type</td>
                <td>
                    <select name="type">
                        <option value="Student">Student</option>
                        <option value="Tutor">Tutor</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Register"></td>

            </tr>
            </form>
        </table>
    </body>
</html>
