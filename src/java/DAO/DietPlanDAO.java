package DAO;

import Model.DietPlan;
import dal.ConnectDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DietPlanDAO extends ConnectDB implements DAO<DietPlan> {

    private String sql;
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    public List<DietPlan> getAll() {
        List<DietPlan> dietPlans = new ArrayList<>();
        sql = "SELECT [DietPlanID], [PlayerID], [PlanDescription] FROM [RealClub].[dbo].[DietPlan]";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                DietPlan dp = new DietPlan();
                dp.setDietPlanID(rs.getInt("DietPlanID"));
                dp.setPlayerID(rs.getInt("PlayerID"));
                dp.setPlanDescription(rs.getString("PlanDescription"));
                dietPlans.add(dp);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(DietPlanDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return dietPlans;
    }

    @Override
    public Optional<DietPlan> get(int id) {
        sql = "SELECT [DietPlanID], [PlayerID], [PlanDescription] FROM [RealClub].[dbo].[DietPlan] WHERE [DietPlanID] = ?";
        DietPlan dp = null;
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                dp = new DietPlan();
                dp.setDietPlanID(rs.getInt("DietPlanID"));
                dp.setPlayerID(rs.getInt("PlayerID"));
                dp.setPlanDescription(rs.getString("PlanDescription"));
                return Optional.of(dp);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(DietPlanDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return Optional.empty();
    }

    @Override
    public void save(DietPlan dp) {
        sql = "INSERT INTO [RealClub].[dbo].[DietPlan] ([PlayerID], [PlanDescription]) VALUES (?, ?)";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, dp.getPlayerID());
            st.setString(2, dp.getPlanDescription());
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Diet plan saved successfully.");
            } else {
                System.out.println("Failed to save diet plan.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(DietPlanDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
    }

    @Override
    public void update(DietPlan dp) {
        sql = "UPDATE [RealClub].[dbo].[DietPlan] SET [PlayerID] = ?, [PlanDescription] = ? WHERE [DietPlanID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, dp.getPlayerID());
            st.setString(2, dp.getPlanDescription());
            st.setInt(3, dp.getDietPlanID());
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Diet plan updated successfully.");
            } else {
                System.out.println("Failed to update diet plan.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(DietPlanDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
    }

    @Override
    public void delete(int id) {
        sql = "DELETE FROM [RealClub].[dbo].[DietPlan] WHERE [DietPlanID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, id);
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Diet plan deleted successfully.");
            } else {
                System.out.println("Failed to delete diet plan.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(DietPlanDAO.class.getName()).log(Level.SEVERE, null, e);
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
