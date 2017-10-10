<%-- 
    Document   : bookingTutor
    Created on : 10/10/2017, 8:15:47 PM
    Author     : Simon
--%>

<%@page import="java.util.Random"%>
<%@page import="uts.wsd.Booking"%>
<%@page import="uts.wsd.Tutor"%>
<%@page import="uts.wsd.Tutors"%>
<%@page import="uts.wsd.Bookings"%>
<%@page import="uts.wsd.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking</title>
    </head>
    <body>
        <%            String bookingsFilePath = application.getRealPath("WEB-INF/bookings.xml");
                   String tutorsFilePath = application.getRealPath("WEB-INF/tutors.xml");

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
        <body>
        <%  // CREATING BOOKING
            if (request.getParameter("newBookingEmail") != null) {
                String newBookingEmail = request.getParameter("newBookingEmail");
            Student student = (Student)session.getAttribute("student");
            Tutor bookingTutor = tutors.searchEmail(newBookingEmail);
            if (bookingTutor == null) {
                %>
                <h1 style="color:red">Error!</h1>
                <p>That tutor doesn't exist. Please go back to <a href='booking.jsp'>Bookings</a> or <a href='main.jsp'>Main</a></p>
                <%
            }
            else if (bookingTutor.getAvailable().equals("No")) {
                %>
<h1 style="color:red">Unavailable!</h1>
<p>We're sorry, that tutor is currently unavailable, please go back to <a href='booking.jsp'>Bookings</a> or <a href='main.jsp'>Main</a></p>
<%
            }
            else {
                Random random = new Random();
                String id = "";    
                for (int i = 0; i < 10; i++) {
                    id += Integer.toString(random.nextInt(9));
                    if (i == 9) {
                        if (bookings.checkId(id)) {
                            i = 0;
                        }
                    }
                }
                Booking newBooking = new Booking(id,  student.getName(),student.getEmail(), bookingTutor.getName(), bookingTutor.getEmail(), bookingTutor.getSubject(),"active");
                //tutors.
                bookings.addBooking(newBooking);
                bookingsApp.updateBookingsXML(bookings, bookingsFilePath);

             %>
                   <script language="javascript">
                        window.location = "booking.jsp?type=\"single\"&id=\"<%=id%>\"";
                   </script>
            <%
            }
            
            
            
            
           }
            
           
        %>
    </body>
</html>
