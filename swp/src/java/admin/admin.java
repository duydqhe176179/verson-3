/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import dal.MenteeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.AListMentor;
import model.Account;
import model.Mentee;
import model.Mentor;
import model.News;
import model.SkillMentor;
import model.StaticMentee;

/**
 *
 * @author Admin
 */
@WebServlet(name = "admin", urlPatterns = {"/admin"})
public class admin extends HttpServlet {

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
            out.println("<title>Servlet admin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet admin at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        if (a != null && a.getRole().equals("Admin")) {
            session.setAttribute("account", a);

            ///// du lieu
            AdminDAO addao = new AdminDAO();

            // list Skill
            List<SkillMentor> listSkill = addao.listAllSkill();
            request.setAttribute("listSkill", listSkill);
            System.out.println(listSkill.size());
            List<Mentor> men = addao.getlistallMentor();
            List<AListMentor> alis = new ArrayList<>();
            int page, numperpage = 5;

            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);

            }
            int start;
            int end;

            String search = request.getParameter("search");
            request.setAttribute("search", search);

            if (search != null && !search.isEmpty()) {
                men = addao.listMentorByadmin(search);
                int acceptrequest;
                float percentcompleted;
                float rate;
                boolean ac;
                int action;
                for (Mentor ali : men) {
                    acceptrequest = addao.countAcceptedRequests(ali.getIdMentor());
                    percentcompleted = Float.parseFloat(String.format("%.2f", addao.calculateCompletedPercentage(ali.getIdMentor())));
                    rate = Float.parseFloat(String.format("%.2f", addao.getRate(ali.getIdMentor())));

                    Account acc = addao.getAccountByid(ali.getIdMentor());
//                    if (ac == true) {
//                        action = 1;
//                    } else {
//                        action = 0;
//                    
                    action = acc.getActive();
                    alis.add(new AListMentor(ali.getIdMentor(), ali.getFullname(), ali.getAccount(), ali.getProfession(), acceptrequest, percentcompleted, rate, action));

                    System.out.println(alis);
                }

            } else {
                alis = addao.listAllMen();

            }
            int size = alis.size();
            System.out.println(size);
            System.out.println(page);
            start = (page - 1) * numperpage;
            end = Math.min(page * numperpage, size);
            int num = (size % 5 == 0 ? (size / 5) : ((size / 5)) + 1);
            List<AListMentor> list1 = addao.getListByPage(alis, start, end);
            request.setAttribute("lis", list1);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            MenteeDAO dao = new MenteeDAO();

            List<StaticMentee> list = dao.getStaticMetee();
            request.setAttribute("list", list);
            List<Mentee> menn = dao.getlistallMentee();
            int result = 0;
            for (Mentee mentee : menn) {
                result++;
            }
            System.out.println(result);
            request.setAttribute("result", result);
            List<News> listnews = addao.getAllnews();
            request.setAttribute("news", listnews);
            //request.setAttribute("lis", alis);
            request.getRequestDispatcher("Admin/admin.jsp").forward(request, response);

        } else {
            request.getRequestDispatcher("signinAdmin").forward(request, response);
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
        request.getRequestDispatcher("Admin/admin.jsp").forward(request, response);
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
