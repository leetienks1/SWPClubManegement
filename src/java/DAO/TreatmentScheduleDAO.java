package DAO;

import Model.TreatmentSchedule;
import dal.ConnectDB;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TreatmentScheduleDAO extends ConnectDB implements DAO<TreatmentSchedule> {

    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    @Override
    public List<TreatmentSchedule> getAll() {
        List<TreatmentSchedule> schedules = new ArrayList<>();
        String sql = "SELECT [TreatmentID], [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription] FROM [RealClub].[dbo].[TreatmentSchedule]";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                int treatmentID = rs.getInt("TreatmentID");
                int playerID = rs.getInt("PlayerID");
                LocalDate treatmentDate = rs.getDate("TreatmentDate").toLocalDate();
                LocalTime treatmentTime = rs.getTime("TreatmentTime").toLocalTime();
                String treatmentDescription = rs.getString("TreatmentDescription");

                TreatmentSchedule schedule = new TreatmentSchedule(treatmentID, playerID, treatmentDate, treatmentTime, treatmentDescription);
                schedules.add(schedule);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(TreatmentScheduleDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return schedules;
    }

    @Override
    public Optional<TreatmentSchedule> get(int treatmentID) {
        String sql = "SELECT [PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription] FROM [RealClub].[dbo].[TreatmentSchedule] WHERE [TreatmentID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, treatmentID);
            rs = st.executeQuery();
            if (rs.next()) {
                int playerID = rs.getInt("PlayerID");
                LocalDate treatmentDate = rs.getDate("TreatmentDate").toLocalDate();
                LocalTime treatmentTime = rs.getTime("TreatmentTime").toLocalTime();
                String treatmentDescription = rs.getString("TreatmentDescription");

                TreatmentSchedule schedule = new TreatmentSchedule(treatmentID, playerID, treatmentDate, treatmentTime, treatmentDescription);
                return Optional.of(schedule);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(TreatmentScheduleDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return Optional.empty();
    }

    @Override
    public void save(TreatmentSchedule schedule) {
        String sql = "INSERT INTO [RealClub].[dbo].[TreatmentSchedule] ([PlayerID], [TreatmentDate], [TreatmentTime], [TreatmentDescription]) VALUES (?, ?, ?, ?)";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, schedule.getPlayerID());
            st.setDate(2, Date.valueOf(schedule.getTreatmentDate()));
            st.setTime(3, Time.valueOf(schedule.getTreatmentTime()));
            st.setString(4, schedule.getTreatmentDescription());
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Treatment schedule saved successfully.");
            } else {
                System.out.println("Failed to save treatment schedule.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(TreatmentScheduleDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
    }

    @Override
    public void update(TreatmentSchedule schedule) {
        String sql = "UPDATE [RealClub].[dbo].[TreatmentSchedule] SET [PlayerID] = ?, [TreatmentDate] = ?, [TreatmentTime] = ?, [TreatmentDescription] = ? WHERE [TreatmentID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, schedule.getPlayerID());
            st.setDate(2, Date.valueOf(schedule.getTreatmentDate()));
            st.setTime(3, Time.valueOf(schedule.getTreatmentTime()));
            st.setString(4, schedule.getTreatmentDescription());
            st.setInt(5, schedule.getTreatmentID());
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Treatment schedule updated successfully.");
            } else {
                System.out.println("Failed to update treatment schedule.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(TreatmentScheduleDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
    }

    @Override
    public void delete(int treatmentID) {
        String sql = "DELETE FROM [RealClub].[dbo].[TreatmentSchedule] WHERE [TreatmentID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, treatmentID);
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Treatment schedule deleted successfully.");
            } else {
                System.out.println("Failed to delete treatment schedule.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(TreatmentScheduleDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
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
