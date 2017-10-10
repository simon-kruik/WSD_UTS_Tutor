package uts.wsd;

import java.io.Serializable;
import javax.xml.bind.annotation.*;
import java.util.ArrayList;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name ="bookings", namespace="http://learn.it.uts.edu.au/wsd")
public class Bookings implements Serializable {
    
    @XmlElement(name = "booking")
    private ArrayList<Booking> bookings = new ArrayList<Booking>();
    
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
    
    }

}