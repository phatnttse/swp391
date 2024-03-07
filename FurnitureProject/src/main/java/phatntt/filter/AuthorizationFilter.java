/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package phatntt.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phatntt.dto.UsersDTO;

/**
 *
 * @author Admin
 */
@WebFilter(filterName = "AuthorizationFilter", urlPatterns = {"/addProductsToCart","/ViewAllOrder"})
public class AuthorizationFilter implements Filter {
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        
            
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        

        HttpSession session = req.getSession();

        UsersDTO user = (UsersDTO) session.getAttribute("USER_INFO");

        if (user != null && user.getRole() == 0) {
            chain.doFilter(request, response);
            return;
        }
        req.setAttribute("notification", "Để thực hiện, bạn cần phải đăng nhập!");
        request.getRequestDispatcher("views/login.jsp").forward(request, response);        
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

   
    @Override
    public void destroy() {
       
    }
    
}
