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
           String tutorsFilePath = application.getRealPath("WEB-INF/tutors.xml");

           Student student = (Student)session.getAttribute("student");
           Tutor tutor = (Tutor)session.getAttribute("tutor");

           /*if (request.getParameter("email") != null && request.getParameter("type").equals("Student")) {
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
*/ // Don't need this code, cause nobody is coming from register
           
           String bookingsFilePath = application.getRealPath("WEB-INF/bookings.xml");
           

        %>

        <jsp:useBean id="bookingsApp" class="uts.wsd.BookingsApplication" scope="application">
            <jsp:setProperty name="bookingsApp" property="bookingsFilePath" value="<%=bookingsFilePath%>"/>   
        </jsp:useBean>
        <jsp:useBean id="usersApp" class="uts.wsd.UsersApplication" scope="application">
            <jsp:setProperty name="usersApp" property="tutorsFilePath" value="<%=tutorsFilePath%>"/>
        </jsp:useBean>
        

        
        <body>
                    <h1> Bookings </h1>
        <% 
            if (request.getParameter("type").equals("single")) {
                %>
                
                <jsp:include page="bookingSingle.jsp"/>
                             
                <%
            }
            else {
            Bookings bookings = bookingsApp.getBookings();
            
            if (session.getAttribute("student") != null) {
            Tutors tutors = usersApp.getTutors();
            Tutor bookingTutor = tutors.searchEmail(request.getParameter("tutor"));
            if (request.getParameter("tutor") != null && bookingTutor == null) {
                %>
      <script language="javascript">
         window.location = "404.jsp";
      </script>
                <%
            }
            if (bookingTutor != null) {
        %>
            
            <h1>Create a booking</h1>
            
            
            <table>
                <form action="bookingTutor.jsp" method="post">    
                Creating a booking with <input type="text" name="newBookingEmail" value="<%=bookingTutor.getEmail()%>"/>
                    <tr>
                        <td><input type="submit" value="Submit"/></td>
                    </tr>
                     
                </form>
            </table>
            <% }
else { 
            %>
<h1>Create a booking</h1>
            <table>
                <form action="bookingTutor.jsp" method="post">    
                Creating a booking with <input type="text" name="newBookingEmail"/>
                    <tr>
                        <td><input type="submit" value="Submit"/></td>
                    </tr>
                     
                </form>
            </table>
            <% } %>
            <p>Current bookings for <%=student.getName()%>:</p>
            
            <%
                
                Bookings personalBookings = bookings.searchEmail(student.getEmail());
                %>
                
                <%=personalBookings.printDetails()%>
                
        <%
        }
        %>


         <%
             
             if (session.getAttribute("tutor") != null) {
                 
        %>
    
            <h1>Create a booking</h1>
            <p>Current bookings for <%=tutor.getName()%>
            
            <%
            Bookings personalBookings = bookings.searchEmail(tutor.getEmail());
            %>
            
            <%=personalBookings.printDetails()%>
            
        <%
        }
}
        %>

        <a href="main.jsp">Back to Main Menu </a>  <span>|</span>
  <a href="logout.jsp">Logout</a>
    </body>
</html>
