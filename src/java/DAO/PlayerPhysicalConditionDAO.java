package DAO;

import Model.PlayerPhysicalCondition;
import dal.ConnectDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PlayerPhysicalConditionDAO extends ConnectDB implements DAO<PlayerPhysicalCondition> {

    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    @Override
    public List<PlayerPhysicalCondition> getAll() {
        List<PlayerPhysicalCondition> conditions = new ArrayList<>();
        String sql = "SELECT [ConditionID], [PlayerID], [ConditionDescription], [DateRecorded] FROM [RealClub].[dbo].[PlayerPhysicalCondition]";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                int conditionID = rs.getInt("ConditionID");
                int playerID = rs.getInt("PlayerID");
                String conditionDescription = rs.getString("ConditionDescription");
                Date dateRecorded = rs.getDate("DateRecorded");

                PlayerPhysicalCondition condition = new PlayerPhysicalCondition(conditionID, playerID, conditionDescription, dateRecorded.toLocalDate());
                conditions.add(condition);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(PlayerPhysicalConditionDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return conditions;
    }

    @Override
    public Optional<PlayerPhysicalCondition> get(int conditionID) {
        String sql = "SELECT [PlayerID], [ConditionDescription], [DateRecorded] FROM [RealClub].[dbo].[PlayerPhysicalCondition] WHERE [ConditionID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, conditionID);
            rs = st.executeQuery();
            if (rs.next()) {
                int playerID = rs.getInt("PlayerID");
                String conditionDescription = rs.getString("ConditionDescription");
                Date dateRecorded = rs.getDate("DateRecorded");

                PlayerPhysicalCondition condition = new PlayerPhysicalCondition(conditionID, playerID, conditionDescription, dateRecorded.toLocalDate());
                return Optional.of(condition);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(PlayerPhysicalConditionDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return Optional.empty();
    }

    @Override
    public void save(PlayerPhysicalCondition condition) {
        String sql = "INSERT INTO [RealClub].[dbo].[PlayerPhysicalCondition] ([PlayerID], [ConditionDescription], [DateRecorded]) VALUES (?, ?, ?)";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, condition.getPlayerID());
            st.setString(2, condition.getConditionDescription());
            st.setDate(3, Date.valueOf(condition.getDateRecorded()));
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Player Physical Condition saved successfully.");
            } else {
                System.out.println("Failed to save Player Physical Condition.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(PlayerPhysicalConditionDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
    }

    @Override
    public void update(PlayerPhysicalCondition condition) {
        String sql = "UPDATE [RealClub].[dbo].[PlayerPhysicalCondition] SET [PlayerID] = ?, [ConditionDescription] = ?, [DateRecorded] = ? WHERE [ConditionID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, condition.getPlayerID());
            st.setString(2, condition.getConditionDescription());
            st.setDate(3, Date.valueOf(condition.getDateRecorded()));
            st.setInt(4, condition.getConditionID());
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Player Physical Condition updated successfully.");
            } else {
                System.out.println("Failed to update Player Physical Condition.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(PlayerPhysicalConditionDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
    }

    @Override
    public void delete(int conditionID) {
        String sql = "DELETE FROM [RealClub].[dbo].[PlayerPhysicalCondition] WHERE [ConditionID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, conditionID);
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Player Physical Condition deleted successfully.");
            } else {
                System.out.println("Failed to delete Player Physical Condition.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(PlayerPhysicalConditionDAO.class.getName()).log(Level.SEVERE, null, e);
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
