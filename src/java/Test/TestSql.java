/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Test;

import DAO.NewsDAO;
import DAO.UserDAO;
import Model.News;
import Model.User;
import Model.Role;
import java.text.ParseException;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;
/**
 *
 * @author Desktop
 */
public class TestSql {
    public static void main(String[] args) throws ParseException {
        UserDAO udao = new UserDAO();
        User u =udao.get(8).get();   
        u.setName("tien");
         udao.update(u);
        System.out.println( u);
       
    }
}
