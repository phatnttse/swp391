/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.controller.products;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import phatntt.dao.CategoryDAO;
import phatntt.dao.ProductsDAO;
import phatntt.dto.CategoryDTO;
import phatntt.dto.ProductsDTO;
import phatntt.util.Constants;

/**
 *
 * @author Dell
 */
@WebServlet(name = "LoadProductByPriceController", urlPatterns = {"/LoadProductByPriceController"})
public class LoadProductByPriceController extends HttpServlet {

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
            out.println("<title>Servlet LoadProductByPriceController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoadProductByPriceController at " + request.getContextPath() + "</h1>");
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
        String[] price = request.getParameterValues("price");
        ServletContext context = this.getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        String url = siteMaps.getProperty(Constants.LoginFeatures.HOME_PAGE);
        try {
            CategoryDAO catedao = new CategoryDAO();
            List<CategoryDTO> cdtos = catedao.getAllCategoryDTOs();
            request.setAttribute("CATEGORY_LIST", cdtos);
            List<ProductsDTO> productsDTOs = new ArrayList<>();
            ProductsDAO dao = new ProductsDAO();
            if (price != null) {
                int from = 0, to = 0;
                for (int i = 0; i < price.length; i++) {
                    List<ProductsDTO> temp = new ArrayList<>();
                    if (price[i].equals("0")) {
                        from = 0;
                        to = 500000;
                        temp = dao.getProductByPrice(from, to);
                        productsDTOs.addAll(temp);
                    }
                    if (price[i].equals("1")) {
                        from = 500000;
                        to = 1000000;
                        temp = dao.getProductByPrice(from, to);
                        productsDTOs.addAll(temp);

                    }
                    if (price[i].equals("2")) {
                        from = 1000000;
                        to = 3000000;
                        temp = dao.getProductByPrice(from, to);
                        productsDTOs.addAll(temp);

                    }
                    if (price[i].equals("3")) {
                        from = 3000000;
                        to = 5000000;
                        temp = dao.getProductByPrice(from, to);
                        productsDTOs.addAll(temp);

                    }
                    if (price[i].equals("4")) {
                        from = 5000000;
                        to = 7000000;
                        temp = dao.getProductByPrice(from, to);
                        productsDTOs.addAll(temp);

                    }
                    if (price[i].equals("5")) {
                        from = 7000000;
                        to = 1000000000;
                        temp = dao.getProductByPrice(from, to);
                        productsDTOs.addAll(temp);

                    }
                }
            }
            request.setAttribute("PRODUCTS_LIST", productsDTOs);
            url = siteMaps.getProperty(Constants.ProductsFeatures.PRODUCTS_PAGE)
                    + "?price=" + price;
        } catch (Exception e) {
            e.printStackTrace();
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
