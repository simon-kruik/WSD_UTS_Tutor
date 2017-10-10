<%-- 
    Document   : booking
    Created on : 11/09/2017, 3:18:41 PM
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
        <title>Booking</title>
    </head>
    <% 

           Student student = (Student)session.getAttribute("student");
           if (request.getParameter("email") != null && request.getParameter("type").equals("Student")) {
           String email = request.getParameter("email");
           String name = request.getParameter("name");
           String password = request.getParameter("password");
           String dob = request.getParameter("dob");
           }
           
           Tutor tutor = (Tutor)session.getAttribute("tutor");
           if (request.getParameter("email") != null && request.getParameter("type").equals("Tutor")) {
           String email = request.getParameter("email");
           String name = request.getParameter("name");
           String password = request.getParameter("password");
           String dob = request.getParameter("dob");
           }
           
        String bookingsFilePath = application.getRealPath("WEB-INF/bookings.xml");
           

        %>

        <jsp:useBean id="bookingsApp" class="uts.wsd.BookingsApplication" scope="application">
            <jsp:setProperty name="bookingsApp" property="bookingsFilePath" value="<%=bookingsFilePath%>"/>   
        </jsp:useBean>
        
        <body>
            
        <% 
            
            if (session.getAttribute("student") != null) {
            
        %>
            
            <h1>Create a booking</h1>
            
            <table>
                <form action="bookingTutor.jsp" method="post">
                    <tr>
                        <td>Choose subject:</td>
                        <td>
                            <select name="subject">
                                <option value="WSD">WSD</option>
                                <option value ="USP">USP</option>
                                <option value="SEP">SEP</option>
                                <option value="AppProg">AppProg</option>
                                <option value="MobileApp">MobileApp</option>
                            </select>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            
                        </td>
                          
                           
                            
                            
                    </tr>
                    
                    <tr>
                        <td><input type="submit" value="Submit"/></td>
                    </tr>
                     
                </form>
            </table>
            
            <p>Current bookings for <%=student.getName()%>:</p>
            
            
        <%
        }
        %>


         <%
             
             if (session.getAttribute("tutor") != null) {
                 
        %>
    
            <h1>Create a booking</h1>
            <p>Current bookings for <%=tutor.getName()%>
            
            
            
        <%
        }
        %>


    </body>
</html>
