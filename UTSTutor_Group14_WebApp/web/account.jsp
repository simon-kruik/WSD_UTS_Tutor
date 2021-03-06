<%-- 
    Document   : account
    Created on : 11/09/2017, 3:19:09 PM
    Author     : Simon
--%>

<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styles.css">
        <link rel="SHORTCUT ICON" href="favicon.ico" />
        <link rel="icon" href="favicon.ico" type="image/ico" />        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Account | UTSTutor</title>

        <%

            // Sets current login information obtained from main // 
            Student student = (Student) session.getAttribute("student");
            if (request.getParameter("email") != null && request.getParameter("type").equals("Student")) {
                String email = request.getParameter("email");
                String name = request.getParameter("name");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");
            }

            Tutor tutor = (Tutor) session.getAttribute("tutor");
            if (request.getParameter("email") != null && request.getParameter("type").equals("Tutor")) {
                String email = request.getParameter("email");
                String name = request.getParameter("name");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");
            }

        %>
        <title>View account</title>
    </head>

    <h1> My Account </h1>

    <%        // If statement to see if the student/tutor has updated account details posted from edit_account // 
        if (session.getAttribute("student") != null) {
            String newName = request.getParameter("newName");
            String newPassword = request.getParameter("newPassword");
            String newDob = request.getParameter("newDob");
            if (request.getParameter("newName") != null && request.getParameter("newPassword") != null && request.getParameter("newDob") != null) {
                student.setName(newName);
                student.setDob(newDob);
                student.setPassword(newPassword);
            }
    %>
    <body>
        <h1>Welcome, <%=student.getName()%></h1>
        <p>Your email is <%=student.getEmail()%></p>
        <p>Your name is <%=student.getName()%></p>
        <p>Your password is <%=student.getPassword()%></p>
        <p>Your date of birth is <%=student.getDob()%></p>
        <a href="edit_account.jsp">Edit account details</a>
        <a href="main.jsp"> Back to Main Menu </a>

    </body>
    <% } else if (session.getAttribute("tutor") != null) {
        String newName = request.getParameter("newName");
        String newPassword = request.getParameter("newPassword");
        String newDob = request.getParameter("newDob");
        if (request.getParameter("newName") != null && request.getParameter("newPassword") != null && request.getParameter("newDob") != null) {
            tutor.setName(newName);
            tutor.setDob(newDob);
            tutor.setPassword(newPassword);
        }
    %>
    <h1>Welcome, <%=tutor.getName()%></h1>
    <p>Your email is <%=tutor.getEmail()%></p>
    <p>Your name is <%=tutor.getName()%></p>
    <p>Your password is <%=tutor.getPassword()%></p>
    <p>Your date of birth is <%=tutor.getDob()%></p>
    <p>Your subject is <%=tutor.getSubject()%></p>
    <p>Are you available?: <%=tutor.getAvailable()%></p>
    <a href="edit_account.jsp">Edit account details</a>
    <a href="main.jsp"> Back to Main Menu </a>
    <% }%>
</html>
