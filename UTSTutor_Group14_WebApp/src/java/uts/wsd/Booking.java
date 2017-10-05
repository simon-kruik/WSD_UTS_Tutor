package uts.wsd;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

@XmlAccessorType(XmlAccessType.FIELD)
public class Booking implements Serializable {
    
    @XmlElement(name="bookingID")
    String bookingID;
    
    @XmlElement(name="studentName")
    String studentName;
    
    @XmlElement(name="studentEmail")
    String studentEmail;
    
    @XmlElement(name="tutor")
    String tutor;
    
    @XmlElement(name="subject")
    String subject;
    
    @XmlElement(name="status")
    String status;
    
    public Booking () {
        
    }
    
    public Booking(String bookingID, String studentName, String studentEmail, String tutor, String subject, String status) {
        this.bookingID = bookingID;
        this.studentName = studentName;
        this.studentEmail = studentEmail;
        this.tutor = tutor;
        this.subject = subject;
        this.status = status;
    }
    
    //Getters & setters
    public void setBookingID(String bookingID) {
        this.bookingID = bookingID;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }

    public void setTutor(String tutor) {
        this.tutor = tutor;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getBookingID() {
        return bookingID;
    }

    public String getStudentName() {
        return studentName;
    }

    public String getStudentEmail() {
        return studentEmail;
    }

    public String getTutor() {
        return tutor;
    }

    public String getSubject() {
        return subject;
    }

    public String getStatus() {
        return status;
    }
}
