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
@XmlRootElement(name = "students")
public class Students implements Serializable {
    @XmlElement(name="student")
    private ArrayList<Student> students = new ArrayList<Student>();

    public Students() {
    }

    public ArrayList<Student> getStudents() {
        return students;
    }

    public void setStudents(ArrayList<Student> students) {
        this.students = students;
    }
    
    public void addStudent(Student student) {
        students.add(student);
    }
    public void removeStudent(Student student) {
        students.remove(student);
    }
    public Student login(String email, String password) {
        for (Student student : students) {
            if (student.getEmail().equals(email)) {
                if (student.getPassword().equals(password)){
                    return student; // The right student with the right password
                }
                
            return null; // Right email, wrong password
            }
        }
        return null; // No user with the right email found
    }
    public boolean checkEmail(String email) {
        for (Student student : students) {
            if (student.getEmail().equals(email)) {
                return false;
            }
        }
        return true;
    }
}
