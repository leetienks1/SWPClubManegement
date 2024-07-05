package Controller;

import DAO.DietPlanDAO;
import Model.DietPlan;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DietPlanController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DietPlanController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DietPlanController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");

            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "LIST";
            }
            System.out.println(theCommand);
            switch (theCommand) {
                case "LIST":
                    listDietPlans(request, response);
                    break;
                case "ADD":
                    addDietPlan(request, response);
                    break;
                case "UPDATE":
                    updateDietPlan(request, response);
                    break;
                case "DELETE":
                    deleteDietPlan(request, response);
                    break;
                default:
                    listDietPlans(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(DietPlanController.class.getName()).log(Level.SEVERE, null, ex);
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
    }

    public void listDietPlans(HttpServletRequest request, HttpServletResponse response) {
        try {
            DietPlanDAO dietPlanDAO = new DietPlanDAO();
            List<DietPlan> dietPlans = dietPlanDAO.getAll();
            request.getSession().setAttribute("dietPlans", dietPlans);
            response.sendRedirect("MEDICAL/medicalPage.jsp");
        } catch (IOException ex) {
            Logger.getLogger(DietPlanController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addDietPlan(HttpServletRequest request, HttpServletResponse response) {
        try {
            int userID = Integer.parseInt(request.getParameter("userID"));
            String planDescription = request.getParameter("planDescription");

            DietPlan dietPlan = new DietPlan(0, userID, planDescription); // Assuming ID is auto-generated
            DietPlanDAO dietPlanDAO = new DietPlanDAO();
            dietPlanDAO.save(dietPlan);

            request.getSession().setAttribute("Message", "Add operation successful");
        } catch (NumberFormatException ex) {
            Logger.getLogger(DietPlanController.class.getName()).log(Level.SEVERE, null, ex);
        }
        listDietPlans(request, response);
    }

    public void updateDietPlan(HttpServletRequest request, HttpServletResponse response) {
        try {
            int dietPlanID = Integer.parseInt(request.getParameter("dietplanID"));
            int userID = Integer.parseInt(request.getParameter("playerId"));
            String planDescription = request.getParameter("planDescription");
            DietPlan dietPlan = new DietPlan(dietPlanID, userID, planDescription);
            DietPlanDAO dietPlanDAO = new DietPlanDAO();
            dietPlanDAO.update(dietPlan);

            request.getSession().setAttribute("Message", "Update operation successful");
        } catch (NumberFormatException ex) {
            Logger.getLogger(DietPlanController.class.getName()).log(Level.SEVERE, null, ex);
        }
        listDietPlans(request, response);
    }

    public void deleteDietPlan(HttpServletRequest request, HttpServletResponse response) {
        try {
            int dietPlanID = Integer.parseInt(request.getParameter("dietPlanID"));
            DietPlanDAO dietPlanDAO = new DietPlanDAO();
            dietPlanDAO.delete(dietPlanID);
            request.getSession().setAttribute("Message", "Delete operation successful");
        } catch (NumberFormatException ex) {
            Logger.getLogger(DietPlanController.class.getName()).log(Level.SEVERE, null, ex);
        }
        listDietPlans(request, response);
    }
}
