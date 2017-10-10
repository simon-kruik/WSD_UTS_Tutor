package uts.wsd;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name ="booking", namespace="http://learn.it.uts.edu.au/wsd")
@XmlAccessorType(XmlAccessType.FIELD)
public class Booking implements Serializable {
    
    @XmlElement(name="bookingID")
    String bookingID;
    
    @XmlElement(name="studentName")
    String studentName;
    
    @XmlElement(name="studentEmail")
    String studentEmail;
    
    @XmlElement(name="tutorName")
    String tutorName;
    
    @XmlElement(name="tutorEmail")
    String tutorEmail;
    
    @XmlElement(name="subject")
    String subject;
    
    @XmlElement(name="status")
    String status;
    
    public Booking() {
        
    }
    
    public Booking(String bookingID, String studentName, String studentEmail, String tutorName, String tutorEmail, String subject, String status) {
        this.bookingID = bookingID;
        this.studentName = studentName;
        this.studentEmail = studentEmail;
        this.tutorName = tutorName;
        this.tutorEmail = tutorEmail;
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

    public void setTutorName(String tutorName) {
        this.tutorName = tutorName;
    }
    
    public void setTutorEmail(String tutorEmail) {
        this.tutorEmail = tutorEmail;
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

    public String getTutorName() {
        return tutorName;
    }
    
    public String getTutorEmail() {
        return tutorEmail;
    }

    public String getSubject() {
        return subject;
    }

    public String getStatus() {
        return status;
    }
}
