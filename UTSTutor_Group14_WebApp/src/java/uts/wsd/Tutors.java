/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import java.io.Serializable;
import java.util.ArrayList;
import javax.xml.bind.annotation.*;

/**
 *
 * @author Simon
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "tutors")
public class Tutors implements Serializable {
    @XmlElement(name="tutor")
    private ArrayList<Tutor> tutors = new ArrayList<Tutor>();

    public Tutors() {
    }
    
    public Tutors(ArrayList<Tutor> tutors) {
        this.tutors = tutors;
    }
    
    public ArrayList<Tutor> getTutors() {
        return tutors;
    }

    public void setTutors(ArrayList<Tutor> tutors) {
        this.tutors = tutors;
    }
    
    public void addTutor(Tutor tutor) {
        tutors.add(tutor);
    }
    public void removeTutor(Tutor tutor) {
        tutors.remove(tutor);
    }
    public Tutor login(String email, String password) {
        for (Tutor tutor : tutors) {
            if (tutor.getEmail().equals(email)) {
                if (tutor.getPassword().equals(password)){
                    return tutor; // The right student with the right password
                }
                
            return null; // Right email, wrong password
            }
        }
        return null; // No user with the right email found
    }
    public boolean checkEmail(String email) { // Returns true if email not found
        for (Tutor tutor : tutors) {
            if (tutor.getEmail().equals(email)) {
                return false;
            }
        }
        return true;
    }
    
    public String printDetails() {
        String details = "<table class='search'> \n" 
                + "<tr> \n"
                + "<th class='search'> Name </th>\n"
                + "<th class='search'> Email </th> \n"
                + "<th class='search'> Available </th> \n"
                + "<th class='search'> Subject </th> \n"
                + "</tr> \n";
        for (Tutor tutor : tutors) {
            details += "<tr> \n"
                    + "<td class='search'>" + tutor.getName() + "</td> \n"
                    + "<td class='search'>" + tutor.getEmail() + "</td> \n"
                    + "<td class='search'>" + tutor.getAvailable() + "</td> \n"
                    + "<td class='search'>" + tutor.getSubject() + "</td> \n"
                    + "</tr> \n";
        }
        details += "</table>";
        return details;
    }
    
    public Tutors searchSubject(String subject) {
        ArrayList<Tutor> matchingTutors = new ArrayList<Tutor>();
        subject = subject.toLowerCase();
        for (Tutor tutor : tutors) {
            if (tutor.getSubject().toLowerCase().equals(subject)) {
                matchingTutors.add(tutor);
            }
        }
        return new Tutors(matchingTutors);
    }
    public Tutors searchAvailable(String available) {
        ArrayList<Tutor> matchingTutors = new ArrayList<Tutor>();
        available = available.toLowerCase();
        for (Tutor tutor : tutors) {
            if (tutor.getAvailable().toLowerCase().equals(available)) {
                matchingTutors.add(tutor);
            }
        }
        return new Tutors(matchingTutors);
    }
    public Tutors searchName(String name) {
        ArrayList<Tutor> matchingTutors = new ArrayList<Tutor>();
        name = name.toLowerCase();
        for (Tutor tutor : tutors) {
            if (tutor.getName().toLowerCase().contains(name)) {
                matchingTutors.add(tutor);
            }
        }
        return new Tutors(matchingTutors);
    }
}
