/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author hello
 */
public class user {
    int id;
    String username;
    String pasword;
    int role;

    public user(int id, String username, String pasword, int role) {
        this.id = id;
        this.username = username;
        this.pasword = pasword;
        this.role = role;
    }

    public user(int id, String username, int role) {
        this.id = id;
        this.username = username;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

   
    public user(String username, String pasword) {
        this.username = username;
        this.pasword = pasword;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPasword() {
        return pasword;
    }

    public void setPasword(String pasword) {
        this.pasword = pasword;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public user() {
    }
    
}
