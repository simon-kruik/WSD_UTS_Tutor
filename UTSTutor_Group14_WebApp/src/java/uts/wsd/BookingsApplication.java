package uts.wsd;

import javax.xml.bind.*;
import java.io.*;

public class BookingsApplication  {

    private String bookingsFilePath;
    private Bookings bookings;
    
    public String getBookingsFilePath() {
        return bookingsFilePath;
    }

    public void setBookingsFilePath(String bookingsFilePath) throws JAXBException, FileNotFoundException, IOException {
        
        JAXBContext jc = JAXBContext.newInstance(Bookings.class);
        Unmarshaller u = jc.createUnmarshaller();
        this.bookingsFilePath = bookingsFilePath;
        
        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(bookingsFilePath);
        bookings = (Bookings) u.unmarshal(fin); // This loads the "bookings" object
        fin.close();
    }

    public Bookings getBookings() {
        return bookings;
    }

    public void updateBookingsXML(Bookings bookings, String bookingsFilePath) throws Exception {
        this.bookings = bookings;
        this.bookingsFilePath = bookingsFilePath;
        JAXBContext jc = JAXBContext.newInstance(Bookings.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(bookingsFilePath);
        m.marshal(bookings, fout);
        fout.close();
    }

}
