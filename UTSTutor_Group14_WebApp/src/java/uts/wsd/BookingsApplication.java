package uts.wsd;

import javax.xml.bind.*;
import java.io.*;

public class BookingsApplication implements Serializable {

    private String bookingsFilePath;
    private Bookings bookings;

    public BookingsApplication() {
    }

    public BookingsApplication(String bookingsFilePath, Bookings bookings) {
        this.bookingsFilePath = bookingsFilePath;
        this.bookings = bookings;
    }

    public String getBookingsFilePath() {
        return bookingsFilePath;
    }

    public void setBookingsFilePath(String bookingsFilePath) throws JAXBException, FileNotFoundException, IOException {
        this.bookingsFilePath = bookingsFilePath;
        JAXBContext jc = JAXBContext.newInstance(Bookings.class);
        Unmarshaller u = jc.createUnmarshaller();

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
        JAXBContext jc = JAXBContext.newInstance(Students.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(bookingsFilePath);
        m.marshal(bookings, fout);
        fout.close();
    }

}
