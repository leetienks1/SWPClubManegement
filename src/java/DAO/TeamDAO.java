/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.MatchStatistic;
import Model.Team;
import dal.ConnectDB;
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
public class TeamDAO extends ConnectDB implements DAO<Team> {

    private String sql;
    private Connection con;
    private PreparedStatement st;
    private ResultSet rs;

    public List<Team> SearchTeam(String value) {
        String searchValue = "%" + value + "%";
        List<Team> teams = new ArrayList<>();
        sql = "SELECT TOP (1000) [TeamID]\n"
                + "      ,[TeamName]\n"
                + "      ,[flag]"
                + " ,[Stadium]\n"
                + "  FROM [RealClub].[dbo].[Teams]\n"
                + "  WHERE [TeamName] LIKE ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setString(1, searchValue);
            rs = st.executeQuery();
            while (rs.next()) {
                Team t = new Team();
                t.setTeamID(rs.getInt(1));
                t.setTeamName(rs.getString(2));
                t.setFlag(rs.getString(3));
                t.setStadium(rs.getString(4));

                teams.add(t);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(TeamDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return teams;
    }

    @Override
    public List<Team> getAll() {
        List<Team> teams = new ArrayList<>();
        sql = "SELECT TOP (1000) [TeamID]\n"
                + "      ,[TeamName]\n"
                + "      ,[flag]"
                + " ,[Stadium]\n"
                + "  FROM [RealClub].[dbo].[Teams]\n";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Team t = new Team();
                t.setTeamID(rs.getInt(1));
                t.setTeamName(rs.getString(2));
                t.setFlag(rs.getString(3));
                t.setStadium(rs.getString(4));
                teams.add(t);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(TeamDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return teams;
    }

    @Override
    public Optional<Team> get(int id) {
        Optional<Team> team = Optional.empty();
        sql = "SELECT [TeamID], [TeamName],[flag] ,[Stadium]  FROM [RealClub].[dbo].[Teams] WHERE [TeamID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                Team t = new Team();
                t.setTeamID(rs.getInt("TeamID"));
                t.setTeamName(rs.getString("TeamName"));
                t.setFlag(rs.getString("flag"));
                t.setStadium(rs.getString("Stadium"));
                team = Optional.of(t);
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(TeamDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
        return team;
    }

    @Override
    public void save(Team t) {
        String sql = "INSERT INTO [RealClub].[dbo].[Teams] ([TeamName], [flag] ,[Stadium]) VALUES (?, ?,?)";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setString(1, t.getTeamName());
            st.setString(2, t.getFlag());
            st.setString(3, t.getStadium());

            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(TeamDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
    }

    @Override
    public void update(Team t) {
        String sql = "UPDATE [RealClub].[dbo].[Teams] SET [TeamName] = ?, [flag] = ? ,[Stadium]=? WHERE [TeamID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setString(1, t.getTeamName());
            st.setString(2, t.getFlag());
            st.setString(3, t.getStadium());

            st.setInt(4, t.getTeamID());
            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(TeamDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            closeResources();
        }
    }

    @Override
    public void delete(int id) {
        sql = "DELETE FROM [RealClub].[dbo].[Teams] WHERE [TeamID] = ?";
        try {
            con = this.openConnection();
            st = con.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(TeamDAO.class.getName()).log(Level.SEVERE, null, e);
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
