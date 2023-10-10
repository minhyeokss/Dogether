package place;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PlaceDAO {
    /*
     * Field
     */

    private Connection con;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private DataSource ds;

    /*
     * Constructor
     */

    // Default Constructor
    public PlaceDAO() {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");
        } catch (Exception e) {
            System.out.println("PlaceDAO:" + e);
        }
    }

    /*
     * Method
     */

    // freeConnection
    public void freeConnection() {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // place_cafe_list.jsp
    public List getPlaceList(String p_category) {
        String sql = "select * from tblplace where p_category='" + p_category + "'";
        Vector vector = new Vector();
        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                PlaceBean place = new PlaceBean();
                place.setP_name(rs.getString("p_name"));
                place.setP_category(rs.getString("p_category"));
                place.setP_address(rs.getString("p_address"));
                place.setP_call(rs.getString("p_call"));
                place.setP_id(rs.getInt("P_id"));
                place.setP_score(rs.getInt("P_score"));
                vector.add(place);
            }
        } catch (Exception e) {
            System.out.println("getPlaceList() : " + e);
        } finally {
            freeConnection();
        }
        return vector;
    }
    
    // place_cafe_detail.jsp
    public PlaceBean readPlace(String p_id) {
        String sql = "select * from tblplace where p_id=" + p_id;
        PlaceBean place = new PlaceBean();
        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery(sql);
            
            if (rs.next()) {
                place.setP_name(rs.getString("p_name"));
                place.setP_category(rs.getString("p_category"));
                place.setP_address(rs.getString("p_address"));
                place.setP_call(rs.getString("p_call"));
                place.setP_homepage(rs.getString("p_homepage"));
                place.setP_id(rs.getInt("P_id"));
                place.setP_score(rs.getInt("P_score"));
            }
        } catch (Exception e) {
            System.out.println("readPlace() : " + e);
        } finally {
            freeConnection();
        }
        return place;
    }

}
