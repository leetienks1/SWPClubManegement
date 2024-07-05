package Controller;

import DAO.DietPlanFoodDAO;
import Model.DietPlanFood;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DietPlanFoodController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DietPlanFoodController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DietPlanFoodController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            // Get the command parameter
            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "LIST";
            }
            switch (theCommand) {
                case "LIST":
                    listDietPlanFoods(request, response);
                    break;
                case "ADD":
                    addDietPlanFood(request, response);
                    break;
                case "UPDATE":
                    updateDietPlanFood(request, response);
                    break;
                case "DELETE":
                    deleteDietPlanFood(request, response);
                    break;
                default:
                    listDietPlanFoods(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(DietPlanFoodController.class.getName()).log(Level.SEVERE, null, ex);
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
        return "DietPlanFood Controller Servlet";
    }

    // Method to list all DietPlanFoods
    private void listDietPlanFoods(HttpServletRequest request, HttpServletResponse response) {
        try {
            DietPlanFoodDAO dietPlanFoodDAO = new DietPlanFoodDAO();
            List<DietPlanFood> dietPlanFoods = dietPlanFoodDAO.getAll();
            request.getSession().setAttribute("dietPlanFoods", dietPlanFoods);
            response.sendRedirect("MEDICAL/medicalDietPlanFood.jsp");
        } catch (Exception ex) {
            Logger.getLogger(DietPlanFoodController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Method to add a new DietPlanFood
    private void addDietPlanFood(HttpServletRequest request, HttpServletResponse response) {
        try {
            int dietPlanID = Integer.parseInt(request.getParameter("dietPlanID"));
            int foodID = Integer.parseInt(request.getParameter("foodID"));
            double portionSize = Double.parseDouble(request.getParameter("portionsize"));

            DietPlanFood dietPlanFood = new DietPlanFood(dietPlanID, foodID, portionSize);
            DietPlanFoodDAO dietPlanFoodDAO = new DietPlanFoodDAO();
            dietPlanFoodDAO.save(dietPlanFood);

            request.setAttribute("Message", "Diet Plan Food added successfully!");
        } catch (Exception ex) {
            request.setAttribute("Message", "Error adding Diet Plan Food: " + ex.getMessage());
            Logger.getLogger(DietPlanFoodController.class.getName()).log(Level.SEVERE, null, ex);
        }
        listDietPlanFoods(request, response);
    }

    // Method to update an existing DietPlanFood
    private void updateDietPlanFood(HttpServletRequest request, HttpServletResponse response) {
        try {
            System.out.println(request.getParameter("portionsize"));
            int dietPlanID = Integer.parseInt(request.getParameter("dietPlanID"));
            int foodID = Integer.parseInt(request.getParameter("foodID"));
            int idFoodOld = Integer.parseInt(request.getParameter("idFoodOld"));
            double portionSize = Double.parseDouble(request.getParameter("portionsize"));
            System.out.println(foodID);
            System.out.println(idFoodOld);
            DietPlanFood dietPlanFood = new DietPlanFood(dietPlanID, foodID, portionSize);
            DietPlanFoodDAO dietPlanFoodDAO = new DietPlanFoodDAO();
            dietPlanFoodDAO.updatePlanFood(dietPlanFood, idFoodOld);

            request.setAttribute("Message", "Diet Plan Food updated successfully!");
        } catch (Exception ex) {
            request.setAttribute("Message", "Error updating Diet Plan Food: " + ex.getMessage());
            Logger.getLogger(DietPlanFoodController.class.getName()).log(Level.SEVERE, null, ex);
        }
        listDietPlanFoods(request, response);
    }

    // Method to delete a DietPlanFood
    private void deleteDietPlanFood(HttpServletRequest request, HttpServletResponse response) {
        try {
            int dietPlanID = Integer.parseInt(request.getParameter("dietPlanID"));
            int foodID = Integer.parseInt(request.getParameter("foodID"));

            DietPlanFoodDAO dietPlanFoodDAO = new DietPlanFoodDAO();
            dietPlanFoodDAO.deletedietPlanFood(dietPlanID,foodID);

            request.setAttribute("Message", "Diet Plan Food deleted successfully!");
        } catch (Exception ex) {
            request.setAttribute("Message", "Error deleting Diet Plan Food: " + ex.getMessage());
            Logger.getLogger(DietPlanFoodController.class.getName()).log(Level.SEVERE, null, ex);
        }
        listDietPlanFoods(request, response);
    }
}
