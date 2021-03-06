<%-- 
    Document   : bookingSingle
    Created on : 10/10/2017, 9:12:01 PM
    Author     : Simon
--%>

<%@page import="uts.wsd.Tutors"%>
<%@page import="uts.wsd.Bookings"%>
<%@page import="uts.wsd.Tutor"%>
<%@page import="uts.wsd.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Single Booking View</title>
        <%
            String tutorsFilePath = application.getRealPath("WEB-INF/tutors.xml");
            String bookingsFilePath = application.getRealPath("WEB-INF/bookings.xml");
            Student student = (Student)session.getAttribute("student");
            Tutor tutor = (Tutor)session.getAttribute("tutor");
            %>
         <jsp:useBean id="bookingsApp" class="uts.wsd.BookingsApplication" scope="application">
            <jsp:setProperty name="bookingsApp" property="bookingsFilePath" value="<%=bookingsFilePath%>"/>   
        </jsp:useBean>
        <jsp:useBean id="usersApp" class="uts.wsd.UsersApplication" scope="application">
            <jsp:setProperty name="usersApp" property="tutorsFilePath" value="<%=tutorsFilePath%>"/>
        </jsp:useBean>
         <% 
             Bookings bookings = bookingsApp.getBookings();
             Tutors tutors = usersApp.getTutors();
             %>
    </head>
    <body>
        <h1>Single Booking:</h1>
        <% if (request.getParameter("id")!= null) {
            String bookingId = request.getParameter("id");
            Bookings matchingBookings = bookings.searchId(bookingId);
            %>
            <%=matchingBookings.printDetails()%>
            <table>
                <tr>
                    <td><a href="cancelBooking.jsp?id=<%=bookingId%>">Cancel This Booking!!!</a></td>
                    <% if (tutor != null) { %>
                    <td><a href="completeBooking.jsp?id=<%=bookingId%>">Complete This Booking!!!</a></td>
                    <%} %>
                </tr>
            </table>
            <%
                
                
                
                
        }
        
        else {
            %>
            <h1 style="color:red">Error, incorrect ID</h1>
            <p> Please go back to <a href="booking.jsp">Bookings</a></p>
            <%
        }
            
            %>
    </body>
</html>
