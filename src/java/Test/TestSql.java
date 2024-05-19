/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Test;

import DAO.UserDAO;
import Model.User;
import Model.Role;
import java.util.Optional;
/**
 *
 * @author Desktop
 */
public class TestSql {
    public static void main(String[] args) {
        UserDAO udao = new UserDAO();
        User u = new User("T", "/image", "123", "t@gmail.com", Role.Coach);
        
       udao.delete(9);
    }
}
