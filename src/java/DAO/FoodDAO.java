package DAO;

import Model.Food;
import dal.ConnectDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FoodDAO extends ConnectDB implements DAO<Food> {

    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    @Override
    public List<Food> getAll() {
        List<Food> foods = new ArrayList<>();
        String sql = "SELECT [FoodID], [FoodName], [Description], [Calo], [Proteins], [Carbohydrates], [Fats] FROM [RealClub].[dbo].[Foods]";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                int foodID = rs.getInt("FoodID");
                String foodName = rs.getString("FoodName");
                String description = rs.getString("Description");
                int calo = rs.getInt("Calo");
                double proteins = rs.getDouble("Proteins");
                double carbohydrates = rs.getDouble("Carbohydrates");
                double fats = rs.getDouble("Fats");

                Food f = new Food(foodID, foodName, description, calo, proteins, carbohydrates, fats);
                foods.add(f);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(FoodDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return foods;
    }

    @Override
    public Optional<Food> get(int id) {
        String sql = "SELECT [FoodID], [FoodName], [Description], [Calo], [Proteins], [Carbohydrates], [Fats] FROM [RealClub].[dbo].[Foods] WHERE [FoodID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                int foodID = rs.getInt("FoodID");
                String foodName = rs.getString("FoodName");
                String description = rs.getString("Description");
                int calo = rs.getInt("Calo");
                double proteins = rs.getDouble("Proteins");
                double carbohydrates = rs.getDouble("Carbohydrates");
                double fats = rs.getDouble("Fats");

                Food f = new Food(foodID, foodName, description, calo, proteins, carbohydrates, fats);
                return Optional.of(f);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(FoodDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return Optional.empty();
    }

    @Override
    public void save(Food f) {
        String sql = "INSERT INTO [RealClub].[dbo].[Foods] ([FoodName], [Description], [Calo], [Proteins], [Carbohydrates], [Fats]) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setString(1, f.getFoodName());
            st.setString(2, f.getDescription());
            st.setDouble(3, f.getCalo());
            st.setDouble(4, f.getProteins());
            st.setDouble(5, f.getCarbohydrates());
            st.setDouble(6, f.getFats());
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Food saved successfully.");
            } else {
                System.out.println("Failed to save food.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(FoodDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
    }

    @Override
    public void update(Food f) {
        String sql = "UPDATE [RealClub].[dbo].[Foods] SET [FoodName] = ?, [Description] = ?, [Calo] = ?, [Proteins] = ?, [Carbohydrates] = ?, [Fats] = ? WHERE [FoodID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setString(1, f.getFoodName());
            st.setString(2, f.getDescription());
            st.setDouble(3, f.getCalo());
            st.setDouble(4, f.getProteins());
            st.setDouble(5, f.getCarbohydrates());
            st.setDouble(6, f.getFats());
            st.setInt(7, f.getFoodID());
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Food updated successfully.");
            } else {
                System.out.println("Failed to update food.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(FoodDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM [RealClub].[dbo].[Foods] WHERE [FoodID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, id);
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Food deleted successfully.");
            } else {
                System.out.println("Failed to delete food.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(FoodDAO.class.getName()).log(Level.SEVERE, null, e);
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
