/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.FoodDAO;
import Model.Food;
import java.io.IOException;
import java.io.PrintWriter;
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
public class FoodController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FoodController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FoodController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");

            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "LIST";
            }
            switch (theCommand) {
                case "LIST":
                    listFoods(request, response);
                    break;
                case "ADD":
                    addFood(request, response);
                    break;
                case "UPDATE":
                    updateFood(request, response);
                    break;
                case "DELETE":
                    deleteFood(request, response);
                    break;
                default:
                    listFoods(request, response);
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
        return "Food Controller Servlet";
    }

    // Method to list all Foods
    private void listFoods(HttpServletRequest request, HttpServletResponse response) {
        try {
            FoodDAO foodDAO = new FoodDAO();
            List<Food> foods = foodDAO.getAll();
            request.getSession().setAttribute("foods", foods);
            response.sendRedirect("MEDICAL/foodpage.jsp");
        } catch (Exception ex) {
            Logger.getLogger(DietPlanFoodController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Method to add a new Food
    private void addFood(HttpServletRequest request, HttpServletResponse response) {
        try {
            int foodID = Integer.parseInt(request.getParameter("foodID"));
            String foodName = request.getParameter("foodname");
            String description = request.getParameter("description");
            double calo = Double.parseDouble(request.getParameter("calo"));
            double proteins = Double.parseDouble(request.getParameter("proteins"));
            double Carbohydrates = Double.parseDouble(request.getParameter("carbohydrates"));
            double fats = Double.parseDouble(request.getParameter("fats"));

            Food food = new Food(foodID, foodName, description, calo, proteins, Carbohydrates, fats);
            FoodDAO foodDAO = new FoodDAO();
            foodDAO.save(food);
            request.setAttribute("Message", "Diet Plan Food added successfully!");
        } catch (Exception ex) {
            request.setAttribute("Message", "Error adding Diet Plan Food: " + ex.getMessage());
            Logger.getLogger(DietPlanFoodController.class.getName()).log(Level.SEVERE, null, ex);
        }
        listFoods(request, response);
    }

    // Method to update an existing Food
    private void updateFood(HttpServletRequest request, HttpServletResponse response) {
        try {
            int foodID = Integer.parseInt(request.getParameter("foodID"));
            String foodName = request.getParameter("foodname");
            String description = request.getParameter("description");
            double calo = Double.parseDouble(request.getParameter("calo"));
            double proteins = Double.parseDouble(request.getParameter("proteins"));
            double Carbohydrates = Double.parseDouble(request.getParameter("carbohydrates"));
            double fats = Double.parseDouble(request.getParameter("fats"));

            Food food = new Food(foodID, foodName, description, calo, proteins, Carbohydrates, fats);
            FoodDAO foodDAO = new FoodDAO();
            foodDAO.update(food);
            request.setAttribute("Message", "Diet Plan Food updated successfully!");
        } catch (Exception ex) {
            request.setAttribute("Message", "Error updating Diet Plan Food: " + ex.getMessage());
            Logger.getLogger(DietPlanFoodController.class.getName()).log(Level.SEVERE, null, ex);
        }
        listFoods(request, response);
    }

    // Method to delete a Food
    private void deleteFood(HttpServletRequest request, HttpServletResponse response) {
        try {
            int foodID = Integer.parseInt(request.getParameter("foodID"));
            System.out.println(foodID);
            FoodDAO dietPlanFoodDAO = new FoodDAO();
            dietPlanFoodDAO.delete(foodID);
            request.setAttribute("Message", "Diet Plan Food deleted successfully!");
        } catch (Exception ex) {
            request.setAttribute("Message", "Error deleting Diet Plan Food: " + ex.getMessage());
            Logger.getLogger(DietPlanFoodController.class.getName()).log(Level.SEVERE, null, ex);
        }
        listFoods(request, response);
    }

}
