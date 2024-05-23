/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.News;
import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.SQLException;
import java.util.Arrays;

/**
 *
 * @author Desktop
 */
public class NewsDAO extends dal.ConnectDB implements DAO<News> {

    private String sql;
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    @Override
    public List<News> getAll() {
        try {
            List listNews = new ArrayList<>();
            sql = "SELECT TOP (1000) [NewsID]\n"
                    + "      ,[NewsTitle]\n"
                    + "      ,[NewsImageDescription]\n"
                    + "      ,[NewsContent]\n"
                    + "      ,[DatePosted]\n"
                    + "  FROM [RealClub].[dbo].[TeamNews]";

            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            st = con.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                News n = new News();
                n.setNewsId(rs.getInt(1));
                n.setNewsTitle(rs.getString(2));
                String[] images = rs.getString(3).trim().split(",");
                n.setNewsImageDescription(images);
                String[] contents = rs.getString(4).trim().split("/");
                n.setNewsContent(contents);
                Date sqlDate = rs.getDate(5);
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    n.setDatePosted(localDate);
                }

                listNews.add(n);
            }
            return listNews;
        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public Optional<News> get(int id) {
        try {
            News n = new News();
            sql = "SELECT TOP (1000) [NewsID]\n"
                    + "      ,[NewsTitle]\n"
                    + "      ,[NewsImageDescription]\n"
                    + "      ,[NewsContent]\n"
                    + "      ,[DatePosted]\n"
                    + "  FROM [RealClub].[dbo].[TeamNews] where NewsID=?";

            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            st = con.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();

            while (rs.next()) {

                n.setNewsId(rs.getInt(1));
                n.setNewsTitle(rs.getString(2));
                String[] images = rs.getString(3).trim().split(",");
                n.setNewsImageDescription(images);
                String[] contents = rs.getString(4).trim().split("/");
                n.setNewsContent(contents);
                Date sqlDate = rs.getDate(5);
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    n.setDatePosted(localDate);
                }

            }
            return Optional.of(n);
        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public void save(News t) {
        try {
            News n = new News();
            sql = "INSERT INTO [dbo].[TeamNews] "
                    + "([NewsTitle], [NewsImageDescription], [NewsContent], [DatePosted]) "
                    + "VALUES (?, ?, ?, ?)";

            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            st = con.prepareStatement(sql);
            st.setString(1, t.getNewsTitle());
            st.setString(2, String.join(",", t.getNewsImageDescription()));
            st.setString(3, String.join("/", t.getNewsContent()));
            st.setDate(4, java.sql.Date.valueOf(t.getDatePosted()));

            int rowsAffected = st.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("That bai");
            } else {
                System.out.println("Thanh cong");
            }

        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    @Override
    public void update(News t) {
        try {
            News n = new News();
            sql = "UPDATE [dbo].[TeamNews]\n"
                    + "   SET [NewsTitle] = (?)\n"
                    + "      ,[NewsImageDescription] = (?)\n"
                    + "      ,[NewsContent] = (?)\n"
                    + "      ,[DatePosted] = (?)\n"
                    + " WHERE [NewsID]=?";

            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            st = con.prepareStatement(sql);
            st.setString(1, t.getNewsTitle());
            st.setString(2, String.join(",", t.getNewsImageDescription()));
            st.setString(3, String.join("/", t.getNewsContent()));
            st.setDate(4, java.sql.Date.valueOf(t.getDatePosted()));
            st.setInt(5, t.getNewsId());

            int rowsAffected = st.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("That bai");
            } else {
                System.out.println("Thanh cong");
            }

        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void delete(int id) {
        try {
            News n = new News();
            sql = "DELETE FROM [dbo].[TeamNews]\n"
                    + "      WHERE [NewsID]=?";

            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            st = con.prepareStatement(sql);
            st.setInt(1, id);
            

            int rowsAffected = st.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("That bai");
            } else {
                System.out.println("Thanh cong");
            }

        } catch (SQLException e) {
            try {
                throw e;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        } finally {
            // Đóng các tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}