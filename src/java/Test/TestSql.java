/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Test;

<<<<<<< HEAD
import DAO.PlayerDAO;
import DAO.UserDAO;
import Model.Player;
=======
import DAO.NewsDAO;
import DAO.UserDAO;
import Model.News;
>>>>>>> e4605f0ed8abdc495081fa77bb962b79869f50c1
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
<<<<<<< HEAD
        User u = udao.login("admin@gmail.com","123");
        PlayerDAO pdao = new PlayerDAO();
        
       
        
=======
        User u =udao.getUserByEmail("Admin@gmail.com");
>>>>>>> e4605f0ed8abdc495081fa77bb962b79869f50c1
        
        System.out.println( u);
       
    }
}
