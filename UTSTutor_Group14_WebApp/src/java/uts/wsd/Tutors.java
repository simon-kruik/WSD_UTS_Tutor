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
}
