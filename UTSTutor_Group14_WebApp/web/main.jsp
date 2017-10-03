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
            
           String email = request.getParameter("email");
           String name = request.getParameter("name");
           String password = request.getParameter("password");
           String dob = request.getParameter("dob");
<<<<<<< HEAD:UTSTutor_Group14_WebApp/web/home.jsp
           String type = request.getParameter("type");
           
           String studentsFilePath = application.getRealPath("WEB-INF/students.xml"); 
           String tutorsFilePath = application.getRealPath("WEB-INF/tutors.xml");
           
        %>
           
        <jsp:useBean id="usersApp" class="uts.wsd.UsersApplication" scope="application">
            <jsp:setProperty name="usersApp" property="studentsFilePath" value="<%=studentsFilePath%>"/>
            <jsp:setProperty name="usersApp" property="tutorsFilePath" value="<%=tutorsFilePath%>"/>
        </jsp:useBean>
                
        <% 
            
           Users users = usersApp.getUsers();
           
        %>
        
        <body>
        
        <% 
            
            if (request.getParameter("type").equals("Student") && users.checkEmail(email)) {
              User user = new User(name,email,password,dob,type);
=======
           
           if (request.getParameter("type").equals("Student") && students.checkEmail(email)) {
              Student user = new Student(name,email,password,dob);
>>>>>>> d8fd4af584789c90348b55c59cd8f882136d2203:UTSTutor_Group14_WebApp/web/main.jsp
              session.setAttribute("type","student");
              session.setAttribute("user",user);
              users.addUser(user);
              usersApp.updateUserXMl(users, studentsFilePath);
        %>
        
            <p>Welcome, <%=name%> (<%=type%>) </p>
            <p>Your Email is <%=email%>.</p>
            <p>Your password is <%=password%>.</p>
            <p>Your dob is <%=dob%>.</p>

            <a href="logout.jsp">Logout</a>
            
        <%
              
<<<<<<< HEAD:UTSTutor_Group14_WebApp/web/home.jsp
           }
           else if (request.getParameter("type").equals("Tutor") && users.checkEmail(email)) {
              User user = new User(name,email,password,dob,type);
              session.setAttribute("type","tutor");
              session.setAttribute("user",user);
              users.addUser(user);
              usersApp.updateUserXMl(users, tutorsFilePath);
        %>
        
        <p>Welcome, <%=name%> (<%=type%>)</p>
        <p>Your Email is <%=email%>.</p>
        <p>Your password is <%=password%>.</p>
        <p>Your dob is <%=dob%>.</p>
=======
              %>
              <h1>Welcome, <%=name%></h1>
              
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
           else if (request.getParameter("type").equals("Tutor") && tutors.checkEmail(email)) {
              Tutor user = new Tutor(name,email,password,dob);
              session.setAttribute("type","tutor");
              session.setAttribute("user",user);
              tutors.addTutor(user);
              usersApp.updateTutorsXML(tutors, tutorsFilePath);
%>

            <h1>Welcome, <%=name%></h1>
              
            <a href="booking.jsp">Make a booking</a>
            <a href="account.jsp">My account</a>


<%
           }
           
        %>
        
>>>>>>> d8fd4af584789c90348b55c59cd8f882136d2203:UTSTutor_Group14_WebApp/web/main.jsp
        
        
        
        
        
        <%
           }
        %>
        
 
    </body>
</html>
    