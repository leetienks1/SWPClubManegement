/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Test;

import DAO.UserDAO;
import Model.User;
import Model.Role;
import java.text.ParseException;
import java.util.Date;
import java.util.Optional;
/**
 *
 * @author Desktop
 */
public class TestSql {
    public static void main(String[] args) throws ParseException {
        UserDAO udao = new UserDAO();
        User u = udao.getUserByEmail("minhhlnde170009@fpt.edu.vn");
        System.out.println(u.getPassword());
        u.setPassword("12345");
        udao.update(u);
        
       
    }
}
