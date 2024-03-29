/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.controller.products;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
import phatntt.dao.CategoryDAO;
import phatntt.dao.ProductsDAO;
import phatntt.dto.CategoryDTO;
import phatntt.dto.ProductsDTO;
import phatntt.util.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ProductPaginationController", urlPatterns = {"/productPagination"})
public class ProductPaginationController extends HttpServlet {

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
            out.println("<title>Servlet ProductPaginationController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductPaginationController at " + request.getContextPath() + "</h1>");
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
        String url = siteMaps.getProperty(Constants.ProductsFeatures.PRODUCTS_PAGE);
        String span;
        String sortType = request.getParameter("sortType");
        

        String pageParam = request.getParameter("page");
        int page = 1;

        if (pageParam != null) {
            page = Integer.parseInt(pageParam);
            request.setAttribute("PAGE", Integer.parseInt(pageParam));
        }

        try {
            int limit = 9;

            if (page > 1) {
                page = page - 1;
                page = page * limit - 1;
            }

            ProductsDAO dao = new ProductsDAO();
            List<ProductsDTO> dTOs = new ArrayList<>();
            if (sortType != null) {
                switch (sortType) {
                    case "AtoZ":
                        dTOs = dao.sortProductByNameAscending(page, limit);
                        request.setAttribute("PRODUCTS_LIST", dTOs);
                        span = "A → Z";
                        request.setAttribute("SPAN", span);
                        break;
                    case "ZtoA":
                        dTOs = dao.sortProductByNameDescending(page, limit);
                        request.setAttribute("PRODUCTS_LIST", dTOs);
                        span = "Z → A";
                        request.setAttribute("SPAN", span);
                        break;
                    case "IncreasePrice":
                        dTOs = dao.sortProductByPriceAscending(page, limit);
                        request.setAttribute("PRODUCTS_LIST", dTOs);
                        span = "Giá tăng dần";
                        request.setAttribute("SPAN", span);
                        break;
                    case "DecreasePrice":
                        dTOs = dao.sortProductByPriceDescending(page, limit);
                        request.setAttribute("PRODUCTS_LIST", dTOs);
                        span = "Giá giảm dần";
                        request.setAttribute("SPAN", span);
                        break;
                    case "Newest":
                        dTOs = dao.sortProductByNewCreateAt(page, limit);
                        request.setAttribute("PRODUCTS_LIST", dTOs);
                        span = "Hàng mới nhất";
                        request.setAttribute("SPAN", span);
                        break;
                    case "Oldest":
                        dTOs = dao.sortProductByOldCreateAt(page, limit);
                        request.setAttribute("PRODUCTS_LIST", dTOs);
                        span = "Hàng cũ nhất";
                        request.setAttribute("SPAN", span);
                        break;
                    default:
                        // Mặc định, có thể là sắp xếp theo Mặc định hoặc xử lý theo logic khác
                        dTOs = dao.getAllProducts(page, limit);
                        request.setAttribute("PRODUCTS_LIST", dTOs);
                        break;
                }
                url = siteMaps.getProperty(Constants.LoginFeatures.PRODUCTS_PAGE)
                        + "?page=" + page
                        + "&sortType=" + sortType;

            } else {
                dTOs = dao.getAllProducts(page, limit);
                request.setAttribute("PRODUCTS_LIST", dTOs);
            }
            
            
            CategoryDAO catedao = new CategoryDAO();
            List<CategoryDTO> cdtos = catedao.getAllCategoryDTOs();
            request.setAttribute("CATEGORY_LIST", cdtos);
            
            int totalProducts = dao.getTotalProducts();
            int totalPages = (int) Math.ceil((double) totalProducts / limit); // Tính số trang
            request.setAttribute("TOTAL_PAGES", totalPages);

            url = siteMaps.getProperty(Constants.LoginFeatures.PRODUCTS_PAGE)
                    + "?page=" + page;
            

        } catch (SQLException ex) {
            Logger.getLogger(ProductPaginationController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ProductPaginationController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
