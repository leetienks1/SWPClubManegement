/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Test;

import DAO.CoachDAO;
import DAO.JerseyDAO;
import DAO.JerseySizeDAO;
import DAO.MatchScheduleDAO;
import DAO.MatchStatisticDAO;
import DAO.NewsDAO;
import DAO.OrderDAO;
import DAO.OrderJerseyDetailsDAO;
import DAO.PlayerDAO;
import DAO.TeamDAO;
import DAO.UserDAO;
import Model.Coach;
import Model.JerseySize;
import Model.MatchSchedule;
import Model.MatchStatistic;
import Model.News;
import Model.OrderJersey;
import Model.OrderJerseyDetails;
import Model.Player;
import Model.Position;
import Model.User;
import Model.Role;
import Model.Team;
import Model.Tournament;
import java.security.spec.MGF1ParameterSpec;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Optional;

/**
 *
 * @author Desktop
 */
public class TestSql {

    public static void main(String[] args) throws ParseException {

     
        OrderJerseyDetailsDAO oddao= new OrderJerseyDetailsDAO();
        oddao.save(new OrderJerseyDetails(1, 1, 1, 1));
        System.out.println();

    JerseySizeDAO jsdao = new JerseySizeDAO();
        System.out.println(jsdao.getSizeByJerseyID(3));

//        OrderDAO odao = new OrderDAO();
//        System.out.println(odao.getLatestOrderByUID(1).get());
      
    }
}
