/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;
import model.Account;
import model.Request;

/**
 *
 * @author trang
 */
@WebServlet(name = "viewrequestmetor", urlPatterns = {"/reqmentor"})
public class viewrequestmetor extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet viewrequestmetor</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet viewrequestmetor at " + request.getContextPath() + "</h1>");
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
        Account account = (Account) request.getSession().getAttribute("account");

        if (account != null && "Mentor".equals(account.getRole())) {
            int mentorId = account.getId(); // Assuming getId() returns the mentor's ID

            DAO dao = new DAO();
            dal.ListRequest lr = new dal.ListRequest();
            List<Request> list = null;
            if (request.getAttribute("list") == null) {
                list = dao.getAllRequestsByID(mentorId);
            } else {
                list = (List<Request>) request.getAttribute("list");
                String[] selectedValues = (String[]) request.getAttribute("list_choice");
                List<String> choice = Arrays.asList(selectedValues);
                request.setAttribute("choice", choice);
            }
            List<String> status = lr.getAllDistinctStatus();

            int page = 1; // Default page number
            int recordsPerPage = 5; // Number of records to display per page

            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            // Calculate total number of records and pages
            int totalRecords = list.size();
            int totalPages = (totalRecords + recordsPerPage - 1) / recordsPerPage;

            // Calculate start and end index for current page
            int startIdx = (page - 1) * recordsPerPage;
            int endIdx = Math.min(startIdx + recordsPerPage, totalRecords);

            // Extract current list to display on the page
            List<Request> currentList = list.subList(startIdx, endIdx);

            if (!currentList.isEmpty()) {
                request.setAttribute("listR", currentList);
            } else {
                String errorMessage = "No requests found for this mentor.";
                request.setAttribute("errorMessage", errorMessage);
            }

            // Pass pagination-related variables to the JSP
            request.setAttribute("ls", status);
            request.setAttribute("page", page);
            request.setAttribute("totalPages", totalPages);
            request.getRequestDispatcher("viewrequest.jsp").forward(request, response);
        } else {
            String errorMessage = "You do not have permission to access this page.";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("viewrequest.jsp").forward(request, response);
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
        String[] selectedValues = request.getParameterValues("checkbox");
        dal.ListRequest lr = new dal.ListRequest();
        Account account = (Account) request.getSession().getAttribute("account");
        if (selectedValues != null && selectedValues.length > 0) {
            String sql = "SELECT r.idRequest, r.idMentee, r.idMentor, m.fullname AS FullName, r.title, r.content, r.skill, r.status, r.startDate, r.deadline, r.hour\n"
                    + "FROM request r\n"
                    + "JOIN mentee m ON r.idMentee = m.idMentee WHERE";
            for (int i = 0; i < selectedValues.length; i++) {
                if (i > 0) {
                    sql += " OR";
                }
                sql += " r.status = '" + selectedValues[i] + "'";

            }
            sql = sql + " and r.idMentor = " + account.getId();
            System.out.println(sql);
            List<Request> data = lr.getRequestsByFilter(sql);
            request.setAttribute("list", data);
            System.out.println(sql);
            request.setAttribute("list_choice", selectedValues);
        }
        doGet(request, response);

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
