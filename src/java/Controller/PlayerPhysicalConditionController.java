/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.PlayerPhysicalConditionDAO;
import Model.PlayerPhysicalCondition;
import Model.Position;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
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
public class PlayerPhysicalConditionController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PlayerPhysicalConditionController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PlayerPhysicalConditionController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");

            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "LIST";
            }
            switch (theCommand) {
                case "LIST":
                    listlayerPhysicalCondition(request, response);
                    break;
                case "ADD":
                    addpPayerPhysicalCondition(request, response);
                    break;
                case "UPDATE":
                    updatePlayerPhysicalCondition(request, response);
                    break;
                case "DELETE":
                    deletepLayerPhysicalCondition(request, response);
                    break;
                default:
                    listlayerPhysicalCondition(request, response);
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

    // Method to list all DietPlanFoods
    private void listlayerPhysicalCondition(HttpServletRequest request, HttpServletResponse response) {
        try {
            PlayerPhysicalConditionDAO playerPhysicalConditionDAO = new PlayerPhysicalConditionDAO();
            List<PlayerPhysicalCondition> playerPhysicalCondition = playerPhysicalConditionDAO.getAll();
            request.getSession().setAttribute("playerPhysicalConditions", playerPhysicalCondition);
            response.sendRedirect("MEDICAL/playerphysicalcondition.jsp");
        } catch (Exception ex) {
            Logger.getLogger(DietPlanFoodController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Method to add a new playerPhysicalCondition
    private void addpPayerPhysicalCondition(HttpServletRequest request, HttpServletResponse response) {
        try {
            int conditionID = Integer.parseInt(request.getParameter("conditionID"));
            int userID = Integer.parseInt(request.getParameter("userID"));
            String ConditionDescription = request.getParameter("conditionDescription");

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate daterecorded = LocalDate.parse(request.getParameter("daterecorded"), formatter);

            PlayerPhysicalCondition playerPhysicalCondition = new PlayerPhysicalCondition(conditionID, userID, ConditionDescription, daterecorded);
            PlayerPhysicalConditionDAO playerPhysicalConditionDAO = new PlayerPhysicalConditionDAO();
            playerPhysicalConditionDAO.save(playerPhysicalCondition);
            request.setAttribute("Message", "Diet Plan Food added successfully!");
        } catch (Exception ex) {
            request.setAttribute("Message", "Error adding Diet Plan Food: " + ex.getMessage());
            Logger.getLogger(DietPlanFoodController.class.getName()).log(Level.SEVERE, null, ex);
        }
        listlayerPhysicalCondition(request, response);
    }

    // Method to update an existing playerPhysicalCondition
    private void updatePlayerPhysicalCondition(HttpServletRequest request, HttpServletResponse response) {
        try {
            int conditionID = Integer.parseInt(request.getParameter("conditionID"));
            int userID = Integer.parseInt(request.getParameter("playerId"));
            String ConditionDescription = request.getParameter("conditionDescription");

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate daterecorded = LocalDate.parse(request.getParameter("daterecorded"), formatter);

            PlayerPhysicalCondition playerPhysicalCondition = new PlayerPhysicalCondition(conditionID, userID, ConditionDescription, daterecorded);
            PlayerPhysicalConditionDAO playerPhysicalConditionDAO = new PlayerPhysicalConditionDAO();
            playerPhysicalConditionDAO.update(playerPhysicalCondition);
            request.setAttribute("Message", "Diet Plan Food updated successfully!");
        } catch (Exception ex) {
            request.setAttribute("Message", "Error updating Diet Plan Food: " + ex.getMessage());
            Logger.getLogger(DietPlanFoodController.class.getName()).log(Level.SEVERE, null, ex);
        }
        listlayerPhysicalCondition(request, response);
    }

    // Method to delete a playerPhysicalCondition
    private void deletepLayerPhysicalCondition(HttpServletRequest request, HttpServletResponse response) {
        try {
            int conditionID = Integer.parseInt(request.getParameter("conditionID"));
            PlayerPhysicalConditionDAO playerPhysicalConditionDAO = new PlayerPhysicalConditionDAO();
            playerPhysicalConditionDAO.delete(conditionID);
            request.setAttribute("Message", "Diet Plan Food deleted successfully!");
        } catch (Exception ex) {
            request.setAttribute("Message", "Error deleting Diet Plan Food: " + ex.getMessage());
            Logger.getLogger(DietPlanFoodController.class.getName()).log(Level.SEVERE, null, ex);
        }
        listlayerPhysicalCondition(request, response);
    }
}
