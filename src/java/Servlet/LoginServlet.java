/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import DAO.UserDAO;
import Model.Role;
import static Model.Role.Admin;
import static Model.Role.Coach;
import static Model.Role.Medical;
import static Model.Role.User;
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
            String email = request.getParameter("username");
            String password = request.getParameter("password");

            UserDAO accountDAO = new UserDAO();
            User account = accountDAO.login(email, password);

            if (account != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", account);
                session.setAttribute("role", account.getRole()); // Lưu vai trò vào phiên

                Role userRole = account.getRole();

                switch (userRole) {
                    case Admin:               
                        response.sendRedirect(request.getContextPath() + "/ADMIN/adminPage.jsp");
                        break;
                    case Medical:      
                        response.sendRedirect(request.getContextPath() + "/HOME/medical.jsp");
                        break;
                    case Coach:
                        response.sendRedirect(request.getContextPath() + "/COACH/home.jsp");
                        break;
                    default:
                        response.sendRedirect(request.getContextPath() + "/HOME/home.jsp");
                        
                        break;
                }
            } else {
                request.getSession().setAttribute("error", "Invalid email or password. Please try again.");
                response.sendRedirect(request.getContextPath() + "/login.jsp");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("HOME/login.jsp");
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
}
