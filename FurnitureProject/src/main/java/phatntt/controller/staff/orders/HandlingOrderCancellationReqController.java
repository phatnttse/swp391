/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phatntt.controller.staff.orders;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phatntt.dao.OrdersDAO;
import phatntt.dao.StaffDAO;
import phatntt.dto.UsersDTO;
import phatntt.util.Config;
import phatntt.util.Key_Utils;

/**
 *
 * @author Admin
 */
@WebServlet(name = "HandlingOrderCancellationReqController", urlPatterns = {"/handlingOrderCancellationReq"})
public class HandlingOrderCancellationReqController extends HttpServlet {

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
            out.println("<title>Servlet ProcessOrderCancellationRequests</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessOrderCancellationRequests at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try {

            String orderId = request.getParameter("orderId");

            StaffDAO dao = new StaffDAO();
            dao.refuseToCancelOrder(orderId);
            request.setAttribute("REFUSE", "Từ chối huỷ đơn hàng #" + orderId);

            RequestDispatcher rd = request.getRequestDispatcher("requestCancelOrderManager");
            rd.forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(RequestCancelOrderManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(RequestCancelOrderManager.class.getName()).log(Level.SEVERE, null, ex);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try {
            String orderId = request.getParameter("orderId");
            OrdersDAO orderDAO = new OrdersDAO();
            StaffDAO dao = new StaffDAO();
            boolean paymentStatus = orderDAO.getPaymentStatusByOrderId(orderId);

            if (!paymentStatus) { //Đơn hàng chưa thanh toán

                dao.cancelOrderAndDeleteRequest(orderId);
                request.setAttribute("ACCEPT", "Huỷ đơn hàng #" + orderId + " " + "thành công");

                RequestDispatcher rd = request.getRequestDispatcher("requestCancelOrderManager");
                rd.forward(request, response);
            } else {
                HttpSession session = request.getSession();
                UsersDTO user = (UsersDTO) session.getAttribute("STAFF_INFO");

                String vnp_RequestId = Config.getRandomNumber(8);
                String vnp_Version = "2.1.0";
                String vnp_Command = "refund";
                String vnp_TmnCode = Config.vnp_TmnCode;
                String vnp_TransactionType = request.getParameter("trantype");
//                String vnp_TxnRef = request.getParameter("order_id");
                long amount = Integer.parseInt(request.getParameter("amount")) * 100;
                String vnp_Amount = String.valueOf(amount);
                String vnp_OrderInfo = "Hoan tien GD OrderId:" + orderId;
                String vnp_TransactionNo = ""; //Assuming value of the parameter "vnp_TransactionNo" does not exist on your system.
                String vnp_TransactionDate = Key_Utils.getInstance().convertTimestamp(request.getParameter("trans_date"));
//                String vnp_CreateBy = request.getParameter("user");
                String vnp_CreateBy = user.getName();

                Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
                SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                String vnp_CreateDate = formatter.format(cld.getTime());

                String vnp_IpAddr = Config.getIpAddress(request);

                JsonObject vnp_Params = new JsonObject();

                vnp_Params.addProperty("vnp_RequestId", vnp_RequestId);
                vnp_Params.addProperty("vnp_Version", vnp_Version);
                vnp_Params.addProperty("vnp_Command", vnp_Command);
                vnp_Params.addProperty("vnp_TmnCode", vnp_TmnCode);
                vnp_Params.addProperty("vnp_TransactionType", vnp_TransactionType);
                vnp_Params.addProperty("vnp_TxnRef", orderId);
                vnp_Params.addProperty("vnp_Amount", vnp_Amount);
                vnp_Params.addProperty("vnp_OrderInfo", vnp_OrderInfo);

                if (vnp_TransactionNo != null && !vnp_TransactionNo.isEmpty()) {
                    vnp_Params.addProperty("vnp_TransactionNo", "{get value of vnp_TransactionNo}");
                }

                vnp_Params.addProperty("vnp_TransactionDate", vnp_TransactionDate);
                vnp_Params.addProperty("vnp_CreateBy", vnp_CreateBy);
                vnp_Params.addProperty("vnp_CreateDate", vnp_CreateDate);
                vnp_Params.addProperty("vnp_IpAddr", vnp_IpAddr);

                String hash_Data = String.join("|", vnp_RequestId, vnp_Version, vnp_Command, vnp_TmnCode,
                        vnp_TransactionType, orderId, vnp_Amount, vnp_TransactionNo, vnp_TransactionDate,
                        vnp_CreateBy, vnp_CreateDate, vnp_IpAddr, vnp_OrderInfo);

                String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hash_Data.toString());

                vnp_Params.addProperty("vnp_SecureHash", vnp_SecureHash);

                URL url = new URL(Config.vnp_ApiUrl);
                HttpURLConnection con = (HttpURLConnection) url.openConnection();
                con.setRequestMethod("POST");
                con.setRequestProperty("Content-Type", "application/json");
                con.setDoOutput(true);
                DataOutputStream wr = new DataOutputStream(con.getOutputStream());
                wr.writeBytes(vnp_Params.toString());
                wr.flush();
                wr.close();
                int responseCode = con.getResponseCode();
                System.out.println("nSending 'POST' request to URL : " + url);
                System.out.println("Post Data : " + vnp_Params);
                System.out.println("Response Code : " + responseCode);

                BufferedReader in = new BufferedReader(
                        new InputStreamReader(con.getInputStream()));
                String output;
                StringBuffer resp = new StringBuffer();
                while ((output = in.readLine()) != null) {
                    resp.append(output);
                }
                in.close();
                System.out.println(resp.toString());

//                JsonObject jobj = new Gson().fromJson(vnp_Params, JsonObject.class);
//                orderId = jobj.get("vnp_TxnRef").toString().replaceAll("\"", "");
//                System.out.println(orderId);
                if (responseCode == 200) {
                    dao.cancelOrderAndDeleteRequest(orderId);
                    request.setAttribute("ACCEPT", "Huỷ đơn hàng #" + orderId + " " + "thành công");
                    RequestDispatcher rd = request.getRequestDispatcher("requestCancelOrderManager");
                    rd.forward(request, response);
                }

            }

        } catch (SQLException ex) {
            Logger.getLogger(RequestCancelOrderManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(RequestCancelOrderManager.class.getName()).log(Level.SEVERE, null, ex);
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
