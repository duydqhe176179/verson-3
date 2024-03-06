/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package admin;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.AListMentor;
import model.Account;
import model.Adshowreq;
import model.Mentor;
import model.News;
import model.ReDetail;

import model.SkillMentor;

/**
 *
 * @author Admin
 */
public class AdminDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
    List<SkillMentor> listSkill = new ArrayList<>();
    List<AListMentor> lis = new ArrayList<>();
    List<Mentor> liss = new ArrayList<>();
    List<News> listnews = new ArrayList<>();

    public List<AListMentor> getListByPage(List<AListMentor> list, int start, int end) {
        ArrayList<AListMentor> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Mentor> listMentorByadmin(String searchMentor) {
        List<Mentor> mentors = new ArrayList<>();
        try {
            String sql = "SELECT m.idMentor, fullname, username, m.profession\n"
                    + "                   FROM dbo.account a\n"
                    + "                   JOIN dbo.mentor m ON m.idMentor = a.idAccount            \n"
                    + "                    WHERE a.username like ? or m.fullname like ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + searchMentor + "%");
            stm.setString(2, "%" + searchMentor + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String FullName = rs.getString(2);
                String accountname = rs.getString(3);
                String profession = rs.getString(4);

                mentors.add(new Mentor(id, FullName, accountname, profession));

            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("loi ham listMentorBySkill");
        }
        return mentors;
    }

    public Account getAccountByid(int idAccount) {
        try {
            String strSelect = "SELECT * FROM dbo.account WHERE idAccount = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, idAccount);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String user = rs.getString(2);
                String email = rs.getString(3);
                String pass = rs.getString(4);
                String role = rs.getString(5);
                int confirm = rs.getInt(6);
                int active = rs.getInt(7);
                Account a = new Account(id, user, email, pass, role, confirm, active);
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean activeMentortt(int id, boolean active) {
        AdminDAO admindao = new AdminDAO();
        Account s = admindao.getAccountByid(id);
        try {
            String strUPDATE = "UPDATE dbo.account\n"
                    + "SET Active = ?\n"
                    + "WHERE idAccount = ?";
            stm = connection.prepareStatement(strUPDATE);

            stm.setBoolean(1, active); // Đây là nơi phát sinh lỗi
            stm.setInt(2, id);

            int rowsAffected = stm.executeUpdate();
            stm.close();

            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println("Error: Unable to update the status.");
            e.printStackTrace();
            return false;
        }
    }

    public List<Mentor> getlistallMentor() {
        try {
            String strSelect = "select * from Mentor \n";

            stm = connection.prepareStatement(strSelect);

            rs = stm.executeQuery();
            while (rs.next()) {
                int idMentor = rs.getInt(1);
                String fullname = rs.getString(2);
                String avatar = rs.getString(3);
                String phone = rs.getString(4);
                String dob = rs.getString(5);
                String sex = rs.getString(6);
                String address = rs.getString(7);
                String registerDate = rs.getString(8);
                String profession = rs.getString(9);
                String pro_introduc = rs.getString(10);
                String archivement_sescition = rs.getString(11);
                String framework = rs.getString(12);
                String experience = rs.getString(13);
                String education = rs.getString(14);
                String myservice = rs.getString(15);

                Mentor a = new Mentor(idMentor, fullname, avatar, phone, dob, sex, address, registerDate, profession, pro_introduc, archivement_sescition, framework, experience, education, myservice);
                liss.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return liss;
    }

    public boolean activeMentor(int id) {
        AdminDAO admindao = new AdminDAO();
        Account s = admindao.getAccountByid(id);
        try {
            String strUPDATE = "UPDATE dbo.account\n"
                    + "SET Active = ?\n"
                    + "WHERE idAccount = ?";
            stm = connection.prepareStatement(strUPDATE);
            int Active;
            if (s.getActive() == 0) {
                Active = 1;
            } else {
                Active = 0;
            }

            stm.setInt(1, Active);
            stm.setInt(2, id);

            int rowsAffected = stm.executeUpdate();
            stm.close();

            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println("Error: Unable to update the status.");
            e.printStackTrace();
            return false;
        }
    }

    public float getRate(int idMentor) {
        float sum = 0;
        int count = 0;
        try {
            String sql = "SELECT * FROM dbo.rate \n"
                    + "WHERE idMentor=?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, idMentor);
            rs = stm.executeQuery();
            while (rs.next()) {
                sum += rs.getInt(5);
                count++;
            }
            // Kiểm tra count trước khi tính toán rate
            if (count == 0) {
                return 0; // Trả về 0 nếu count bằng 0
            } else {
                return (float) (sum / count); // Trả về rate nếu count lớn hơn 0
            }
        } catch (Exception e) {
            return 0;
        }
    }

    public int countAcceptedRequests(int idMentor) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM dbo.request WHERE idMentor = ? AND status IN ('Learning', 'Completed', 'Closed')";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, idMentor);
            rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return count;
    }

    public float calculateCompletedPercentage(int idMentor) {
        int totalAccepted = countAcceptedRequests(idMentor);
        if (totalAccepted == 0) {
            return 0; // Avoid division by zero
        }
        int closedRequests = 0;
        try {
            String sql = "SELECT COUNT(*) FROM dbo.request WHERE idMentor = ? AND status = 'Closed'";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, idMentor);
            rs = stm.executeQuery();
            if (rs.next()) {
                closedRequests = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return (float) (closedRequests * 100.0 / totalAccepted);
    }

    public List<AListMentor> listAllMen() {
        try {
            String sql = "SELECT\n"
                    + "    m.idMentor,\n"
                    + "    m.fullname,\n"
                    + "    a.username,\n"
                    + "    m.profession ,\n"
                    + "    NumAcceptedRequests,\n"
                    + "    FORMAT(COALESCE(ClosedRequests, 0) * 100.0 / NumAcceptedRequests, '0.00'),\n"
                    + "    FORMAT(COALESCE(AVG(CAST(r.star AS FLOAT)), 0), '0.00') as rate,\n"
                    + "	a.active\n"
                    + "FROM\n"
                    + "    dbo.mentor m\n"
                    + "JOIN\n"
                    + "    dbo.account a ON m.idMentor = a.idAccount\n"
                    + "LEFT JOIN\n"
                    + "    (SELECT\n"
                    + "         idMentor,\n"
                    + "         COUNT(*) AS NumAcceptedRequests\n"
                    + "     FROM\n"
                    + "         dbo.request\n"
                    + "     WHERE\n"
                    + "         status IN ('Learning', 'Completed', 'Closed')\n"
                    + "     GROUP BY\n"
                    + "         idMentor) AS Accepted ON m.idMentor = Accepted.idMentor\n"
                    + "LEFT JOIN\n"
                    + "    (SELECT\n"
                    + "         idMentor,\n"
                    + "         COUNT(*) AS ClosedRequests\n"
                    + "     FROM\n"
                    + "         dbo.request\n"
                    + "     WHERE\n"
                    + "         status = 'Closed'\n"
                    + "     GROUP BY\n"
                    + "         idMentor) AS Closed ON m.idMentor = Closed.idMentor\n"
                    + "LEFT JOIN\n"
                    + "    dbo.rate r ON m.idMentor = r.idMentor\n"
                    + "GROUP BY\n"
                    + "    m.idMentor, m.fullname, a.username, m.profession, Accepted.NumAcceptedRequests, Closed.ClosedRequests,a.active;";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String FullName = rs.getString(2);
                String accountname = rs.getString(3);
                String Profession = rs.getString(4);
                int acceptrequest;
                acceptrequest = rs.getInt(5);
                float percentcompleted;
                percentcompleted = rs.getFloat(6);
                float rate;
                rate = rs.getFloat(7);
                int active = rs.getInt(8);
                AListMentor s = new AListMentor(id, FullName, accountname, Profession, acceptrequest, percentcompleted, rate, active);
                lis.add(s);
            }
        } catch (Exception e) {;
            System.out.println("ko lay dc list skill");
        }
        return lis;

    }

    public List<SkillMentor> listAllSkill() {
        try {
            String sql = "SELECT * FROM dbo.skill";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString(2);
                String image = rs.getString(3);
                String skillName = rs.getString(4);
                String Skill_description = rs.getString(5);
                String status = rs.getString(6);

                SkillMentor s = new SkillMentor(id, title, image, skillName, Skill_description, status);
                listSkill.add(s);
            }
        } catch (Exception e) {
            System.out.println("ko lay dc list skill");
        }
        return listSkill;

    }

    public SkillMentor getSkillById(int id) {
        try {
            String sql = "SELECT * FROM dbo.skill WHERE id=?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                String title = rs.getString(2);
                String image = rs.getString(3);
                String name = rs.getString(4);
                String descrip = rs.getString(5);
                String status = rs.getString(6);
                SkillMentor s = new SkillMentor(id, title, image, name, descrip, status);

                return s;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public boolean updateSkill(int id, String title, String image, String name, String description, String status) {
        try {
            String strUPDATE = "UPDATE dbo.skill \n"
                    + "SET title=?,image=?,skillName=?,skill_description=?,status=?\n"
                    + "WHERE id=?";
            stm = connection.prepareStatement(strUPDATE);
            stm.setString(1, title);
            stm.setString(2, image);
            stm.setString(3, name);
            stm.setString(4, description);
            stm.setString(5, status);
            stm.setInt(6, id);

            int rowsAffected = stm.executeUpdate();
            stm.close();

            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println("loi, ko update dc");
            return false;
        }
    }

    public boolean activeSkill(String id) {
        AdminDAO admindao = new AdminDAO();
        SkillMentor skill = admindao.getSkillById(Integer.parseInt(id));
        try {
            String strUPDATE = "UPDATE dbo.skill \n"
                    + "SET status =?\n"
                    + "WHERE id=?";
            stm = connection.prepareStatement(strUPDATE);
            String status = "";
            if (skill.getStatus().equals("enable")) {
                status = "disable";
            } else {
                status = "enable";
            }
            stm.setString(1, status);
            stm.setString(2, id);

            int rowsAffected = stm.executeUpdate();
            stm.close();

            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println("loi, ko update dc");
            return false;
        }
    }

    public boolean addSkill(SkillMentor skill) {
        try {
            String strSelect = "INSERT INTO dbo.skill(title,image,skillName,skill_description)\n"
                    + "VALUES (?,?,?,?)";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, skill.getTiltle());
            stm.setString(2, skill.getImage());
            stm.setString(3, skill.getSkillName());
            stm.setString(4, skill.getSkill_description());

            int rowsAffected = stm.executeUpdate();

            // Close the prepared statement
            stm.close();

            return rowsAffected > 0;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }

    public List<News> getAllnews() {
        try {
            String strSelect = "select * from news";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                News i = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8), rs.getString(9));

                listnews.add(i);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listnews;
    }

    public boolean addNews(News news) {
        try {
            String strSelect = "INSERT INTO news (title, content, imageURL, postDate, eventDay, eventMonth, eventYear, summary)\n"
                    + "VALUES (?,?,?,?,?,?,?,?)";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, news.getTitle());
            stm.setString(2, news.getContent());
            stm.setString(3, news.getImageURL());
            stm.setString(4, news.getPostDate());
            stm.setInt(5, news.getEventday());
            stm.setString(6, news.getMonthdate());
            stm.setInt(7, news.getYeardate());
            stm.setString(8, news.getSummary());

            int rowsAffected = stm.executeUpdate();

            // Close the prepared statement
            stm.close();

            return rowsAffected > 0;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        }
    }

    public News getNewsById(int id) {
        try {
            String sql = "SELECT * FROM news WHERE newsid = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                String title = rs.getString(2);
                String content = rs.getString(3);
                String ImageURL = rs.getString(4);
                String PostDate = rs.getString(5);
                int eventday = rs.getInt(6);
                String Monthdate = rs.getString(7);
                int Yeardate = rs.getInt(8);
                String Summary = rs.getString(9);
                News s = new News(id, title, content, ImageURL, PostDate, eventday, Monthdate, Yeardate, Summary);

                return s;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public boolean updateNews(int newsID, String title, String content, String imageURL, String postDate, int eventDay, String eventMonth, int eventYear, String summary) {
        try {
            String strUPDATE = "UPDATE dbo.news "
                    + "SET title=?, content=?, imageURL=?, postDate=?, eventDay=?, eventMonth=?, eventYear=?, summary=? "
                    + "WHERE newsID=?";
            stm = connection.prepareStatement(strUPDATE);
            stm.setString(1, title);
            stm.setString(2, content);
            stm.setString(3, imageURL);
            stm.setString(4, postDate);
            stm.setInt(5, eventDay);
            stm.setString(6, eventMonth);
            stm.setInt(7, eventYear);
            stm.setString(8, summary);
            stm.setInt(9, newsID);

            int rowsAffected = stm.executeUpdate();
            stm.close();

            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace(); // In ra thông tin lỗi nếu có
            return false;
        }
    }
// delete

    public boolean deleteNews(int newsID) {
        try {
            String strDELETE = "DELETE FROM dbo.news WHERE newsID=?";
            PreparedStatement stm = connection.prepareStatement(strDELETE);
            stm.setInt(1, newsID);

            int rowsAffected = stm.executeUpdate();
            stm.close();

            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace(); // In ra thông tin lỗi nếu có
            return false;
        }
    }
    // trangdh
     List<Adshowreq> listR = new ArrayList<>();

    public List<Adshowreq> getAllAdshowreq() {
        List<Adshowreq> listR = new ArrayList<>(); // Initialize the list

        String sql = "SELECT m.idMentee,r.idRequest, a.username, r.title, r.content, r.skill, r.status,r.startDate, r.deadline, r.hour,r.reasonReject\n"
                + "                                     FROM mentee m\n"
                + "                                     JOIN dbo.account a ON m.idMentee = a.idAccount\n"
                + "                                     JOIN dbo.request r ON m.idMentee = r.idMentee\n"
                + "                                     ORDER BY r.idRequest ASC";
        try ( PreparedStatement stm = connection.prepareStatement(sql);  ResultSet rs = stm.executeQuery()) {
            while (rs.next()) {
                Adshowreq objE = new Adshowreq(
                        rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getFloat(10), rs.getString(11)
                );
                listR.add(objE);
            }
        } catch (SQLException e) {
            System.out.println("Error when selecting: " + e.getMessage());
        }
        return listR;
    }

// seach
    public List<Adshowreq> searchAdshowreq(String searchTerm) {
        List<Adshowreq> listR = new ArrayList<>();

        String sql = "SELECT m.idMentee, r.idRequest, a.username, r.title, r.content, r.skill, r.status, r.startDate, r.deadline, r.hour,r.reasonReject\n"
                + "FROM mentee m\n"
                + "JOIN dbo.account a ON m.idMentee = a.idAccount\n"
                + "JOIN dbo.request r ON m.idMentee = r.idMentee\n"
                + "WHERE a.username LIKE ? \n" // Filter by username
                + "ORDER BY r.idRequest ASC";

        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            // Set the search term for username using LIKE clause
            stm.setString(1, "%" + searchTerm + "%");

            try ( ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    Adshowreq objE = new Adshowreq(
                            rs.getInt(1), rs.getInt(2), rs.getString(3),
                            rs.getString(4), rs.getString(5), rs.getString(6),
                            rs.getString(7), rs.getString(8), rs.getString(9),
                            rs.getFloat(10), rs.getString(11)
                    );
                    listR.add(objE);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error when selecting");
            e.printStackTrace();
        }

        return listR;
    }

    // 
    // chi tiet request
    public List<ReDetail> getAllReDetails() {
        List<ReDetail> reDetailList = new ArrayList<>();
        String sql = "SELECT m.idMentee, r.idRequest, a.username, m.fullname, m.dob, m.phone, m.sex, m.avatar, m.address, r.title, r.content, r.status, r.skill, r.startDate, r.deadline, r.hour, r.reasonReject\n"
                + "FROM mentee AS m\n"
                + "JOIN request AS r ON m.idMentee = r.idMentee\n"
                + "JOIN account AS a ON m.idMentee = a.idAccount";

        try ( PreparedStatement stm = connection.prepareStatement(sql);  ResultSet rs = stm.executeQuery()) {

            while (rs.next()) {
                ReDetail reDetail = new ReDetail(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15),
                        rs.getFloat(16),
                        rs.getString(17)
                );
                reDetailList.add(reDetail);
            }
        } catch (SQLException e) {
            System.out.println("Error when selecting: " + e.getMessage());
            e.printStackTrace(); // Log or handle the exception as needed
        }

        return reDetailList;
    }

//
    public ReDetail getRequestById(int idRequest) {
        ReDetail requestDetail = null;
        String sql = "SELECT m.idMentee, r.idRequest, a.username, m.fullname, m.dob, "
                + "m.phone, m.sex, m.avatar, m.address, r.title, r.content, r.status, "
                + "r.skill, r.startDate, r.deadline, r.hour, r.reasonReject\n"
                + "FROM mentee AS m \n"
                + "JOIN request AS r ON m.idMentee = r.idMentee\n"
                + "JOIN account AS a ON m.idMentee = a.idAccount\n"
                + "WHERE r.idRequest = ?";

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, idRequest); // Use setInt for integer parameter
            rs = stm.executeQuery();

            if (rs.next()) {
                requestDetail = new ReDetail(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15),
                        rs.getFloat(16),
                        rs.getString(17)
                );
            }
        } catch (SQLException e) {
            System.out.println("Error when selecting");
            e.printStackTrace(); // Log or handle the exception as needed
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Log or handle the exception as needed
            }
        }

        return requestDetail;
    }

// check status 
    public List<String> getAllDistinctStatus() {
        List<String> statusList = new ArrayList<>();
        String sql = "SELECT DISTINCT r.status FROM dbo.request r";

        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                statusList.add(rs.getString(1));
            }
        } catch (SQLException e) {
            System.out.println("Error when selecting distinct status");
        } finally {
            // Close PreparedStatement and ResultSet here (if not using try-with-resources)
        }

        return statusList;
    }

// check date 
    public List<Adshowreq> checkdate(String startDate, String endDate) {
        List<Adshowreq> listR = new ArrayList<>();

        String sql = "SELECT m.idMentee, r.idRequest, a.username, r.title, r.content, r.skill, r.status, r.startDate, r.deadline,r.hour,r.reasonReject\n"
                + "FROM mentee m\n"
                + "JOIN dbo.account a ON m.idMentee = a.idAccount\n"
                + "JOIN dbo.request r ON m.idMentee = r.idMentee\n"
                + "WHERE r.startDate >= ? AND r.deadline <= ?\n"
                + "ORDER BY r.idRequest ASC";

        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            // Set the start date and end date parameters
            stm.setString(1, startDate);
            stm.setString(2, endDate);

            try ( ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    Adshowreq objE = new Adshowreq(
                            rs.getInt(1), rs.getInt(2), rs.getString(3),
                            rs.getString(4), rs.getString(5), rs.getString(6),
                            rs.getString(7), rs.getString(8), rs.getString(9),
                            rs.getFloat(10), rs.getString(11)
                    );
                    listR.add(objE);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error when checking date");
            e.printStackTrace();
        }

        return listR;
    }

// checkfitter date and 
    public List<Adshowreq> getAdshowreqByStatusAndDate(String status, String startDate, String endDate) {
        List<Adshowreq> listR = new ArrayList<>();

        String sql = "SELECT m.idMentee, r.idRequest, a.username, r.title, r.content, r.skill, r.status, r.startDate, r.deadline,r.hour,r.reasonReject\n"
                + "FROM mentee m\n"
                + "JOIN dbo.account a ON m.idMentee = a.idAccount\n"
                + "JOIN dbo.request r ON m.idMentee = r.idMentee\n"
                + "WHERE r.status = ? AND r.startDate >= ? AND r.deadline <= ?";

        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            // Set parameters
            stm.setString(1, status);
            stm.setString(2, startDate);
            stm.setString(3, endDate);

            try ( ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    Adshowreq objE = new Adshowreq(
                            rs.getInt(1), rs.getInt(2), rs.getString(3),
                            rs.getString(4), rs.getString(5), rs.getString(6),
                            rs.getString(7), rs.getString(8), rs.getString(9),
                            rs.getFloat(10), rs.getString(11)
                    );
                    listR.add(objE);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error when fetching Adshowreq by status and date");
            e.printStackTrace();
        }

        return listR;
    }

    // lay nhieu status
    public List<Adshowreq> getAdshowreqByStatus(String status, String startDate, String endDate) {
        List<Adshowreq> listR = new ArrayList<>();

        // SQL query
        String sql = "SELECT m.idMentee, r.idRequest, a.username, r.title, r.content, r.skill, r.status, r.startDate, r.deadline,r.hour,r.reasonReject\n"
                + "FROM mentee m\n"
                + "JOIN dbo.account a ON m.idMentee = a.idAccount\n"
                + "JOIN dbo.request r ON m.idMentee = r.idMentee\n"
                + "WHERE r.status = ?";

        try {
            // Dynamically add date conditions if provided
            if (startDate != null && !startDate.isEmpty()) {
                sql += " AND r.startDate >= ?";
            }
            if (endDate != null && !endDate.isEmpty()) {
                sql += " AND r.deadline <= ?";
            }

            // Prepare and execute the SQL statement
            try ( PreparedStatement stm = connection.prepareStatement(sql)) {
                stm.setString(1, status);

                int parameterIndex = 2;

                if (startDate != null && !startDate.isEmpty()) {
                    stm.setString(parameterIndex++, startDate);
                }
                if (endDate != null && !endDate.isEmpty()) {
                    stm.setString(parameterIndex, endDate);
                }

                try ( ResultSet rs = stm.executeQuery()) {
                    while (rs.next()) {
                        Adshowreq objE = new Adshowreq(
                                rs.getInt(1), rs.getInt(2), rs.getString(3),
                                rs.getString(4), rs.getString(5), rs.getString(6),
                                rs.getString(7), rs.getString(8), rs.getString(9),
                                rs.getFloat(10), rs.getString(11)
                        );
                        listR.add(objE);
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Error when fetching Adshowreq by status and date");
            e.printStackTrace();
        }

        return listR;
    }

    public List<Adshowreq> getMulStatus(List<String> statuses, String startDate, String endDate) {
        List<Adshowreq> listR = new ArrayList<>();

        try {
            // Create a dynamic SQL query with the correct number of placeholders
            StringBuilder sqlBuilder = new StringBuilder("SELECT m.idMentee, r.idRequest, a.username, r.title, r.content, r.skill, r.status, r.startDate, r.deadline,r.hour,r.reasonReject\n"
                    + "FROM mentee m\n"
                    + "JOIN dbo.account a ON m.idMentee = a.idAccount\n"
                    + "JOIN dbo.request r ON m.idMentee = r.idMentee\n"
                    + "WHERE r.status IN (");

            // Append placeholders based on the number of statuses
            for (int i = 0; i < statuses.size(); i++) {
                sqlBuilder.append("?");
                if (i < statuses.size() - 1) {
                    sqlBuilder.append(", ");
                }
            }

            sqlBuilder.append(")");

            // Append conditions for startDate and endDate if they are provided
            if (startDate != null && endDate != null) {
                sqlBuilder.append(" AND r.startDate >= ? AND r.deadline <= ?");
            }

            // Use try-with-resources to ensure PreparedStatement and ResultSet are closed
            try ( PreparedStatement stm = connection.prepareStatement(sqlBuilder.toString())) {
                // Set parameters for statuses
                for (int i = 0; i < statuses.size(); i++) {
                    stm.setString(i + 1, statuses.get(i));
                }

                // Set parameters for startDate and endDate if they are provided
                int parameterIndex = statuses.size() + 1;
                if (startDate != null && endDate != null) {
                    stm.setString(parameterIndex++, startDate);
                    stm.setString(parameterIndex, endDate);
                }

                // Execute the query
                try ( ResultSet rs = stm.executeQuery()) {
                    while (rs.next()) {
                        Adshowreq objE = new Adshowreq(
                                rs.getInt(1), rs.getInt(2), rs.getString(3),
                                rs.getString(4), rs.getString(5), rs.getString(6),
                                rs.getString(7), rs.getString(8), rs.getString(9),
                                rs.getFloat(10), rs.getString(11)
                        );
                        listR.add(objE);
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Error when fetching Adshowreq by multiple statuses and date");
            e.printStackTrace();
        }

        return listR;
    }
    public static void main(String[] args) {
        AdminDAO dao = new AdminDAO();

        // Sample data for testing
        List<String> statuses = new ArrayList<>(Arrays.asList("Open", "", ""));
        String startDate = "2024-01-01"; // Adjust the date based on your data
        String endDate = "2024-12-31";   // Adjust the date based on your data

        // Call the getMulStatus method
        List<Adshowreq> result = dao.getMulStatus(statuses, startDate, endDate);

        // Print the result
        for (Adshowreq adshowreq : result) {
            System.out.println(adshowreq);
        }

    }

}
