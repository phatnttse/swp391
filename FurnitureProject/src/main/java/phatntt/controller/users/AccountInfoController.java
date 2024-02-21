/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatntt.controller.users;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.Properties;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import phatntt.dto.UsersAccountInfoError;
import phatntt.dao.UsersDAO;
import phatntt.dto.UsersDTO;
import phatntt.util.Constants;

/**
 *
 * @author Admin
 */
@MultipartConfig
@WebServlet(name = "AccountInfoController", urlPatterns = {"/accountInfo"})
public class AccountInfoController extends HttpServlet {

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
            out.println("<title>Servlet AccountInfoController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountInfoController at " + request.getContextPath() + "</h1>");
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

        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");

        RequestDispatcher rd = request.getRequestDispatcher(siteMaps.getProperty(Constants.DispatchFeatures.ACCOUNT_INFO_PAGE));
        rd.forward(request, response);

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

        try {
            String id = request.getParameter("hdId");          
            String name = request.getParameter("txtName");
            String phone = request.getParameter("txtPhone");
            String address = request.getParameter("txtAddress");

            UsersAccountInfoError errors = new UsersAccountInfoError();
            boolean foundErr = false;

            HttpSession session = request.getSession();
            UsersDTO u = (UsersDTO) session.getAttribute("USER_INFO");
            String avatar = u.getPicture();
            Part part = request.getPart("avatar");
            if (part.getSize() > 0) {
                String absolutePath = "E:\\Vit\\JavaWeb\\FurnitureProject\\web\\assets\\img\\users";
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

                if (!Files.exists(Paths.get(absolutePath))) {
                    Files.createDirectories(Paths.get(absolutePath));
                }

                part.write(absolutePath + File.separator + fileName);
                avatar = fileName;
            }
           

            if (name.trim().length() < 2 || name.trim().length() > 50) {
                foundErr = true;
                errors.setFullnameLengthError(
                        siteMaps.getProperty(Constants.SignUpFeatures.FULLNAME_LENGTH_ERR_MESSAGE));
            }
            if (phone.trim().length() != 10) {
                foundErr = true;
                errors.setPhoneLengthError(
                        siteMaps.getProperty(Constants.SignUpFeatures.PHONE_LENGTH_ERR_MESSAGE));
            }
            if (foundErr) {
                request.setAttribute("UPDATE_ACCOUNT_INFO_ERR", errors);
                doGet(request, response);
            } else {
                UsersDAO dao = new UsersDAO();
                boolean result = dao.updateAccountInfo(id, name, phone, address, avatar);
                if (result) {
                    UsersDTO newUser = dao.getUserById(id);
                    session.setAttribute("USER_INFO", newUser);
                    doGet(request, response);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (NamingException ex) {
            ex.printStackTrace();
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
