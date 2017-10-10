package uts.wsd;

import java.io.Serializable;
import javax.xml.bind.annotation.*;
import java.util.ArrayList;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name ="bookings", namespace="http://learn.it.uts.edu.au/wsd")
public class Bookings implements Serializable {
    
    @XmlElement(name = "booking")
    private ArrayList<Booking> bookings = new ArrayList<Booking>();

    public Bookings() {
    
    }
    
    public Bookings(ArrayList<Booking> bookings) {
        this.bookings=bookings;
    }
    
    public ArrayList<Booking> getBookings() {
        return bookings;
    }
    
    public Booking getBooking(String bookingID) {
        for (Booking booking : bookings) {
            if (booking.getBookingID().equals(bookingID)) {
                return booking;
            }
        }
        return null;
    }
    
    
    // Returns true if exists
    public boolean checkId(String id) {
        for (Booking booking : bookings) {
            if (booking.getBookingID().equals(id)) {
                return true;
            }
        }
        return false;
    }
    
    public void addBooking(Booking booking) {
        bookings.add(booking);
        //change tutor status to "unavailable"
    }
    
    public void removeBooking(Booking booking) {
        bookings.remove(booking);
        //change tutor status to "available"
    }
    
    public void updateBooking(Booking booking) {
        //change booking status: active, cancelled, or completed
        Booking updatedBooking = booking;
        bookings.remove(getBooking(booking.getBookingID()));
        bookings.add(updatedBooking);
         
    }
    
    public Bookings searchEmail(String email) {
        ArrayList<Booking> bookingsList = new ArrayList<Booking>();
        for(Booking booking : bookings) {
            if (booking.getStudentEmail().equals(email) || booking.getTutorEmail().equals(email)) {
                bookingsList.add(booking);
            }
        }
        return new Bookings(bookingsList);
    }
    
    public Bookings searchId(String id) {
        ArrayList<Booking> bookingsList = new ArrayList<Booking>();
        for(Booking booking : bookings) {
            if (booking.getBookingID().equals(id)) {
                bookingsList.add(booking);
            }
        }
        return new Bookings(bookingsList);
    }

    public String printDetails() {
        String details = "<table class='search'> \n" 
                + "<tr> \n"
                + "<th class='search'> BookingID </th>\n"
                + "<th class='search'> Student Name </th> \n"
                + "<th class='search'> Student Email</th> \n"
                + "<th class='search'> Tutor Name </th> \n"
                + "<th class='search'> Tutor Email </th> \n"
                + "<th class='search'> Subject </th> \n"
                + "<th class='search'> Status </th> \n"                
                + "</tr> \n";
        for (Booking booking : bookings) {
                details += "<tr> \n"
                    + "<td class='search'>" + "<a href=\"booking.jsp?type=single&id=" +booking.getBookingID() + "\">" +booking.getBookingID() + "</a></td> \n"
                    + "<td class='search'>" + booking.getStudentName() + "</td> \n"
                    + "<td class='search'>" + booking.getStudentEmail() + "</td> \n"
                    + "<td class='search'>" + booking.getTutorName() + "</td> \n"
                    + "<td class='search'>" + booking.getTutorEmail() + "</td> \n"
                    + "<td class='search'>" + booking.getSubject() + "</td> \n"
                    + "<td class='search'>" + booking.getStatus() + "</td> \n"
                    + "</tr> \n";
                 }
        details += "</table>";
        return details;

}
}