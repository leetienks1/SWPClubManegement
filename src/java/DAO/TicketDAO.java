package DAO;

import Model.Ticket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class TicketDAO extends ConnectDbDao<Ticket> {

    @Override
    public List<Ticket> getAll() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = this.connectDB.openConnection();
            preparedStatement = connection.prepareStatement("SELECT * FROM Ticket");
            resultSet = preparedStatement.executeQuery();
            List<Ticket> tickets = new ArrayList<>();
            while (resultSet.next()) {
                Ticket ticket = Ticket.mappingDb(resultSet);
                tickets.add(ticket);
            }
            return tickets;
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            this.connectDB.closeResources(connection);
        }
        return null;
    }

    @Override
    public Optional<Ticket> get(int id) {
        String sql = "SELECT * FROM Ticket WHERE TicketID = ?";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = this.connectDB.openConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                Ticket ticket = Ticket.mappingDb(resultSet);
                return Optional.ofNullable(ticket);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            this.connectDB.closeResources(connection, preparedStatement, resultSet);
        }
        return Optional.empty();
    }

    @Override
    public void save(Ticket ticket) {

    }

    @Override
    public void update(Ticket ticket) {

    }

    @Override
    public void delete(int id) {

    }
}
