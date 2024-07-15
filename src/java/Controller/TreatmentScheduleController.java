/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.TreatmentScheduleDAO;
import Model.TreatmentSchedule;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hoa-Nguyen
 */
public class TreatmentScheduleController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TreatmentScheduleController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TreatmentScheduleController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");

            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "LIST";
            }
            switch (theCommand) {
                case "LIST":
                    listTreatmentSchedule(request, response);
                    break;
                case "ADD":
                    addTreatmentSchedule(request, response);
                    break;
                case "UPDATE":
                    updateTreatmentSchedule(request, response);
                    break;
                case "DELETE":
                    deleteTreatmentSchedule(request, response);
                    break;
                default:
                    listTreatmentSchedule(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    // Method to list all TreatmentSchedule
    private void listTreatmentSchedule(HttpServletRequest request, HttpServletResponse response) {
        try {
            TreatmentScheduleDAO treatmentScheduleDAO = new TreatmentScheduleDAO();
            List<TreatmentSchedule> treatmentSchedule = treatmentScheduleDAO.getAll();
            request.getSession().setAttribute("treatmentSchedules", treatmentSchedule);
            response.sendRedirect("MEDICAL/treatmentSchedule.jsp");
        } catch (Exception ex) {
            Logger.getLogger(DietPlanFoodController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Method to add a new TreatmentSchedule
    private void addTreatmentSchedule(HttpServletRequest request, HttpServletResponse response) {
        try {
//            int treatmentID = Integer.parseInt(request.getParameter("treatmentID"));
            int userID = Integer.parseInt(request.getParameter("userID"));

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate daterecorded = LocalDate.parse(request.getParameter("treatmentdate"), formatter);

//            DateTimeFormatter formatterTime = DateTimeFormatter.ofPattern("hh:mm:ss");
            LocalTime treatmentTime = LocalTime.parse(request.getParameter("treatmenttime"));
            String Description = request.getParameter("description");
            System.out.println(Description);

            TreatmentSchedule treatmentSchedule = new TreatmentSchedule(0, userID, daterecorded, treatmentTime, Description);
            TreatmentScheduleDAO treatmentScheduleDAO = new TreatmentScheduleDAO();
            treatmentScheduleDAO.save(treatmentSchedule);
            request.setAttribute("Message", "Diet Plan Food added successfully!");
        } catch (Exception ex) {
            request.setAttribute("Message", "Error adding Diet Plan Food: " + ex.getMessage());
            Logger.getLogger(DietPlanFoodController.class.getName()).log(Level.SEVERE, null, ex);
        }
        listTreatmentSchedule(request, response);
    }

    // Method to update an existing TreatmentSchedule
    private void updateTreatmentSchedule(HttpServletRequest request, HttpServletResponse response) {
        try {
            int treatmentID = Integer.parseInt(request.getParameter("treatmentID"));
            int userID = Integer.parseInt(request.getParameter("playerId"));

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate daterecorded = LocalDate.parse(request.getParameter("treatmentdate"), formatter);

//            DateTimeFormatter formatterTime = DateTimeFormatter.ofPattern("hh:mm:ss");
            LocalTime treatmentTime = LocalTime.parse(request.getParameter("treatmenttime"));
            String Description = request.getParameter("description");
            System.out.println(Description);

            TreatmentSchedule treatmentSchedule = new TreatmentSchedule(treatmentID, userID, daterecorded, treatmentTime, Description);
            TreatmentScheduleDAO treatmentScheduleDAO = new TreatmentScheduleDAO();
            treatmentScheduleDAO.update(treatmentSchedule);
            request.setAttribute("Message", "Diet Plan Food updated successfully!");
        } catch (Exception ex) {
            request.setAttribute("Message", "Error updating Diet Plan Food: " + ex.getMessage());
            Logger.getLogger(DietPlanFoodController.class.getName()).log(Level.SEVERE, null, ex);
        }
        listTreatmentSchedule(request, response);
    }

    // Method to delete a TreatmentSchedule
    private void deleteTreatmentSchedule(HttpServletRequest request, HttpServletResponse response) {
        try {
            int treatmentID = Integer.parseInt(request.getParameter("treatmentID"));

            TreatmentScheduleDAO treatmentScheduleDAO = new TreatmentScheduleDAO();
            treatmentScheduleDAO.delete(treatmentID);
            request.setAttribute("Message", "Diet Plan Food deleted successfully!");
        } catch (Exception ex) {
            request.setAttribute("Message", "Error deleting Diet Plan Food: " + ex.getMessage());
            Logger.getLogger(DietPlanFoodController.class.getName()).log(Level.SEVERE, null, ex);
        }
        listTreatmentSchedule(request, response);
    }

}
