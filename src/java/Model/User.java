/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Desktop
 */
public class User {

    private int userId;
    private String userName;
    private String image;
    private String password;
    private String email;
    private Role role;

    public User() {
    }

    public User(int userId, String userName, String password, String email, Role role) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.role = role;
    }

    public User(String userName, String password, String email, Role role) {
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.role = role;

    }

    public User(int userId, String userName, String image, String password, String email, Role role) {
        this.userId = userId;
        this.userName = userName;
        this.image = image;
        this.password = password;
        this.email = email;
        this.role = role;
    }

    public User(String userName, String image, String password, String email, Role role) {
        this.userName = userName;
        this.image = image;
        this.password = password;
        this.email = email;
        this.role = role;
    }
    

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
    
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", image=" + image + ", password=" + password + ", email=" + email + ", role=" + role + '}';
    }

    

}