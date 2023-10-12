package post;

import java.sql.*;
import java.util.List;
import java.util.Vector;

import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class PostDao {
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
    public PostDao() {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");

        } catch (Exception e) {
            System.out.println("BoardDao() : " + e);
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

    // list.jsp, 검색기능
    public List getPostList(String option, String searchWord) {
        // Board ID 설정 바꾸기 후기게시판 board_id =2 로 임시지정
        String sql = "SELECT post_id, user_id, user_nickname, post_title, "
                + "post_content, post_create_date, post_update_date, post_views "
                + "FROM post WHERE board_id=2 ";
        if (searchWord == null || searchWord.isEmpty()) {
            sql = sql + "ORDER BY post_id";
        } else {
            switch (option) {
                case "title":
                    sql = sql + "AND post_title Like '%" + searchWord + "%' ORDER BY post_id";
                    break;
                case "content":
                    sql = sql + "AND post_content Like '%" + searchWord + "%' ORDER BY post_id";
                    break;
                case "title+content":
                    sql = sql + "AND post_title Like '%" + searchWord
                            + "%' AND post_content Like '%" + searchWord + "%' ORDER BY post_id";
                    break;
                case "nickname":
                    sql = sql + "AND user_nickname Like '%" + searchWord + "%' ORDER BY post_id";
                    break;
            }
        }
        Vector vector = new Vector();
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
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
            System.out.println("getPostList() : " + e);
        } finally {
            freeConnection();
        }
        return vector;
    }
	
	// detail.jsp, update.jsp
	public PostDto getPost(PostDto postDto) {
		String sql = "select * from post where board_id=2 and post_id=?";
		PostDto detailDto = new PostDto();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postDto.getPost_id());
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
					
				detailDto.setPost_id(postDto.getPost_id());
				detailDto.setPost_title(rs.getString("post_title"));
				detailDto.setPost_views(rs.getInt("post_views"));
				detailDto.setUser_id(rs.getString("user_id"));
				detailDto.setUser_nickname(rs.getString("user_nickname"));
				detailDto.setPost_create_date(rs.getDate("post_create_date"));
				detailDto.setPost_content(rs.getString("post_content"));
					
			}
		} catch (SQLException e) {
			System.out.println("getReviewDetail: " + e);
		} finally {
			freeConnection();
		}
		return detailDto;
	}
	
	
	// postproc.jsp
	public void setReviewPost(PostDto dto) {
		String sql = "insert into post(post_id, board_id, user_id, user_nickname, post_title, post_content) "
				+ "values(post_id_seq.nextval, 2, ?, ?, ?, ?)"; //date 및 views는 db에서 default값으로 설정
			
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getUser_nickname());
			pstmt.setString(3, dto.getPost_title());
			pstmt.setString(4, dto.getPost_content());
			pstmt.executeUpdate();
				
		} catch (Exception e) {
			System.out.println("setReviewPost: " + e);
		} finally {
			freeConnection();
		}
	}
	
	// updateproc.jsp
	public void setReviewUpdate(PostDto dto) {
		// 수정하기 버튼이 자기 글에서만 뜨게 수정 후 다시보기
		String sql = "UPDATE post SET post_title=?, post_content=?, post_update_date=sysdate WHERE post_id=?"; 
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPost_title());
			pstmt.setString(2, dto.getPost_content());
			pstmt.setInt(3, dto.getPost_id());
			pstmt.executeUpdate();
					
		} catch (Exception e) {
			System.out.println("setReviewUpdate: " + e);
		} finally {
			freeConnection();
		}
	}
	
	// delete.jsp
	public void setReviewDelete(PostDto dto) {
		// 삭제하기 버튼이 자기 글에서만 뜨게 수정 후 다시보기
		String sql = "DELETE FROM post WHERE board_id=2 and post_id=?"; 
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getPost_id());
			pstmt.executeUpdate();
				
		} catch (Exception e) {
			System.out.println("setReviewDelete: " + e);
		} finally {
			freeConnection();
		}
	}
	
}