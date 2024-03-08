/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import dal.DAO;
import dal.MenteeDAO;
import dal.RequestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.AListMentor;
import model.Account;
import model.Adshowreq;
import model.Mentee;
import model.Mentor;
import model.News;
import model.Request;
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
        if (a != null && (a.getRole().equals("Admin") || a.getRole().equals("Manager"))) {
            session.setAttribute("account", a);

            ///// du lieu
            AdminDAO addao = new AdminDAO();

            // list Skill
            int page, numperpage = 5;

            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);

            }
            int start;
            start = (page - 1) * numperpage;
            // list Skill
            List<SkillMentor> listSkill = new ArrayList<>();
            listSkill = addao.listAllSkill();
            int size3 = listSkill.size();
            int end2 = Math.min(page * numperpage, size3);
            int num3 = (size3 % 5 == 0 ? (size3 / 5) : ((size3 / 5)) + 1);

            List<SkillMentor> listSkill22 = addao.getListSkillByPage(listSkill, start, end2);

            System.out.println(listSkill22.size());
            request.setAttribute("page", page);
            request.setAttribute("num3", num3);
            request.setAttribute("listSkill22", listSkill22);
            //System.out.println(listSkill.size());
            List<Mentor> men = addao.getlistallMentor();
            List<AListMentor> alis = new ArrayList<>();
            int page1, numperpage1 = 5;

            String xpage1 = request.getParameter("page1");
            if (xpage1 == null) {
                page1 = 1;
            } else {
                page1 = Integer.parseInt(xpage1);

            }
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

                    action = acc.getActive();
                    alis.add(new AListMentor(ali.getIdMentor(), ali.getFullname(), ali.getAccount(), ali.getProfession(), acceptrequest, percentcompleted, rate, action));

                    //  System.out.println(alis);
                }

            } else {
                alis = addao.listAllMen();

            }
            int size = alis.size();
            //  System.out.println(size);
            // System.out.println(page);
            int start1 = (page1 - 1) * numperpage1;
            end = Math.min(page1 * numperpage1, size);
            int num = (size % 5 == 0 ? (size / 5) : ((size / 5)) + 1);
            List<AListMentor> list1 = addao.getListByPage(alis, start1, end);
            request.setAttribute("lis", list1);
            request.setAttribute("page1", page1);
            request.setAttribute("num", num);
            MenteeDAO dao = new MenteeDAO();
            int page2, numperpage2 = 5;

            String xpage2 = request.getParameter("page2");
            if (xpage2 == null) {
                page2 = 1;
            } else {
                page2 = Integer.parseInt(xpage2);

            }

            List<StaticMentee> list = new ArrayList<>();
            int start2 = (page2 - 1) * numperpage2;
            list = dao.getStaticMetee();
            int sizemte = list.size();
            int end1 = Math.min(page2 * numperpage2, sizemte);
            int num2 = (sizemte % 5 == 0 ? (sizemte / 5) : ((sizemte / 5)) + 1);
            List<StaticMentee> list2 = dao.getListByPage(list, start2, end1);
            //System.out.println(list2);
            request.setAttribute("num2", num2);
            request.setAttribute("page2", page2);
            request.setAttribute("list2", list2);
            List<Mentee> menn = dao.getlistallMentee();
            int result = 0;
            for (Mentee mentee : menn) {
                result++;
            }
            //System.out.println(result);
            request.setAttribute("result", result);
            int page4, numperpage4 = 5;
            int start4;
            int end4;
            String xpage4 = request.getParameter("page4");
            if (xpage4 == null) {
                page4 = 1;
            } else {
                page4 = Integer.parseInt(xpage4);

            }

            List<News> listnews = addao.getAllnews();
            int size4 = listnews.size();
            start4 = (page4 - 1) * numperpage4;
            end4 = Math.min(page4 * numperpage4, size4);
            int num4 = (size4 % 5 == 0 ? (size4 / 5) : ((size4 / 5)) + 1);
            List<News> listnews1 = addao.getListNewByPage(listnews, start4, end4);
            request.setAttribute("news", listnews1);
            request.setAttribute("num4", num4);
            request.setAttribute("page4", page4);

            
            int page6;
            String xpage6 = request.getParameter("page6");

            int pageRequest = 1; // Số trang mặc định
            int recordsPerPage = 5; // Số bản ghi hiển thị trên mỗi trang

            if (xpage6 == null) {
                page6 = 1;
            } else {
                page6 = Integer.parseInt(xpage6);;
            }

            AdminDAO daoAdmin = new AdminDAO();
            List<Adshowreq> listRequest;
            String searchTerm = request.getParameter("searchTerm");

            if (searchTerm != null && !searchTerm.isEmpty()) {
                // Tìm kiếm theo từ khóa và lấy toàn bộ kết quả
                listRequest = daoAdmin.searchAdshowreq(searchTerm);
            } else {
                // Lấy toàn bộ danh sách nếu không có từ khóa tìm kiếm
                listRequest = daoAdmin.getAllAdshowreq();
            }

            // Tính tổng số trang
            int totalRecords = listRequest.size();
            int totalPages = (totalRecords + recordsPerPage - 1) / recordsPerPage;

            // Tính chỉ số bắt đầu và kết thúc của danh sách hiện tại
            int startIdx = (page6 - 1) * recordsPerPage;
            int endIdx = Math.min(startIdx + recordsPerPage, totalRecords);

            // Trích xuất danh sách hiện tại để hiển thị trên trang
            List<Adshowreq> currentList = listRequest.subList(startIdx, endIdx);

            List<String> statusList = daoAdmin.getAllDistinctStatus();

            // Đặt các thuộc tính cần thiết cho trang JSP
            request.setAttribute("statusList", statusList);
            request.setAttribute("listRequest", currentList);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", page);
            request.setAttribute("searchTerm", searchTerm); // Truyền lại từ khóa tìm kiếm để hiển thị trên trang

            String[] selectedStatusArray = request.getParameterValues("selectedStatusArray");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            if (selectedStatusArray != null) {
                List<String> selectedStatusList = new ArrayList<>();

                if (selectedStatusArray != null) {
                    selectedStatusList = Arrays.asList(selectedStatusArray);
                }

                if (startDate == null || startDate.isEmpty()) {
                    startDate = null;
                }
                if (endDate == null || endDate.isEmpty()) {
                    endDate = null;
                }

                List<Adshowreq> adshowreqList;

                if (selectedStatusList.isEmpty() && (startDate == null || endDate == null)) {
                    adshowreqList = addao.getAllAdshowreq();
                } else if (selectedStatusList.isEmpty() && startDate != null && endDate != null) {
                    adshowreqList = addao.checkdate(startDate, endDate);
                } else {
                    adshowreqList = addao.getMulStatus(selectedStatusList, startDate, endDate);
                }

                // Tính tổng số trang dựa trên kết quả tìm kiếm
                int totalRecordss = adshowreqList.size();
                int recordsPerPages = 6; // Số bản ghi hiển thị trên mỗi trang
                int totalPagess = (totalRecordss + recordsPerPages - 1) / recordsPerPage;

                // Trang mặc định sẽ là trang đầu tiên
                int pages = 1;

                // Lấy số trang nếu được chọn từ yêu cầu POST
                if (request.getParameter("page") != null) {
                    page = Integer.parseInt(request.getParameter("page"));
                }

                // Tính chỉ số bắt đầu và kết thúc của danh sách hiện tại
                int startIdxs = (pages - 1) * recordsPerPage;
                int endIdxs = Math.min(startIdx + recordsPerPages, totalRecordss);

                // Trích xuất danh sách hiện tại để hiển thị trên trang
                List<Adshowreq> currentLists = adshowreqList.subList(startIdxs, endIdxs);

                List<String> statusLists = addao.getAllDistinctStatus();

                request.setAttribute("statusList", statusLists);
                request.setAttribute("listRequest", currentLists);
                request.setAttribute("s", selectedStatusArray);
                request.setAttribute("totalPages", totalPagess);
                request.setAttribute("currentPage", page);
            }
            request.getRequestDispatcher("Admin/demo_admin.jsp").forward(request, response);

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

}
