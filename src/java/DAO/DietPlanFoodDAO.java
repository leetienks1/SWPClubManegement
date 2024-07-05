package DAO;

import Model.DietPlanFood;
import dal.ConnectDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DietPlanFoodDAO extends ConnectDB implements DAO<DietPlanFood> {

    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    @Override
    public List<DietPlanFood> getAll() {
        List<DietPlanFood> dietPlanFoods = new ArrayList<>();
        String sql = "SELECT [DietPlanID], [FoodID], [PortionSize] FROM [RealClub].[dbo].[DietPlanFoods]";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                int dietPlanID = rs.getInt("DietPlanID");
                int foodID = rs.getInt("FoodID");
                double portionSize = rs.getDouble("PortionSize");

                DietPlanFood dietPlanFood = new DietPlanFood(dietPlanID, foodID, portionSize);
                dietPlanFoods.add(dietPlanFood);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(DietPlanFoodDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return dietPlanFoods;
    }

    @Override
    public Optional<DietPlanFood> get(int dietPlanID) {
        String sql = "SELECT [FoodID], [PortionSize] FROM [RealClub].[dbo].[DietPlanFoods] WHERE [DietPlanID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, dietPlanID);
            rs = st.executeQuery();
            if (rs.next()) {
                int foodID = rs.getInt("FoodID");
                double portionSize = rs.getDouble("PortionSize");

                DietPlanFood dietPlanFood = new DietPlanFood(dietPlanID, foodID, portionSize);
                return Optional.of(dietPlanFood);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(DietPlanFoodDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return Optional.empty();
    }

    public Optional<DietPlanFood> getdietPlanFood(int dietPlanID, int Foodid) {
        String sql = "SELECT [FoodID], [PortionSize] FROM [RealClub].[dbo].[DietPlanFoods] WHERE [DietPlanID] = ? AND [FoodID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, dietPlanID);
            st.setInt(2, Foodid);
            rs = st.executeQuery();
            if (rs.next()) {
                int foodID = rs.getInt("FoodID");
                double portionSize = rs.getDouble("PortionSize");

                DietPlanFood dietPlanFood = new DietPlanFood(dietPlanID, foodID, portionSize);
                return Optional.of(dietPlanFood);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(DietPlanFoodDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return Optional.empty();
    }

    @Override
    public void save(DietPlanFood dietPlanFood) {
        String sql = "INSERT INTO [RealClub].[dbo].[DietPlanFoods] ([DietPlanID], [FoodID], [PortionSize]) VALUES (?, ?, ?)";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, dietPlanFood.getDietPlanID());
            st.setInt(2, dietPlanFood.getFoodID());
            st.setDouble(3, dietPlanFood.getPortionSize());
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Diet Plan Food saved successfully.");
            } else {
                System.out.println("Failed to save Diet Plan Food.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(DietPlanFoodDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
    }

    @Override
    public void update(DietPlanFood dietPlanFood) {
        String sql = "UPDATE [RealClub].[dbo].[DietPlanFoods] SET [FoodID] = ?, [PortionSize] = ? WHERE [DietPlanID] = ? AND [FoodID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, dietPlanFood.getFoodID());
            st.setDouble(2, dietPlanFood.getPortionSize());
            st.setInt(3, dietPlanFood.getDietPlanID());
            st.setInt(4, dietPlanFood.getFoodID());
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Diet Plan Food updated successfully.");
            } else {
                System.out.println("Failed to update Diet Plan Food.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(DietPlanFoodDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
    }

    public void updatePlanFood(DietPlanFood dietPlanFood, int idFoodOld) {
        String sql = "UPDATE [RealClub].[dbo].[DietPlanFoods] SET [FoodID] = ?, [PortionSize] = ? WHERE [DietPlanID] = ? AND [FoodID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, dietPlanFood.getFoodID());
            st.setDouble(2, dietPlanFood.getPortionSize());
            st.setInt(3, dietPlanFood.getDietPlanID());
            st.setInt(4, idFoodOld == dietPlanFood.getFoodID() ? dietPlanFood.getFoodID() : idFoodOld);
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Diet Plan Food updated successfully.");
            } else {
                System.out.println("Failed to update Diet Plan Food.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(DietPlanFoodDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
    }

    @Override
    public void delete(int dietPlanID) {
        String sql = "DELETE FROM [RealClub].[dbo].[DietPlanFoods] WHERE [DietPlanID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, dietPlanID);
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Diet Plan Food deleted successfully.");
            } else {
                System.out.println("Failed to delete Diet Plan Food.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(DietPlanFoodDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
    }

    public void deletedietPlanFood(int dietPlanID, int idFood) {
        String sql = "DELETE FROM [RealClub].[dbo].[DietPlanFoods] WHERE [DietPlanID] = ? AND [FoodID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, dietPlanID);
            st.setInt(2, idFood);
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Diet Plan Food deleted successfully.");
            } else {
                System.out.println("Failed to delete Diet Plan Food.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(DietPlanFoodDAO.class.getName()).log(Level.SEVERE, null, e);
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
