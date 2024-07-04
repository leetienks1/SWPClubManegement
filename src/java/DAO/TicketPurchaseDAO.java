package DAO;

import Model.TicketPurchase;
import exception.DuplicateException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class TicketPurchaseDAO extends ConnectDbDao<TicketPurchase> {
    @Override
    public List<TicketPurchase> getAll() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = this.connectDB.openConnection();
            preparedStatement = connection.prepareStatement("SELECT * FROM TicketPurchase");
            resultSet = preparedStatement.executeQuery();
            List<TicketPurchase> ticketPurchases = new ArrayList<>();
            while (resultSet.next()) {
                TicketPurchase ticketPurchase = new TicketPurchase();
                ticketPurchase.setStatus(resultSet.getInt("status"));
                ticketPurchase.setPurchaseDate(resultSet.getDate("PurchaseDate"));
                ticketPurchase.setTicketID(resultSet.getInt("TicketID"));
                ticketPurchase.setPaymentMethod(resultSet.getString("PaymentMethod"));
                ticketPurchase.setUserId(resultSet.getInt("UserID"));
                ticketPurchase.setPurchaseID(resultSet.getInt("PurchaseID"));
                ticketPurchases.add(ticketPurchase);
            }
            return ticketPurchases;
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            connectDB.closeResources(connection, preparedStatement, resultSet);
        }
        return new ArrayList<>();
    }

    @Override
    public Optional<TicketPurchase> get(int id) {
        return Optional.empty();
    }

    @Override
    public void save(TicketPurchase ticketPurchase) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = this.connectDB.openConnection();
            preparedStatement = connection.prepareStatement("INSERT INTO TicketPurchase(UserId, TicketId, PurchaseDate, status, PaymentMethod) VALUES(?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1, ticketPurchase.getUserId());
            preparedStatement.setInt(2, ticketPurchase.getTicketID());
            preparedStatement.setDate(3, new Date(ticketPurchase.getPurchaseDate().getTime()));
            preparedStatement.setInt(4, ticketPurchase.getStatus());
            preparedStatement.setString(5, ticketPurchase.getPaymentMethod());
            preparedStatement.executeUpdate();
            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    ticketPurchase.setPurchaseID(generatedKeys.getInt(1));
                }
                else {
                    throw new SQLException("Creating user failed, no ID obtained.");
                }
            }
        } catch (Exception ex) {
            if (ex.getMessage().contains("ticket_id_unique")) {
                throw new DuplicateException("Vé này đã được đặt");
            }
           ex.printStackTrace();
        } finally {
            this.connectDB.closeResources(connection, preparedStatement);
        }
    }

    @Override
    public void update(TicketPurchase ticketPurchase) {

    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM TicketPurchase WHERE PurchaseID = ?";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = this.connectDB.openConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            this.connectDB.closeResources(connection, preparedStatement);
        }
    }

    public List<TicketPurchase> getProcessingPurchase() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = this.connectDB.openConnection();
            preparedStatement = connection.prepareStatement("SELECT * FROM TicketPurchase WHERE status = 0");
            resultSet = preparedStatement.executeQuery();
            List<TicketPurchase> ticketPurchases = new ArrayList<>();
            while (resultSet.next()) {
                TicketPurchase ticketPurchase = TicketPurchase.mappingDb(resultSet);
                ticketPurchases.add(ticketPurchase);
            }
            return ticketPurchases;
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            this.connectDB.closeResources(connection, preparedStatement, resultSet);
        }
        return new ArrayList<>();
    }

    public int[] updateBatch(List<TicketPurchase> ticketPurchases) {
        String sql = "UPDATE TicketPurchase SET status = ? WHERE PurchaseID = ?";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = this.connectDB.openConnection();
            preparedStatement = connection.prepareStatement(sql);
            for (TicketPurchase ticketPurchase : ticketPurchases) {
                preparedStatement.setInt(1, ticketPurchase.getStatus());
                preparedStatement.setInt(2, ticketPurchase.getPurchaseID());
                preparedStatement.addBatch();
            }
            return preparedStatement.executeBatch();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            this.connectDB.closeResources(connection, preparedStatement);
        }
        return new int[] {};
    }
    
    public int[] deleteBatch(List<Integer> ids) {
        String sql = "DELETE FROM TicketPurchase WHERE PurchaseID IN ?";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = this.connectDB.openConnection();
            preparedStatement = connection.prepareStatement(sql);
            for (Integer id : ids) {
                preparedStatement.setObject(1, id);
                preparedStatement.addBatch();
            }
            return preparedStatement.executeBatch();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            this.connectDB.closeResources(connection, preparedStatement);
        }
        return new int[] {};
    }
}
