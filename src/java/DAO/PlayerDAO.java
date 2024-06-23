package DAO;

import Model.Player;
import Model.PlayerStat;
import Model.TrainingSchedule;
import dal.ConnectDB;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PlayerDAO extends ConnectDB implements DAO<Player> {

    private String sql;
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    public List<Player> getBySearch(String searchValue) {
        String param = "%" + searchValue + "%";
        List<Player> players = new ArrayList<>();
        String sql = "SELECT \n"
                + "    p.[PlayerID], \n"
                + "    p.[UserID], \n"
                + "    p.[Position], \n"
                + "    p.[Name], \n"
                + "    p.[DOB], \n"
                + "    p.[Weight], \n"
                + "    p.[Height], \n"
                + "    u.[Email]\n"
                + "FROM \n"
                + "    [RealClub].[dbo].[Player] p\n"
                + "JOIN \n"
                + "    [RealClub].[dbo].[User] u  \n"
                + "    ON p.[UserID] = u.[UserID]\n"
                + "WHERE \n"
                + "    p.[PlayerID] LIKE ? OR \n"
                + "    p.[UserID] LIKE ? OR \n"
                + "    p.[Position] LIKE ? OR \n"
                + "    p.[Name] LIKE ? OR \n"
                + "    p.[DOB] LIKE ? OR \n"
                + "    p.[Weight] LIKE ? OR \n"
                + "    p.[Height] LIKE ? OR \n"
                + "    u.[Email] LIKE ?;";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            for (int i = 1; i <= 8; i++) {
                st.setString(i, param);
            }
            rs = st.executeQuery();
            while (rs.next()) {
                Player p = new Player();
                p.setPlayerID(rs.getInt("PlayerID"));
                p.setUserID(rs.getInt("UserID"));
                p.setPosition(p.getPosition().valueOf(rs.getString("Position")));
                p.setName(rs.getString("Name"));
                Date sqlDate = rs.getDate("DOB");
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    p.setAge(localDate);
                }
                p.setWeight(rs.getDouble("Weight"));
                p.setHeight(rs.getInt("Height"));
                players.add(p);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return players;
    }

    @Override
    public List<Player> getAll() {
        List<Player> players = new ArrayList<>();
        sql = "SELECT [PlayerID], [UserID], [Position], [Name], [DOB], [Weight], [Height] FROM [RealClub].[dbo].[Player]";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Player p = new Player();
                p.setPlayerID(rs.getInt("PlayerID"));
                p.setUserID(rs.getInt("UserID"));
                p.setPosition(p.getPosition().valueOf(rs.getString("Position")));
                p.setName(rs.getString("Name"));
                Date sqlDate = rs.getDate("DOB");
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    p.setAge(localDate);
                }
                p.setWeight(rs.getDouble("Weight"));
                p.setHeight(rs.getInt("Height"));
                players.add(p);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return players;
    }

    @Override
    public Optional<Player> get(int id) {
        sql = "SELECT [PlayerID], [UserID], [Position], [Name], [DOB], [Weight], [Height] FROM [RealClub].[dbo].[Player] WHERE [PlayerID] = ?";
        Player p = null;
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                p = new Player();
                p.setPlayerID(rs.getInt("PlayerID"));
                p.setUserID(rs.getInt("UserID"));

                p.setPosition(p.getPosition().valueOf(rs.getString("Position")));
                p.setName(rs.getString("Name"));
                Date sqlDate = rs.getDate("DOB");
                if (sqlDate != null) {
                    LocalDate localDate = sqlDate.toLocalDate();
                    p.setAge(localDate);
                }
                p.setWeight(rs.getDouble("Weight"));
                p.setHeight(rs.getInt("Height"));
                return Optional.of(p);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return Optional.empty();
    }

    @Override
    public void save(Player p) {
        sql = "INSERT INTO [RealClub].[dbo].[Player] ([UserID], [Position], [Name], [DOB], [Weight], [Height]) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            if (p.getUserID() != null) {
                st.setInt(1, p.getUserID());
            } else {
                st.setNull(1, java.sql.Types.INTEGER);

            }

            st.setString(2, p.getPosition().toString());
            st.setString(3, p.getName());
            if (p.getAge() != null) {
                st.setDate(4, java.sql.Date.valueOf(p.getAge()));
            } else {
                st.setDate(4, null);
            }
            st.setDouble(5, p.getWeight());
            st.setInt(6, p.getHeight());
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Player saved successfully.");
            } else {
                System.out.println("Failed to save player.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
    }

    @Override
    public void update(Player p) {
        sql = "UPDATE [RealClub].[dbo].[Player] SET [UserID] = ?, [Position] = ?, [Name] = ?, [DOB] = ?, [Weight] = ?, [Height] = ? WHERE [PlayerID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            if (p.getUserID() != null && p.getUserID() != 0) {
                st.setInt(1, p.getUserID());
            } else {
                st.setNull(1, java.sql.Types.INTEGER);

            }
            st.setString(2, p.getPosition().toString());
            st.setString(3, p.getName());
            if (p.getAge() != null) {
                st.setDate(4, java.sql.Date.valueOf(p.getAge()));
            } else {
                st.setDate(4, null);
            }
            st.setDouble(5, p.getWeight());
            st.setInt(6, p.getHeight());
            st.setInt(7, p.getPlayerID());
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Player updated successfully.");
            } else {
                System.out.println("Failed to update player.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
    }

    @Override
    public void delete(int id) {
        sql = "DELETE FROM [RealClub].[dbo].[Player] WHERE [PlayerID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, id);
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Player deleted successfully.");
            } else {
                System.out.println("Failed to delete player.");
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
    }

    public boolean deleteBool(int id) {
        sql = "DELETE FROM [RealClub].[dbo].[Player] WHERE [PlayerID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, id);
            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                return true;
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return false;
    }

    public List<PlayerStat> getPlayerStats(int playerID) {
        List<PlayerStat> stats = new ArrayList<>();
        sql = "SELECT [StatID], [PlayerID], [Date], [GoalsScored], [Assists], [YellowCards], [RedCards] FROM [RealClub].[dbo].[PlayerStat] WHERE [PlayerID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, playerID);
            rs = st.executeQuery();
            while (rs.next()) {
                int statID = rs.getInt("StatID");
                LocalDate date = rs.getDate("Date").toLocalDate();
                int goalsScored = rs.getInt("GoalsScored");
                int assists = rs.getInt("Assists");
                int yellowCards = rs.getInt("YellowCards");
                int redCards = rs.getInt("RedCards");

                // Create a new PlayerStat object using the constructor
                PlayerStat stat = new PlayerStat(statID, date, goalsScored, assists, yellowCards, redCards);
                stats.add(stat);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return stats;
    }

//    public List<MatchSchedule> getMatchSchedules(int playerID) {
//        List<MatchSchedule> schedules = new ArrayList<>();
//        String sql = "SELECT [ScheduleID], [PlayerID], [MatchDate], [Opponent], [Venue] FROM [RealClub].[dbo].[MatchSchedule] WHERE [PlayerID] = ?";
//        try {
//            con = this.openConnection();
//            st = con.prepareStatement(sql);
//            st.setInt(1, playerID);
//            rs = st.executeQuery();
//            while (rs.next()) {
//                int scheduleID = rs.getInt("ScheduleID");
//                int playerIDs = rs.getInt("PlayerID");
//                LocalDate matchDate = rs.getDate("MatchDate").toLocalDate();
//                String opponent = rs.getString("Opponent");
//                String venue = rs.getString("Venue");
//
//                MatchSchedule schedule = new MatchSchedule(scheduleID, matchDate, opponent, venue,playerIDs);
//                schedules.add(schedule);
//            }
//        } catch (SQLException | ClassNotFoundException e) {
//            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, e);
//            // Handle or log the exception here
//        } finally {
//            closeResources();
//        }
//        return schedules;
//    }
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
