<%-- 
    Document   : completeBooking
    Created on : 10/10/2017, 9:56:22 PM
    Author     : Simon
--%>
<%@page import="uts.wsd.Booking"%>
<%@page import="uts.wsd.Tutors"%>
<%@page import="uts.wsd.Bookings"%>
<%@page import="uts.wsd.Tutor"%>
<%@page import="uts.wsd.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
             String id = request.getParameter("id");
             Booking booking = bookings.getBooking(id);
             booking.setStatus("completed");
             tutors.setTutorAvailable(booking.getTutorEmail());
             usersApp.updateTutorsXML(tutors, tutorsFilePath);
             bookings.updateBooking(booking);
             bookingsApp.updateBookingsXML(bookings, bookingsFilePath);
             
             %>
    </head>

    <body>
        <h1>Hello World!</h1>
      <script language="javascript">
         window.location = "booking.jsp";
      </script>
    </body>
</html>
