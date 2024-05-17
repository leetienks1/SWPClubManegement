/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.User;
import dal.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Desktop
 */
public class UserDAO extends ConnectDB implements DAO<User> {

    private String sql;
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    @Override
    public List<User> getAll() {
        try {
            List<User> users = new ArrayList<>();
            sql = "SELECT TOP (1000) [UserID]\n"
                    + "      ,[Username]\n"
                    + "      ,[Password]\n"
                    + "      ,[Email]\n"
                    + "      ,[Role]\n"
                    + "  FROM [RealClub].[dbo].[User]";
            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            st = con.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("UserID"));
                u.setUserName(rs.getString("Username"));
                u.setPassword(rs.getString("Password"));
                u.setEmail(rs.getString("Email"));

                u.setRole(u.getRole().valueOf(rs.getString("Role")));
                users.add(u);
            }
            return users;
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
    public Optional<User> get(int id) {
        try {

            sql = " SELECT TOP (1000) [UserID]\n"
                    + "      ,[Username]\n"
                    + "      ,[Password]\n"
                    + "      ,[Email]\n"
                    + "      ,[Role]\n"
                    + "  FROM [RealClub].[dbo].[User] where UserID = ?";
            try {
                con = this.openConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            st = con.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("UserID"));
                u.setUserName(rs.getString("Username"));
                u.setPassword(rs.getString("Password"));
                u.setEmail(rs.getString("Email"));
                u.setRole(u.getRole().valueOf(rs.getString("Role")));
                return Optional.of(u);
            } else {

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
        return Optional.empty();
    }

    @Override
    public void save(User t) {
        try {

            sql = "INSERT INTO [dbo].[User]\n"
                    + "           ([Username]\n"
                    + "           ,[Password]\n"
                    + "           ,[Email]\n"
                    + "           ,[Role])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";

            con = openConnection();
            st = con.prepareStatement(sql);
            st.setString(1, t.getUserName());
            st.setString(2, t.getPassword());
            st.setString(3, t.getEmail());
            st.setString(4, t.getRole().toString());

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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
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
    public void update(User t) {
        try {
            sql = "UPDATE [dbo].[User]\n"
                    + "   SET [Username] = ?\n"
                    + "      ,[Password] = ?\n"
                    + "      ,[Email] = ?\n"
                    + "      ,[Role] = ?\n"
                    + " WHERE [UserID] = ?";
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setString(1, t.getUserName());
            st.setString(2, t.getPassword());
            st.setString(3, t.getEmail());
            st.setString(4, t.getRole().toString());
            st.setInt(5, t.getUserId());
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

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
            sql = " DELETE FROM [dbo].[User]\n"
                    + "      WHERE [UserID] = ? \n";
            con = this.openConnection();
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

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
