/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.Serializable;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

/**
 *
 * @author Simon
 */
public class UsersApplication implements Serializable{
    private String studentsFilePath;
    private String tutorsFilePath;
    private Students students;
    private Tutors tutors;

    public UsersApplication() {
    }

    public UsersApplication(String studentsFilePath, String tutorsFilePath, Students students, Tutors tutors) {
        this.studentsFilePath = studentsFilePath;
        this.tutorsFilePath = tutorsFilePath;
        this.students = students;
        this.tutors = tutors;
    }

    public String getStudentsFilePath() {
        return studentsFilePath;
    }

    public void setStudentsFilePath(String studentsFilePath) throws Exception {
        this.studentsFilePath = studentsFilePath;
        JAXBContext jc = JAXBContext.newInstance(Students.class);
        Unmarshaller u = jc.createUnmarshaller();
 
        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(studentsFilePath);
        students = (Students)u.unmarshal(fin); // This loads the "users" object
        fin.close();
    }

    public String getTutorsFilePath() {
        return tutorsFilePath;
    }

    public void setTutorsFilePath(String tutorsFilePath) throws Exception {
        this.tutorsFilePath = tutorsFilePath;
        JAXBContext jc = JAXBContext.newInstance(Tutors.class);
        Unmarshaller u = jc.createUnmarshaller();
 
        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(tutorsFilePath);
        tutors = (Tutors)u.unmarshal(fin); // This loads the "users" object
        fin.close();
    }

    public Students getStudents() {
        return students;
    }

    public void setStudents(Students students) {
        this.students = students;
    }

    public Tutors getTutors() {
        return tutors;
    }

    public void setTutors(Tutors tutors) {
        this.tutors = tutors;
    }
    
    public void updateStudentXML(Students students, String studentsFilePath) throws Exception {
        this.students = students;
        this.studentsFilePath = studentsFilePath;
        JAXBContext jc = JAXBContext.newInstance(Students.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(studentsFilePath);
        m.marshal(students, fout);
        fout.close();
    }
    
    public void updateTutorsXML(Tutors tutors, String tutorsFilePath) throws Exception {
        this.tutors = tutors;
        this.tutorsFilePath = tutorsFilePath;
        JAXBContext jc = JAXBContext.newInstance(Tutors.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(tutorsFilePath);
        m.marshal(tutors, fout);
        fout.close();
    }
}
