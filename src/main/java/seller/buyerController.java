package seller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class buyerController {
    public boolean registerBuyer(buyerModel buyer) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO buyers (buyer_Name, buyers_UN, buyers_PW, Email, NIC) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, buyer.getName());
            ps.setString(2, buyer.getUsername());
            ps.setString(3, buyer.getPassword());
            ps.setString(4, buyer.getEmail());
            ps.setString(5, buyer.getNic());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public static boolean authenticateBuyer(String username, String password) {
        boolean isValid = false;

        String query = "SELECT * FROM buyers WHERE buyers_UN = ? AND buyers_PW = ?";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, username);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                isValid = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isValid;
    }

	public static int getBuyerIdByUsername(String username) {
        int buyerId = -1; // Default to -1 if not found

        try (Connection con = DBConnection.getConnection()) {
            String query = "SELECT buyer_id FROM buyer WHERE username = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                buyerId = rs.getInt("buyer_id");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return buyerId;
    }}


