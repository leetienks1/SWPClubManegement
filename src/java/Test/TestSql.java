/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Test;


import DAO.TeamDAO;
import DAO.TicketDAO;
import Model.Ticket;
import java.math.BigDecimal;
import java.text.ParseException;


/**
 * @author Desktop
 */
public class TestSql {


    public static void main(String[] args) throws ParseException {
        TicketDAO t =new TicketDAO();
        System.out.println(t.getAll());
    }
}
