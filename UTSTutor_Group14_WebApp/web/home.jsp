<%-- 
    Document   : home
    Created on : 09/09/2017, 2:59:55 PM
    Author     : Simon
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
        
        <a href="logout.jsp">Logout</a>
        
        <%
           }
        %>
        
 
    </body>
</html>
    