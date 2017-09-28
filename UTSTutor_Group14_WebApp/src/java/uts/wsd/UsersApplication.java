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
    private String usersFilePath;
    private Users users;


    public UsersApplication() {
    }

    public UsersApplication(String usersFilePath, Users users) {
        this.usersFilePath = usersFilePath;
        this.users = users;
    }

    public String getUsersFilePath() {
        return usersFilePath;
    }

    public void setUsersFilePath(String usersFilePath) throws Exception {
        this.usersFilePath = usersFilePath;
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Unmarshaller u = jc.createUnmarshaller();
 
        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(usersFilePath);
        users = (Users)u.unmarshal(fin); // This loads the "users" object
        fin.close();
    }

  


    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    
    public void updateUserXMl(Users users, String usersFilePath) throws Exception {
        this.users = users;
        this.usersFilePath = usersFilePath;
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(usersFilePath);
        m.marshal(users, fout);
        fout.close();
    }
    

}
