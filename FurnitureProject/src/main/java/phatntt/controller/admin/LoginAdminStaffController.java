/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.controller.admin;

import io.sentry.Sentry;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Properties;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phatntt.dao.UsersDAO;
import phatntt.dto.UsersDTO;
import phatntt.util.Constants;
import phatntt.util.Key_Utils;

/**
 *
 * @author Dell
 */
@WebServlet(name = "LoginAdminStaffController", urlPatterns = {"/LoginAdminStaff"})
public class LoginAdminStaffController extends HttpServlet {

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
            out.println("<title>Servlet LoginAdminStaffController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginAdminStaffController at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String url = siteMaps.getProperty(Constants.AdminFeatures.LOGIN);
        HttpSession session = request.getSession();

        try {
            UsersDAO dao = new UsersDAO();
            Key_Utils utils = Key_Utils.getInstance();
            UsersDTO user = dao.checkLogin(email);
            if (user != null && user.getRole() == 1) {
                if (utils.checkPassword(password, user.getPassword())) {
                    session.setAttribute("STAFF_INFO", user);
                    url = "dashboard";
                } else {
                    request.setAttribute("LOGIN_ERROR", "Email hoặc mật khẩu không chính xác");
                }

            } else if (user != null && user.getRole() == 2) {
                if (utils.checkPassword(password, user.getPassword())) {
                    session.setAttribute("ADMIN_INFO", user);
                    url = "dashboardAdmin";
                } else {
                    request.setAttribute("LOGIN_ERROR", "Email hoặc mật khẩu không chính xác");
                }

            } else {
                request.setAttribute("LOGIN_ERROR", "Tài khoản hoặc mật khẩu không chính xác");
            }

        } catch (SQLException ex) {
            Sentry.captureException(ex);
            log("LoginServlet_SQL: " + ex.getMessage());
             Sentry.captureException(ex);
        } catch (NamingException ex) {
            log("LoginServlet_Naming: " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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

}
