/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.UserDAO;
import Model.User;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.System.Logger;
import java.lang.System.Logger.Level;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Desktop
 */
public class EditProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet EditProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProfileServlet at " + request.getContextPath() + "</h1>");
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
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                theCommand = "LIST";
            }
            switch (theCommand) {
                case "LIST":
                    sendEditFile(request, response);
                    break;
                case "EDITEMAIL":
                    updateEmail(request, response);
                    break;
                case "EDITNAME":
                    updateName(request, response);
                    break;
                case "EDITDATE":
                    updateDate(request, response);
                    break;
                case "EDITIMAGE":

                    break;
                default:

            }

        } catch (Exception ex) {

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

        try {
            //

            handleUpload(request, response);

        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(EditProfileServlet.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
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

    public static void sendEditFile(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getParameter("c") == null) {
            request.getSession().setAttribute("c", "0");
        } else {
            request.getSession().setAttribute("c", request.getParameter("c"));

        }
        // Trả về mã JavaScript để thay đổi URL và tải lại trang
        String redirectURL = "P/profilePage.jsp";
        response.sendRedirect(redirectURL);
    }

    public static void updateEmail(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            UserDAO udao = new UserDAO();
            int uid = Integer.parseInt(request.getParameter("uid"));
            User u = udao.get(uid).get();
            request.getSession().setAttribute("c", request.getParameter("c"));
            String email = request.getParameter("email");
            if (email != null && email != "") {
                u.setEmail(email);
                udao.update(u);
            }

            response.sendRedirect("P/profilePage.jsp");

        } catch (Exception e) {
            throw e;
        }
    }

    public static void updateName(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            UserDAO udao = new UserDAO();
            int uid = Integer.parseInt(request.getParameter("uid"));
            User u = udao.get(uid).get();

            request.getSession().setAttribute("c", request.getParameter("c"));
            String name = request.getParameter("name");
            if (name != null && name != "") {
                u.setName(name);
                udao.editProfile(u);
            }

        } catch (Exception e) {
            throw e;
        }
        sendEditFile(request, response);
    }

    public static void updateDate(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            int uid = Integer.parseInt(request.getParameter("uid"));

            UserDAO udao = new UserDAO();
            User u = udao.get(uid).get();
            request.getSession().setAttribute("c", request.getParameter("c"));

            String date = request.getParameter("date");
            if (date != null && date != "") {

                LocalDate dateOfBirth = LocalDate.parse(date);
                u.setDateOfBirth(dateOfBirth);
                udao.editProfile(u);

            }

        } catch (Exception e) {
            throw e;
        }
        sendEditFile(request, response);

    }

    public static void updateAvatar(String uid, String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String image = "http://localhost:8080/SWPWedRealClubManagement/IMAGE/AVATAR/" + fileName;
        int userId = Integer.parseInt(uid);
        UserDAO udao = new UserDAO();
        User u = udao.get(userId).get();
        u.setImage(image);
        udao.editProfile(u);
//        request.getRequestDispatcher("P/profilePage.jsp").forward(request, response);
    }

    public static void handleUpload(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String file_name = null;
        String uid = null;
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
        if (!isMultipartContent) {
            out.println("Error: Không chứa dữ liệu đa phần (enctype=multipart/form-data)");
            return;
        }
        FileItemFactory factory = new DiskFileItemFactory(); // Tạo factory để tạo FileItem
        ServletFileUpload upload = new ServletFileUpload(factory); // Phân tích và trích xuất FileItem

        try {
            List<FileItem> fields = upload.parseRequest(request); // FileItem đại diện cho mỗi phần được tải lên
            Iterator<FileItem> it = fields.iterator();

            if (!it.hasNext()) {
                out.println("Error: Không có FileItem nào");
                return;
            }

            while (it.hasNext()) {
                FileItem fileItem = it.next();
                if (fileItem.isFormField()) {
                    if ("uid".equals(fileItem.getFieldName())) {
                        uid = fileItem.getString("UTF-8");

                    }
                } else {
                    if (fileItem.getSize() > 0) {
                        String mimeType = fileItem.getContentType();
                        if (mimeType == null || !mimeType.startsWith("image/")) {
                            request.setAttribute("errorMessage", "Only upload image");
                            request.getRequestDispatcher("P/profilePage.jsp").forward(request, response);

                        }
                        file_name = new File(fileItem.getName()).getName();
                        String filePath = "Z:\\FPT University\\SU24\\SWP391\\Project\\SWPClubManegement\\web\\IMAGE\\AVATAR\\" + file_name;

                        // Đảm bảo thư mục tồn tại
                        File directory = new File(filePath).getParentFile();
                        if (!directory.exists()) {
                            directory.mkdirs();
                        }

                        fileItem.write(new File(filePath));
                        out.println("File đã được tải lên thành công: " + file_name);

                    }
                }
            }

        } catch (Exception e) {
            // Xử lý lỗi một cách hợp lý
            out.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
        if (uid != null && file_name != null) {
            try {
                updateAvatar(uid, file_name, request, response);
            } catch (Exception ex) {
                java.util.logging.Logger.getLogger(EditProfileServlet.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
            }
        } else {
            out.println("Error: Không lấy được uid hoặc fileName");
        }

        sendEditFile(request, response);

// Đảm bảo không có mã nào được thực thi sau chuyển hướng
    }
}
