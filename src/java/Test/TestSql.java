/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Test;


import DAO.CoachDAO;
import DAO.DashboardPlayerDAO;
import DAO.ExpectedLineupDAO;
import DAO.JerseyDAO;
import DAO.JerseySizeDAO;
import DAO.MatchScheduleDAO;
import DAO.MatchStatisticDAO;
import DAO.NewsDAO;
import DAO.OrderDAO;
import DAO.OrderJerseyDetailsDAO;
import DAO.PlayerDAO;
import DAO.TeamDAO;
import DAO.TrainingScheduleDAO;
import DAO.UserDAO;
import Model.Coach;
import Model.Dashboard1DTO;
import Model.ExpectedLineups;
import Model.JerseySize;
import Model.JerseySizeEnum;
import Model.MatchSchedule;
import Model.MatchStatistic;
import Model.News;
import Model.OrderJersey;
import Model.OrderJerseyDetails;
import Model.Player;
import Model.PlayerStat;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;




/**
 *
 * @author Desktop
 */
public class TestSql {
    

    public static void main(String[] args) throws ParseException {
       PlayerDAO p = new PlayerDAO();
       PlayerStat ps = new PlayerStat(1016, 1014, 1, 0, 0,1);
        System.out.println(p.getPlayerStatss(1016));
    }
}
