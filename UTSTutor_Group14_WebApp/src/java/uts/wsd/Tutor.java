/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import java.io.Serializable;
import javax.xml.bind.annotation.*;

/**
 *
 * @author Simon
 */
@XmlAccessorType(XmlAccessType.FIELD)
public class Tutor {
    @XmlElement(name="name")
    String name;
    @XmlElement(name="email")
    String email;
    @XmlElement(name="password")
    String password;
    @XmlElement(name="dob")
    String dob;
    @XmlElement(name="subject")
    String subject;
    @XmlElement(name="available")
    String available;
    public Tutor() {
        
    }
    
    public Tutor(String name, String email, String password, String dob) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;
        this.available = "Yes";
    }

    public String getAvailable() {
        return available;
    }

    public void setAvailable(String available) {
        this.available = available;
    }
    
    public Tutor(String name, String email, String password, String dob, String subject) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;
        this.subject = subject;
        this.available="yes";
        
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }
}