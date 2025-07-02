package adminM;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import seller.DBConnection;

public class SellerController {

    public static List<SellerModel> getAllSellers() {
        List<SellerModel> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM sellers");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SellerModel s = new SellerModel();
                s.setSellerId(rs.getInt("seller_id"));
                s.setSellerName(rs.getString("seller_Name"));
                s.setSellerUN(rs.getString("seller_UN"));
                s.setSellerPW(rs.getString("seller_PW"));
                s.setEmail(rs.getString("Email"));
                s.setNic(rs.getString("NIC"));
                s.setStatus(rs.getString("status"));
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void updateSellerStatus(int sellerId, String status) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("UPDATE sellers SET status=? WHERE seller_id=?");
            ps.setString(1, status);
            ps.setInt(2, sellerId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteSeller(int sellerId) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("DELETE FROM sellers WHERE seller_id=?");
            ps.setInt(1, sellerId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static SellerModel getSellerById(int sellerId) {
        SellerModel s = new SellerModel();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM sellers WHERE seller_id=?");
            ps.setInt(1, sellerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                s.setSellerId(rs.getInt("seller_id"));
                s.setSellerName(rs.getString("seller_Name"));
                s.setSellerUN(rs.getString("seller_UN"));
                s.setSellerPW(rs.getString("seller_PW"));
                s.setEmail(rs.getString("Email"));
                s.setNic(rs.getString("NIC"));
                s.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    public static void updateSeller(SellerModel s) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("UPDATE sellers SET seller_Name=?, seller_UN=?, seller_PW=?, Email=?, NIC=? WHERE seller_id=?");
            ps.setString(1, s.getSellerName());
            ps.setString(2, s.getSellerUN());
            ps.setString(3, s.getSellerPW());
            ps.setString(4, s.getEmail());
            ps.setString(5, s.getNic());
            ps.setInt(6, s.getSellerId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
