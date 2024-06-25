/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import DAO.UserDAO;
import Model.Role;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Zanis
 */
public class LoginServlet extends HttpServlet {

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
            String email = request.getParameter("username");

            String password = request.getParameter("password");

            UserDAO accountDAO = new UserDAO();
            User account = accountDAO.login(email, password);

            if (account != null && account.getStatus() == true) {

                HttpSession session = request.getSession();
                session.setAttribute("user", account);
                if (Role.Admin.equals(account.getRole())) {
                    response.sendRedirect("/SWPClubManegement/BanAccountController");
                } else if (Role.Medical.equals(account.getRole())) {
                    response.sendRedirect("/SWPClubManegement/HOME/medical.jsp ");
                } else if (Role.Coach.equals(account.getRole())) {
                    response.sendRedirect("/SWPClubManegement/COACH/CoachWelcome.jsp");
                } else if (Role.Player.equals(account.getRole())) {
                    response.sendRedirect("/SWPClubManegement/PLAYER/PlayerDashboard");
                } else {
                    response.sendRedirect("/SWPClubManegement/HomeServlet ");
                }
            } else {
                if (account != null && account.getStatus() != true) {
                    request.getSession().setAttribute("error", "Your account has been locked");
                    response.sendRedirect("http://localhost:8080/SWPClubManegement/HOME/login.jsp");
                }else
                {
                    if (account == null) {
                        request.getSession().setAttribute("error", "Invalid email or password. Please try again.");
                        response.sendRedirect("http://localhost:8080/SWPClubManegement/HOME/login.jsp");
                    }
                }

            }
                    
                
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
        response.sendRedirect("HOME/login.jsp");
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

}
