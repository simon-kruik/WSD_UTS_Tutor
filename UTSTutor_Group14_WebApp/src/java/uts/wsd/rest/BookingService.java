/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd.rest;

import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import java.io.*;
import uts.wsd.*;

/**
 *
 * @author Dallas Symons
 */
@Path("/bookingApp")
public class BookingService {

    @Context
    private ServletContext application;

    private BookingsApplication getBookingsApp() throws JAXBException, IOException {
        synchronized (application) {
            BookingsApplication bookingsApp = (BookingsApplication) application.getAttribute("bookingsApp");
            if (bookingsApp == null) {
                bookingsApp = new BookingsApplication();
                bookingsApp.setBookingsFilePath(application.getRealPath("WEB-INF/bookings.xml"));
                application.setAttribute("bookingsApp", bookingsApp);
            }
            return bookingsApp;
        }
    }

    // Test method for REST //
    @Path("test")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String test() {
        return "If you are reading this, REST is working";
    }

    @Path("bookings")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Bookings getBookings() throws Exception {
        return getBookingsApp().getBookings();
    }

    // @Path("bookings/{}")
    //@GET
   // @Produces(MediaType.APPLICATION_XML)
    //public Booking getBooking(@PathParam("email") String email) throws Exception {
    //    return getBookingsApp().getBookings().getBooking(email);
    //} 

}
