/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatntt.controller.email;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phatntt.dto.EmailDTO;
import phatntt.dao.UsersDAO;
import phatntt.util.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CheckVerificationCode", urlPatterns = {"/checkVerificationCode"})
public class CheckVerificationCode extends HttpServlet {

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

        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        String url = siteMaps.getProperty(Constants.VerifyEmailFeatures.VERIFY_PAGE);

        try {
            HttpSession session = request.getSession();
            UsersDAO dao = new UsersDAO();
                  
            String givenName = (String) session.getAttribute("GIVEN_NAME");
            String familyName = (String) session.getAttribute("FAMILY_NAME");
            String email = (String) session.getAttribute("EMAIL");
            String username = (String) session.getAttribute("USERNAME");
            String password = (String) session.getAttribute("PASSWORD");           
            int role = 0;

            String code1 = request.getParameter("code1");
            String code2 = request.getParameter("code2");
            String code3 = request.getParameter("code3");
            String code4 = request.getParameter("code4");
            String code5 = request.getParameter("code5");
            String code6 = request.getParameter("code6");

            EmailDTO dto = (EmailDTO) session.getAttribute("AUTH_CODE");

            String emailCode = code1 + code2 + code3 + code4 + code5 + code6;
            if (emailCode.equals(dto.getCode())) {
                Calendar calendar = Calendar.getInstance();
                Timestamp createdAt = new Timestamp(calendar.getTime().getTime());
                
                boolean result = dao.registerAccount(username, password, email, givenName, familyName, role, createdAt);
                if (result) {
                    url = siteMaps.getProperty(Constants.VerifyEmailFeatures.LOGIN_PAGE);
                }
            } 
        } catch (SQLException ex) {
            Logger.getLogger(CheckVerificationCode.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(CheckVerificationCode.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
