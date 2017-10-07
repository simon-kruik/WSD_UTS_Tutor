<%-- 
    Document   : searchAction
    Created on : 07/10/2017, 11:35:25 AM
    Author     : Simon
--%>

<%@page import="uts.wsd.Tutors"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getParameter("searchTerm") != null) {
                    String tutorsFilePath = application.getRealPath("WEB-INF/tutors.xml");
        %>
        <jsp:useBean id="usersApp" class="uts.wsd.UsersApplication" scope="application">
            <jsp:setProperty name="usersApp" property="tutorsFilePath" value="<%=tutorsFilePath%>"/>
        </jsp:useBean>
        <%
            Tutors tutors = usersApp.getTutors();
            Tutors matchingTutors = new Tutors();
            String searchTerm = request.getParameter("searchTerm");
            String searchType = request.getParameter("searchType");
            if (searchType.equals("subject")) {
                    matchingTutors = tutors.searchSubject(searchTerm);
                    out.print(matchingTutors.getTutors());

            }
        %>
        <p>You searched by: <%=searchType%>, searching for: <%=searchTerm%></p>
            
            <% } %>
    </body>
</html>
