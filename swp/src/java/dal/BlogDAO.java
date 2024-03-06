/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Blog;
import model.Mentor;
import model.Skill;

/**
 *
 * @author ADMIN
 */
public class BlogDAO {

    PreparedStatement stm;
    ResultSet rs;
    List<Blog> BlogList = new ArrayList<Blog>();
    List<Skill> ListSkills = new ArrayList<Skill>();
    MentorDAO menterDAO = new MentorDAO();

    public List<Blog> getAllBlog() {
        Connection conn = null;
        String query = "select * from blog ORDER BY updatedate DESC";
        try {
            conn = new DBContext().connection;
            stm = conn.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                int idBlog = rs.getInt(1);
                int idMentor = rs.getInt(2);
                Mentor m = menterDAO.getIDMentor(idMentor);
                String fullname = m.getFullname();
                String udate = rs.getString(3);
                String thumbnail = rs.getString(4);
                String title = rs.getString(5);
                String brief = rs.getString(6);
                String detail = rs.getString(7);

                Blog b = new Blog(idBlog, idMentor, fullname, udate, thumbnail, title, brief, detail);
                BlogList.add(b);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return BlogList;
    }

    public List<Blog> searchByTitle(String title) {
        List<Blog> BlogList1 = new ArrayList<Blog>();
        Connection conn = null;
        String query = "SELECT * FROM blog where title like ?";
        try {
            conn = new DBContext().connection;
            stm = conn.prepareStatement(query);
            stm.setString(1, "%" + title + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                int idBlog = rs.getInt(1);
                int idMentor = rs.getInt(2);
                Mentor m = menterDAO.getIDMentor(idMentor);
                String fullname = m.getFullname();
                String udate = rs.getString(3);
                String thumbnail = rs.getString(4);
                String title1 = rs.getString(5);
                String brief = rs.getString(6);
                String detail = rs.getString(7);
                Blog b = new Blog(idBlog, idMentor, fullname, udate, thumbnail, title1, brief, detail);
                BlogList1.add(b);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return BlogList1;
    }

    public int count(String title) {
        Connection conn = null;
        String query = "select count(*) from blog where title like ?";
        try {
            conn = new DBContext().connection;
            stm = conn.prepareStatement(query);
            stm.setString(1, "%" + title + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;

    }

    public int count() {
        Connection conn = null;
        String query = "select count(*) from blog";
        try {
            conn = new DBContext().connection;
            stm = conn.prepareStatement(query);

            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;

    }

    public List<Blog> pagingList(int index) {
        List<Blog> BlogList2 = new ArrayList<Blog>();
        Connection conn = null;
        String query = "SELECT * FROM blog\n"
                + "ORDER BY updatedate DESC\n"
                + "OFFSET ? ROWS FETCH NEXT 3 ROWS ONLY;";
        try {
            conn = new DBContext().connection;
            stm = conn.prepareStatement(query);
            stm.setInt(1, (index-1)*3);
            rs = stm.executeQuery();
            while (rs.next()) {
                int idBlog = rs.getInt(1);
                int idMentor = rs.getInt(2);
                Mentor m = menterDAO.getIDMentor(idMentor);
                String fullname = m.getFullname();
                String udate = rs.getString(3);
                String thumbnail = rs.getString(4);
                String title = rs.getString(5);
                String brief = rs.getString(6);
                String detail = rs.getString(7);

                Blog b = new Blog(idBlog, idMentor, fullname, udate, thumbnail, title, brief, detail);
                BlogList2.add(b);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return BlogList2;
    }

    public static void main(String[] args) {
        BlogDAO bd = new BlogDAO();
//        int count = bd.count("ipsum");
//        System.out.println(count);
//        List<Blog> BlogList = bd.getAllBlog();
//        for (Blog b : BlogList) {
//            System.out.println(b);
//            
//        }
        System.out.println(bd.searchByTitle("tắc"));
        System.out.println(bd.count());
        List<Blog> BlogList2 = bd.pagingList(1);
        for (Blog blog : BlogList2) {
            System.out.println(blog);
        }
    }
}
