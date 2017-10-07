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
            String noResults = "<h1> No search results found </h1>";
            if (searchType.equals("subject")) {
                    matchingTutors = tutors.searchSubject(searchTerm);
                    if (matchingTutors.getTutors().isEmpty()) {
                        session.setAttribute("searchResults",noResults);
                    }
                    else {
                        session.setAttribute("searchResults",matchingTutors.printDetails());
                    }
            }
            else if (searchType.equals("availability")) {
                
            }
            else if (searchType.equals("name")) {
                
            }

        %>
        <%=session.getAttribute("searchResults")%>
        <p>You searched by: <%=searchType%>, searching for: <%=searchTerm%></p>
            
            <% } %>
    </body>
</html>
