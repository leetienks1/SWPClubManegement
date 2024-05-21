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
        User u = udao.get(1).get();
//        u.setEmail("t@gmail.com");
//        u.setName("TIen");
u.setImage("dddddđ");
udao.editProfile(u);
        
        
        System.out.println(u.getDateOfBirth());
       
    }
}
