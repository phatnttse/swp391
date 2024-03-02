///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package phatntt.controller.email;
//
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.SQLException;
//import java.util.Properties;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import javax.naming.NamingException;
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletContext;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import phatntt.dto.UsersCreateNewPassErr;
//import phatntt.dao.UsersDAO;
//import phatntt.dto.UsersDTO;
//import phatntt.util.Key_Utils;
//import phatntt.util.Constants;
//
///**
// *
// * @author Admin
// */
//@WebServlet(name = "CreateNewPasswordController", urlPatterns = {"/createNewPassword"})
//public class CreateNewPasswordController extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet CreateNewPasswordController</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet CreateNewPasswordController at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        ServletContext context = this.getServletContext();
//        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
//
//        String email = request.getParameter("email");
//        String newPassword = request.getParameter("newPass");
//        String confirm = request.getParameter("confirmNewPass");
//        UsersDAO dao = new UsersDAO();
//       
//
//        UsersCreateNewPassErr errors = new UsersCreateNewPassErr();
//        boolean foundErr = false;
//
//        String url = siteMaps.getProperty(Constants.ForgotPasswordFeatures.CREATE_NEW_PASS);
//
//        try {
//            UsersDTO user = dao.checkLogin(email);
//            if (!newPassword.trim().matches(siteMaps.getProperty(Constants.ForgotPasswordFeatures.PASSWORD_REGEX))) {
//                foundErr = true;
//                errors.setPasswordErr(
//                        siteMaps.getProperty(Constants.SignUpFeatures.PASSWORD_LENGTH_ERR_MESSAGE));
//            }
//            if (!confirm.trim().equals(newPassword.trim())) {
//                foundErr = true;
//                errors.setConfirmPassErr(
//                        siteMaps.getProperty(Constants.SignUpFeatures.CONFIRM_NOTMATCHED_ERR_MESSAGE));
//            }
//            if (foundErr) {
//                request.setAttribute("RESET_PASSWORD_ERR", errors);
//            } else {             
//                Key_Utils utils = Key_Utils.getInstance();
//
//                String hashedPassword = utils.hashPassword(newPassword);
//                boolean result = dao.createNewPassword(user.getId(), hashedPassword);
//                if (result) {
//                    url = siteMaps.getProperty(Constants.ForgotPasswordFeatures.LOGIN_PAGE);
//                }
//            }
//
//        } catch (SQLException ex) {
//            Logger.getLogger(CreateNewPasswordController.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (NamingException ex) {
//            Logger.getLogger(CreateNewPasswordController.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            RequestDispatcher rd = request.getRequestDispatcher(url);
//            rd.forward(request, response);
//        }
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
