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
@XmlRootElement(name = "users")
public class Users implements Serializable {
    @XmlElement(name="user")
    private ArrayList<User> users = new ArrayList<User>();

    public Users() {
    }

    public ArrayList<User> getUsers() {
        return users;
    }

    public void setUsers(ArrayList<User> users) {
        this.users = users;
    }
    
    public void addUser(User user) {
        users.add(user);
    }
    public void removeUser(User user) {
        users.remove(user);
    }
    public User login(String email, String password) {
        for (User user : users) {
            if (user.getEmail().equals(email)) {
                if (user.getPassword().equals(password)){
                    return user; // The right student with the right password
                }
                
            return null; // Right email, wrong password
            }
        }
        return null; // No user with the right email found
    }
    public boolean checkEmail(String email) {
        for (User user : users) {
            if (user.getEmail().equals(email)) {
                return false;
            }
        }
        return true;
    }
}
