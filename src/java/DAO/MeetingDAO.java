/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package DAO;

import Model.Meeting;
import dal.ConnectDB;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Zanis
 */
public class MeetingDAO extends ConnectDB implements DAO<Meeting> {

    private String sql;
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    @Override
    public List<Meeting> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Optional<Meeting> get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void save(Meeting t) {
        sql = "INSERT INTO [RealClub].[dbo].[MeetingSchedule] ([MeetingDate]\n"
                + "      ,[MeetingTime]\n"
                + "      ,[Location]\n"
                + "      ,[Description]) VALUES (?, ?, ?, ?)";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setDate(1, Date.valueOf(t.getMeetingDate()));
            st.setString(2, t.getMeetingTime());
            st.setString(3, t.getLocation());
            st.setString(4, t.getDescription());
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("MeetingSchedule saved successfully.");
            } else {
                System.out.println("Failed to save MeetingSchedule.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(MeetingDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }

    }

    @Override
    public void update(Meeting t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private void closeResources() {
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
