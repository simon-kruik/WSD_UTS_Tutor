package uts.wsd;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Simon
 */
@XmlAccessorType(XmlAccessType.FIELD)
public class User implements Serializable{
    @XmlElement(name="name")
    String name;
    @XmlElement(name="email")
    String email;
    @XmlElement(name="password")
    String password;
    @XmlElement(name="dob")
    String dob;
    @XmlElement(name="type")
    String type;

    public User(String name, String email, String password, String dob, String type) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public User() {
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
    
}
