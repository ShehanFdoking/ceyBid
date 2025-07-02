package seller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class sellerController {
    public boolean registerSeller(sellerModel seller) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO sellers (seller_Name, seller_UN, seller_PW, Email, NIC) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, seller.getName());
            ps.setString(2, seller.getUsername());
            ps.setString(3, seller.getPassword());
            ps.setString(4, seller.getEmail());
            ps.setString(5, seller.getNic());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public static boolean authenticateSeller(String username, String password) {
        boolean isValid = false;

        String query = "SELECT * FROM sellers WHERE seller_UN = ? AND seller_PW = ?";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, username);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                String status = rs.getString("status");
                if ("active".equals(status)) {
                    isValid = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isValid;
    }

    public static int getSellerIdByUsername(String username) {
        int sellerId = -1; // Default to -1 if not found

        try (Connection con = DBConnection.getConnection()) {
            String query = "SELECT seller_id FROM sellers WHERE seller_UN = ?";
;
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                sellerId = rs.getInt("seller_id");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return sellerId;
    }

}

