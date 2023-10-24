package favoriteplace;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import place.PlaceDto;
import post.PostDto;

public class FavoritePlaceDao {
    /*
     * Field
     */

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private DataSource ds;

    /*
     * Constructor
     */

    // Default Constructor
    public FavoritePlaceDao() {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");
        } catch (Exception e) {
            System.out.println("FavoritePlaceDao() : " + e);
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
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // favorite_post_proc.jsp
    public void setFavoritePlace(FavoritePlaceDto favoritePlaceDto) {
        String sql = "insert into tblfavoriteplace(favoriteplace_id, user_id, place_id) "
                + "values(seq_favoriteplace_id.nextval, ?, ?)";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, favoritePlaceDto.getUser_id());
            pstmt.setInt(2, favoritePlaceDto.getPlace_id());
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("setFavoritePlace() : " + e);
        } finally {
            freeConnection();
        }
    }

    public Vector<PlaceDto> getFavoritePlaceList(String user_id) {
        String sql =
                "SELECT * FROM tblfavoriteplace a join tblplace b on a.place_id = b.place_id WHERE a.user_id=? ";
        sql += "ORDER BY b.place_id desc";
        Vector<PlaceDto> vector = new Vector<PlaceDto>();
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                PlaceDto placeDto = new PlaceDto();
                placeDto.setPlace_id(rs.getInt("place_id"));
                placeDto.setPlace_category(rs.getString("place_category"));
                placeDto.setPlace_name(rs.getString("place_name"));
                placeDto.setPlace_address(rs.getString("place_address"));
                placeDto.setPlace_homepage(rs.getString("place_homepage"));
                placeDto.setPlace_likes(rs.getInt("place_likes"));
                vector.add(placeDto);
            }
        } catch (Exception e) {
            System.out.println("getFavoritePlaceList() : " + e);
        } finally {
            freeConnection();
        }
        return vector;
    }

}
