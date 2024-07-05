/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Coach;
import Model.ExpectedLineups;
import Model.Position;
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
public class ExpectedLineupDAO extends dal.ConnectDB implements DAO<ExpectedLineups> {

    private String sql;
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;
    
    
    public List<ExpectedLineups> getAllLineupByMatchID( int id) {
        List<ExpectedLineups> listSquad = new ArrayList<>();
        sql = "SELECT TOP (1000) [LineupID], [MatchID], [PlayerID], [LineupName], [Position], [XLocation], [YLocation] FROM [RealClub].[dbo].[ExpectedLineups] where [MatchID] = ? ";

        try {
            con = openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            while (rs.next()) {
                ExpectedLineups lineup = new ExpectedLineups();
                lineup.setLineupID(rs.getInt("LineupID"));
                lineup.setMatchID(rs.getInt("MatchID"));
                lineup.setPlayerID(rs.getInt("PlayerID"));
                lineup.setLineupName(rs.getString("LineupName"));
                lineup.setPosition(Position.valueOf(rs.getString("Position").trim()));
                lineup.setxLocation(rs.getFloat("XLocation"));
                lineup.setyLocation(rs.getFloat("YLocation"));

                listSquad.add(lineup);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(ExpectedLineupDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return listSquad;
    }
    @Override
    public List<ExpectedLineups> getAll() {
        List<ExpectedLineups> listSquad = new ArrayList<>();
        sql = "SELECT TOP (1000) [LineupID], [MatchID], [PlayerID], [LineupName], [Position], [XLocation], [YLocation] FROM [RealClub].[dbo].[ExpectedLineups]";

        try {
            con = openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                ExpectedLineups lineup = new ExpectedLineups();
                lineup.setLineupID(rs.getInt("LineupID"));
                lineup.setMatchID(rs.getInt("MatchID"));
                lineup.setPlayerID(rs.getInt("PlayerID"));
                lineup.setLineupName(rs.getString("LineupName"));
                lineup.setPosition(Position.valueOf(rs.getString("Position").trim()));
                lineup.setxLocation(rs.getFloat("XLocation"));
                lineup.setyLocation(rs.getFloat("YLocation"));

                listSquad.add(lineup);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(ExpectedLineupDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return listSquad;
    }

    public List<ExpectedLineups> getAllNotDuplicate() {
        List<ExpectedLineups> listSquad = new ArrayList<>();
        sql = "SELECT [LineupID]\n"
                + "    ,[MatchID]\n"
                + "    ,[PlayerID]\n"
                + "    ,[LineupName]\n"
                + "    ,[Position]\n"
                + "    ,[XLocation]\n"
                + "    ,[YLocation]\n"
                + "FROM (\n"
                + "    SELECT \n"
                + "        [LineupID]\n"
                + "        ,[MatchID]\n"
                + "        ,[PlayerID]\n"
                + "        ,[LineupName]\n"
                + "        ,[Position]\n"
                + "        ,[XLocation]\n"
                + "        ,[YLocation],\n"
                + "        ROW_NUMBER() OVER(PARTITION BY [MatchID] ORDER BY [LineupID]) AS RowNumber\n"
                + "    FROM [RealClub].[dbo].[ExpectedLineups]\n"
                + ") AS SubQuery\n"
                + "WHERE RowNumber = 1;";

        try {
            con = openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                ExpectedLineups lineup = new ExpectedLineups();
                lineup.setLineupID(rs.getInt("LineupID"));
                lineup.setMatchID(rs.getInt("MatchID"));
                lineup.setPlayerID(rs.getInt("PlayerID"));
                lineup.setLineupName(rs.getString("LineupName"));
                lineup.setPosition(Position.valueOf(rs.getString("Position").trim()));
                lineup.setxLocation(rs.getFloat("XLocation"));
                lineup.setyLocation(rs.getFloat("YLocation"));

                listSquad.add(lineup);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(ExpectedLineupDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return listSquad;
    }

    @Override
    public Optional<ExpectedLineups> get(int id) {
        ExpectedLineups lineup = null;
        sql = "SELECT [LineupID], [MatchID], [PlayerID], [LineupName], [Position], [XLocation], [YLocation] FROM [RealClub].[dbo].[ExpectedLineups] WHERE [LineupID] = ?";

        try {
            con = openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                lineup = new ExpectedLineups();
                lineup.setLineupID(rs.getInt("LineupID"));
                lineup.setMatchID(rs.getInt("MatchID"));
                lineup.setPlayerID(rs.getInt("PlayerID"));
                lineup.setLineupName(rs.getString("LineupName"));
                lineup.setPosition(Position.valueOf(rs.getString("Position")));
                lineup.setxLocation(rs.getFloat("XLocation"));
                lineup.setyLocation(rs.getFloat("YLocation"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(ExpectedLineupDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return Optional.ofNullable(lineup);
    }

    @Override
    public void save(ExpectedLineups lineup) {
        sql = "INSERT INTO [RealClub].[dbo].[ExpectedLineups] ([MatchID], [PlayerID], [LineupName], [Position], [XLocation], [YLocation]) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            con = openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, lineup.getMatchID());
            st.setInt(2, lineup.getPlayerID());
            st.setString(3, lineup.getLineupName());
            st.setString(4, lineup.getPosition().name());
            st.setFloat(5, (float) lineup.getxLocation());
            st.setFloat(6, (float) lineup.getyLocation());

            int rowsInserted = st.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new lineup was inserted successfully!");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(ExpectedLineupDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
    }

    @Override
    public void update(ExpectedLineups lineup) {
        sql = "UPDATE [RealClub].[dbo].[ExpectedLineups] SET [MatchID] = ?, [PlayerID] = ?, [LineupName] = ?, [Position] = ?, [XLocation] = ?, [YLocation] = ? WHERE [LineupID] = ?";

        try {
            con = openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, lineup.getMatchID());
            st.setInt(2, lineup.getPlayerID());
            st.setString(3, lineup.getLineupName());
            st.setString(4, lineup.getPosition().name());
            st.setFloat(5, (float) lineup.getxLocation());
            st.setFloat(6, (float) lineup.getyLocation());
            st.setInt(7, lineup.getLineupID());

            int rowsUpdated = st.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Lineup with ID " + lineup.getLineupID() + " was updated successfully!");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(ExpectedLineupDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
    }

    @Override
    public void delete(int id) {
        sql = "DELETE FROM [RealClub].[dbo].[ExpectedLineups] WHERE [LineupID] = ?";

        try {
            con = openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, id);

            int rowsDeleted = st.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("Lineup with ID " + id + " was deleted successfully!");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(ExpectedLineupDAO.class.getName()).log(Level.SEVERE, null, e);
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
