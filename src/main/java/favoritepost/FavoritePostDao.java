package favoritepost;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import post.PostDto;
import user.UserDto;

public class FavoritePostDao {
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
    public FavoritePostDao() {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");
        } catch (Exception e) {
            System.out.println("FavoritePostDao() : " + e);
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
    public void setFavoritePost(FavoritePostDto favoritePostDto) {
        String sql = "insert into tblfavoritepost(favoritepost_id, user_id, post_id, board_id) "
                + "values(seq_favoritepost_id.nextval, ?, ?, ?)";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, favoritePostDto.getUser_id());
            pstmt.setInt(2, favoritePostDto.getPost_id());
            pstmt.setInt(3, favoritePostDto.getBoard_id());
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("setFavoritePost() : " + e);
        } finally {
            freeConnection();
        }
    }

    public Vector<PostDto> getFavoritePostList(String user_id) {
        // Board ID 설정 바꾸기 후기게시판 board_id =2 로 임시지정
        String sql = "SELECT * FROM tblfavoritepost a join tblpost b on a.post_id = b.post_id WHERE a.user_id=? ";
        sql += "ORDER BY b.post_id desc";
        Vector<PostDto> vector = new Vector<PostDto>();
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                PostDto dto = new PostDto();
                dto.setPost_id(rs.getInt("post_id"));
                dto.setUser_id(rs.getString("user_id"));
                dto.setUser_nickname(rs.getString("user_nickname"));
                dto.setPost_title(rs.getString("post_title"));
                dto.setPost_content(rs.getString("post_content"));
                dto.setPost_create_date(rs.getDate("post_create_date"));
                dto.setPost_views(rs.getInt("post_views"));
                vector.add(dto);
            }
        } catch (Exception e) {
            System.out.println("getFavoritePostList() : " + e);
        } finally {
            freeConnection();
        }
        return vector;
    }

}
