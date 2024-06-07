/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Test;

import DAO.CoachDAO;
import DAO.MatchScheduleDAO;
import DAO.MatchStatisticDAO;
import DAO.NewsDAO;
import DAO.PlayerDAO;
import DAO.TeamDAO;
import DAO.UserDAO;
import Model.Coach;
import Model.MatchSchedule;
import Model.MatchStatistic;
import Model.News;
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

     
        MatchScheduleDAO mDAO = new MatchScheduleDAO();
                System.out.println(mDAO.getMatchHaveNotStatistic());
                
                
                MatchStatisticDAO mstdao = new MatchStatisticDAO();
                
        System.out.println(mDAO.getMatchHaveNotStatistic());
      
      
    }
}
