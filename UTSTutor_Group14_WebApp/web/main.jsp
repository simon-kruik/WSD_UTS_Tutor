<%-- 
    Document   : main
    Created on : 09/09/2017, 2:59:55 PM
    Author     : Simon & Dallas
--%>

<%@page import="uts.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <link rel="SHORTCUT ICON" href="favicon.ico" />
        <link rel="icon" href="favicon.ico" type="image/ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>

        <% 
           
           // Set filepaths
           String studentsFilePath = application.getRealPath("WEB-INF/students.xml"); 
           String tutorsFilePath = application.getRealPath("WEB-INF/tutors.xml");
           
        %>
           
        <jsp:useBean id="usersApp" class="uts.wsd.UsersApplication" scope="application">
            <jsp:setProperty name="usersApp" property="studentsFilePath" value="<%=studentsFilePath%>"/>
            <jsp:setProperty name="usersApp" property="tutorsFilePath" value="<%=tutorsFilePath%>"/>
        </jsp:useBean>
                
        <% 
            
           Students students = usersApp.getStudents();
           Tutors tutors = usersApp.getTutors();
           
           if (request.getParameter("email") != null && request.getParameter("type") == null) {
        %>
        
        <body>
            <jsp:include page="loginVerify.jsp"/>
        <% 
            }
            //When being redirected from register
           // If there are paremeters
           else if (request.getParameter("email") != null && request.getParameter("type") != null) {
           // Store that stuff
           String email = request.getParameter("email");
           String name = request.getParameter("name");
           String password = request.getParameter("password");
           String dob = request.getParameter("dob");
           String type = request.getParameter("type");
          
            if (request.getParameter("type").equals("Student") && students.checkEmail(email)) {
              Student student = new Student(name,email,password,dob);
              session.setAttribute("student",student);
              students.addStudent(student);
              out.println(students.getStudents());
              out.println(students.getStudents().get(0).getName());

              out.println(students.getStudents().get(1).getName());

              //out.println(students.getStudents().get(2).getName());

              //out.println(students.getStudents().get(3).getName());

              usersApp.updateStudentsXML(students, studentsFilePath);
            }
             if (request.getParameter("type").equals("Tutor") && tutors.checkEmail(email)) {
              Tutor tutor = new Tutor(name,email,password,dob);
              session.setAttribute("tutor",tutor);
              tutors.addTutor(tutor);
              usersApp.updateTutorsXML(tutors, tutorsFilePath);
            }   
           }
            Student student = (Student)session.getAttribute("student");
            if (session.getAttribute("student") != null) {
        %>
        
            <p>Welcome, <%=student.getName()%> (Student) </p>
            <p>Your Email is <%=student.getEmail()%>.</p>
            <p>Your password is <%=student.getPassword()%>.</p>
            <p>Your dob is <%=student.getDob()%>.</p>
            <p>First is <%= students.getStudents().get(0).getName() %>
            <a href="logout.jsp">Logout</a>
            

              <h1>Welcome, <%=student.getName()%></h1>
              
              <a href="booking.jsp">Make a booking</a>
              <a href="account.jsp">My account</a>
              
              <form>
              <input type="text" name="search" placeholder="Search for a tutor...">
              <select name="subject">
                  <option value="wsd">WSD</option>
                  <option value ="usp">USP</option>
                  <option value="sep">SEP</option>
                  <option value="appProg">AppProg</option>
                  <option value="mobileApp">MobileApp</option>
              </select>
              <select name="status">
                  <option value="unavailable">Unavailable</option>
                  <option value="available">Available</option>
              </select>
              <input type="submit" value="Submit">
              </form>
              
        <%       }       
            Tutor tutor = (Tutor)session.getAttribute("tutor");
            if (session.getAttribute("tutor") != null) {
%>

            <h1>Welcome, <%=tutor.getName()%></h1>
              
            <a href="booking.jsp">Make a booking</a>
            <a href="account.jsp">My account</a>


<%
           }
else if (session.getAttribute("student") == null && session.getAttribute("tutor") == null){
        %>
        
        
        <p> Nothing to see here folks... </p>
        
        
        
        <%
           }
        %>
        
 
    </body>
</html>
    