package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import place.PlaceBean;

public class ReviewDAO {
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
    public ReviewDAO() {
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
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public Vector getReviewList(int place_id) {
        String sql = "select * from tblreview where place_id='" + place_id + "'";
        Vector vector = new Vector();
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                ReviewBean review = new ReviewBean();
                review.setReview_id(rs.getInt("review_id"));
                review.setReview_title(rs.getString("review_title"));
                review.setReview_content(rs.getString("review_content"));
                review.setReview_regdate(rs.getDate("review_regdate"));
                review.setUser_id(rs.getString("user_id"));
                review.setReview_starRating(rs.getInt("review_starRating"));
                vector.add(review);
            }
        } catch (Exception e) {
            System.out.println("getPlaceList() : " + e);
        } finally {
            freeConnection();
        }
        return vector;
    }
}
