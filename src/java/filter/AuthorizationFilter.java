/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

import Model.Role;
import static Model.Role.Player;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AuthorizationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        String loginURI = httpRequest.getContextPath() + "/HOME/login.jsp";
        boolean loggedIn = (session != null && session.getAttribute("user") != null);
        boolean loginRequest = httpRequest.getRequestURI().equals(loginURI);
        boolean resourceRequest = httpRequest.getRequestURI().startsWith(httpRequest.getContextPath() + "/resources/");

        if (loggedIn || loginRequest || resourceRequest) {
            if (loggedIn) {
                Role userRole = (Role) session.getAttribute("role"); // Lấy vai trò của người dùng
                String requestURI = httpRequest.getRequestURI();

                if (isAuthorized(userRole, requestURI, httpRequest.getContextPath())) {
                    chain.doFilter(request, response);
                } else {
                                httpResponse.sendRedirect("/SWPClubManegement/accessDined.jsp");

                }
            } else {
                chain.doFilter(request, response);
            }
        } else {
            httpResponse.sendRedirect(loginURI);
        }
    }

    private boolean isAuthorized(Role role, String requestURI, String contextPath) {
        // Kiểm tra quyền truy cập dựa trên vai trò
        switch (role) {
            case Admin:
                return requestURI.startsWith(contextPath + "/ADMIN");
            case Coach:
                return requestURI.startsWith(contextPath + "/COACH");
            case Medical:
                return requestURI.startsWith(contextPath + "/MEDICAL");
            case Player:
            case User:
                return requestURI.startsWith(contextPath + "/HOME");
            default:
                return false;
        }
    }

    @Override
    public void destroy() {
        // Dọn dẹp bộ lọc nếu cần
    }
}
