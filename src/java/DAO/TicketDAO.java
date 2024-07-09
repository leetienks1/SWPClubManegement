package DAO;

import Model.Ticket;
import dto.ExecutionDatabaseResult;
import org.apache.commons.collections4.CollectionUtils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class TicketDAO extends ConnectDbDao<Ticket> {

    @Override
    public List<Ticket> getAll() {
        return this.query(
                "SELECT * FROM Ticket",
                Ticket::mappingDb
        );
    }

    @Override
    public Optional<Ticket> get(int id) {
        return this.queryOne(
                "SELECT * FROM Ticket WHERE TicketID = ?",
                Ticket::mappingDb,
                id
        );
    }

    @Override
    public void save(Ticket ticket) {
        this.execute(
                "INSERT INTO Ticket (MatchID, SeatNumber, Price) VALUES (?, ?, ?)",
                ticket.getMatchId(),
                ticket.getSeatNumber(),
                ticket.getPrice()
        );
    }

    @Override
    public void update(Ticket ticket) {
        this.execute(
                "UPDATE Ticket SET MatchID = ?, SeatNumber = ?, Price = ? WHERE TicketID = ?",
                ticket.getMatchId(),
                ticket.getSeatNumber(),
                ticket.getPrice(),
                ticket.getTicketId()
        );
    }

    @Override
    public void delete(int id) {
      this.execute(
        "DELETE FROM Ticket WHERE TicketID = ?",
        id
    );
    }

    @Override
    public List<Ticket> getByIds(Collection<? extends Number> ids) {
        if (CollectionUtils.isEmpty(ids)) {
            return new ArrayList<>();
        }

        final String condition = ids.stream().map(x -> "?").collect(Collectors.joining(", "));

        return this.query(
                String.format(
                        "SELECT * FROM Ticket WHERE TicketID IN (%s)",
                        condition
                ),
                Ticket::mappingDb,
                ids.toArray()
        );

    }
}
