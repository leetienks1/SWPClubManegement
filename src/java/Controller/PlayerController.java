/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.PlayerDAO;
import Model.Player;
import Model.Position;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.Instant;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Desktop
 */
public class PlayerController extends HttpServlet {

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
            out.println("<title>Servlet PlayerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PlayerController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "LIST";
            }
            switch (theCommand) {
                case "LIST":
                    ListPlayers(request, response);
                    break;
                case "ADD":
                    AddPlayer(request, response);
                    break;
                case "LOAD":

                    break;
                case "UPDATE":
                    UpdatePlayer(request, response);
                    break;
                case "DELETE":
                    DeletePlayer(request, response);
                    break;
                default:

            }

        } catch (Exception ex) {

            Logger.getLogger(PlayerController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void ListPlayers(HttpServletRequest request, HttpServletResponse response) {
        try {
            PlayerDAO pdao = new PlayerDAO();
            List<Player> players = pdao.getAll();
            request.getSession().setAttribute("listPlayer", players);
            List<String> positions = new ArrayList<>();

            // Lặp qua tất cả các giá trị enum và thêm chúng vào danh sách
            for (Position position : Position.values()) {
                positions.add(position.toString());
            }
            request.getSession().setAttribute("positions", positions);

            response.sendRedirect("ADMIN/adminPage.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void AddPlayer(HttpServletRequest request, HttpServletResponse response) {
        try {
            Player p = new Player();
            String playerName = request.getParameter("playerName");

            Position position = Position.valueOf(request.getParameter("position"));
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate age = LocalDate.parse(request.getParameter("dateOfBirth"), formatter);

            String formattedWeight = request.getParameter("weight");
            double weight = Double.parseDouble(formattedWeight);
            double roundedWeight = Math.round(weight * 10.0) / 10.0;

            int height = Integer.parseInt(request.getParameter("height"));
            if (request.getParameter("uid") != null) {
                int uid = Integer.parseInt(request.getParameter("uid"));
                p.setUserID(uid);
            }
            
            p.setHeight(height);
            p.setWeight(roundedWeight);
            p.setName(playerName);
            p.setPosition(position);
            p.setAge(age);
            
            PlayerDAO pdao = new PlayerDAO();
            pdao.save(p);
            request.getSession().setAttribute("Message", "Add operation successful");

        } catch (Exception e) {
            e.printStackTrace();
        }
        ListPlayers(request, response);
    }

    public void UpdatePlayer(HttpServletRequest request, HttpServletResponse response) {
        try {
            int pid = Integer.parseInt(request.getParameter("pid"));
            String playerName = request.getParameter("playerName");

            Position position = Position.valueOf(request.getParameter("position"));
            
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate age = LocalDate.parse(request.getParameter("dateOfBirth"), formatter);
            String formattedWeight = request.getParameter("weight");
            double weight = Double.parseDouble(formattedWeight);
            double roundedWeight = Math.round(weight * 10.0) / 10.0;

            int height = Integer.parseInt(request.getParameter("height"));
//            if (weight < 0 || height < 0) {
//                request.getSession().setAttribute("Error", "Khong hop le");
//            }
            PlayerDAO pdao = new PlayerDAO();

            Player p = pdao.get(pid).get();
            if (request.getParameter("uid") != null && request.getParameter("uid")!="0" ) {
                int uid = Integer.parseInt(request.getParameter("uid"));
                p.setUserID(uid);
            }
            p.setName(playerName);
            p.setPosition(position);
            
            p.setAge(age);
            p.setWeight(roundedWeight);
            p.setHeight(height);
            pdao.update(p);
            request.getSession().setAttribute("Message", "UPDATE operation successful");

            request.getSession().removeAttribute("openEdit");
        } catch (Exception e) {
            e.printStackTrace();
        }
        ListPlayers(request, response);
    }

    public void DeletePlayer(HttpServletRequest request, HttpServletResponse response) {
        try {
            String playerName = request.getParameter("playerName");

            int pid = Integer.parseInt(request.getParameter("pid"));

            PlayerDAO pdao = new PlayerDAO();
            pdao.delete(pid);
            request.getSession().setAttribute("Message", "Delete operation successful");

        } catch (Exception e) {
            e.printStackTrace();
        }
        ListPlayers(request, response);
    }

}