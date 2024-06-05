/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Test;


import DAO.MeetingDAO;
import DAO.NewsDAO;
import DAO.PlayerDAO;
import DAO.TrainingScheduleDAO;
import DAO.UserDAO;
import Model.Meeting;
import Model.News;
import Model.Player;
import Model.Position;
import Model.User;
import Model.Role;
import Model.TrainingSchedule;
import java.text.ParseException;
import java.time.LocalDate;
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
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        TrainingScheduleDAO tDAO = new TrainingScheduleDAO();
        LocalDate TrainingDate = LocalDate.parse("12-12-2022",formatter);
        String TrainingTime = "2:00";
        String Location = "location";
        String Description = "description";
        TrainingSchedule t = tDAO.get(2).get();
        t.setTrainingDate(TrainingDate);
        t.setTrainingTime(TrainingTime);
        t.setLocation(Location);
        t.setDescription(Description);
        tDAO.update(t);
        
       
    }
}
