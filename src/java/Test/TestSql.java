/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Test;


import DAO.NewsDAO;
import DAO.PlayerDAO;
import DAO.UserDAO;
import Model.News;
import Model.Player;
import Model.Position;
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
       NewsDAO ndao = new NewsDAO();
       UserDAO udao = new UserDAO();
  
        User u = udao.login("admin@gmail.com","123");
        PlayerDAO pdao = new PlayerDAO();
   
        
        System.out.println( u);
       News news = ndao.get(2).get();
       news.setNewsTitle("title");
       ndao.save(news);
        System.out.println(news);
       
    }
}
