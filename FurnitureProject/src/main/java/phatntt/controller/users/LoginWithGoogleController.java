/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatntt.controller.users;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phatntt.dao.UsersDAO;
import phatntt.dto.UsersDTO;
import phatntt.util.Key_Utils;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginWithGoogleController", urlPatterns = {"/loginWithGoogle"})
public class LoginWithGoogleController extends HttpServlet {

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

        try {
            HttpSession session = request.getSession();
            UsersDAO dao = new UsersDAO();
            Key_Utils utils = Key_Utils.getInstance();

            String code = request.getParameter("code");
            if (code != null) {
                String accessToken = utils.getToken(code);
                UsersDTO userInfo = utils.getUserInfo(accessToken);
                if (userInfo != null) {
                    UsersDTO user = dao.checkLoginByGoogle(userInfo.getEmail(), userInfo.getId());
                    if (user != null) {
                        session.setAttribute("USER_INFO", user);
                        response.sendRedirect("home");
                    } else {  //Chưa có tài khoản, thêm thông tin tài khoản 
                        boolean result = dao.loginWithGoogle(userInfo);
                        if (result) {
                            UsersDTO userGoogle = dao.checkLoginByGoogle(userInfo.getEmail(), userInfo.getId());
                            session.setAttribute("USER_INFO", userGoogle);
                            response.sendRedirect("home");
                        }
                    }
                }

                } else {
                    response.sendRedirect("loginPage");
                }

            }catch (SQLException ex) {
            Logger.getLogger(LoginWithGoogleController.class.getName()).log(Level.SEVERE, null, ex);
        }catch (NamingException ex) {
            Logger.getLogger(LoginWithGoogleController.class.getName()).log(Level.SEVERE, null, ex);
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
