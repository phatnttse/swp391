/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatntt.controller.users;

import io.sentry.Sentry;
import java.io.IOException;
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
import phatntt.util.Key_Utils;
import phatntt.util.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
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
        String url = siteMaps.getProperty(Constants.LoginFeatures.LOGIN_PAGE);
        HttpSession session = request.getSession();

        try {
            UsersDAO dao = new UsersDAO();
            Key_Utils utils = Key_Utils.getInstance();
            UsersDTO user = dao.checkLogin(email);
            if (user != null && user.getRole() == 0) {
                if (utils.checkPassword(password, user.getPassword())) {
                    session.setAttribute("USER_INFO", user);
                    url = Constants.LoginFeatures.HOME;
                } else {
                    request.setAttribute("LOGIN_ERROR", "Email hoặc mật khẩu không chính xác");
                }

            } else if (user != null && user.getRole() == 1) {
                if (utils.checkPassword(password, user.getPassword())) {
                    session.setAttribute("STAFF_INFO", user);
                    url = siteMaps.getProperty(Constants.LoginFeatures.STAFF_PAGE);
                } else {
                    request.setAttribute("LOGIN_ERROR", "Email hoặc mật khẩu không chính xác");
                }

            } else if (user != null && user.getRole() == 2) {
                if (utils.checkPassword(password, user.getPassword())) {
                    session.setAttribute("ADMIN_INFO", user);
                    url = siteMaps.getProperty(Constants.LoginFeatures.ADMIN_PAGE);
                } else {
                    request.setAttribute("LOGIN_ERROR", "Email hoặc mật khẩu không chính xác");
                }

            } else {
                request.setAttribute("LOGIN_ERROR", "Tài khoản hoặc mật khẩu không chính xác");
            }

        } catch (SQLException ex) {
            Sentry.captureException(ex);
            log("LoginServlet_SQL: " + ex.getMessage());
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
