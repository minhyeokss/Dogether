package favorite_post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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

    public int getMaxNum() {
        int maxNum = 0;
        String sql = "select nvl(max(num), 0) from imageTest";;
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                maxNum = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("getMaxNum() : " + e);
        } finally {
            freeConnection();
        }
        return maxNum;
    }

    public void insertData(FavoritePostDto favoritePostDto) {
        String sql = "insert into imageTest (num, subject, saveFileName) values (?, ?, ?)";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, favoritePostDto.getNum());
            pstmt.setString(2, favoritePostDto.getSubject());
            pstmt.setString(3, favoritePostDto.getSaveFileName());
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("insertData() : " + e);
        } finally {
            freeConnection();
        }
    }

    // 파일데이터 전체조회
    public List<FavoritePostDto> getList(int start, int end) {
        List<FavoritePostDto> lists = new ArrayList<FavoritePostDto>();
        String sql = "select * from (select rownum rnum, num, subject, saveFileName ";
        sql += "from imageTest order by num desc) ";
        sql += "where rnum >= ? and rnum <= ?";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, start);
            pstmt.setInt(2, end);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                FavoritePostDto favoritePostDto = new FavoritePostDto();
                favoritePostDto.setNum(rs.getInt("num"));
                favoritePostDto.setSubject(rs.getString("subject"));
                favoritePostDto.setSaveFileName(rs.getString("saveFileName"));
                lists.add(favoritePostDto);
            }
        } catch (Exception e) {
            System.out.println("getList() : " + e);
        } finally {
            freeConnection();
        }
        return lists;
    }

    // 특정 데이터 조회
    public FavoritePostDto getReadData(int num) {
        FavoritePostDto favoritePostDto = new FavoritePostDto();
        String sql = "select num, subject, saveFileName from imageTest where num = ? ";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                favoritePostDto.setNum(rs.getInt("num"));
                favoritePostDto.setSubject(rs.getString("subject"));
                favoritePostDto.setSaveFileName(rs.getString("saveFileName"));
            }
        } catch (Exception e) {
            System.out.println("getReadData() : " + e);
        } finally {
            freeConnection();
        }
        return favoritePostDto;
    }

    // 파일데이터 삭제
    public void deleteData(int num) {
        String sql = "delete imageTest where num = ?";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("deleteData() : " + e);
        } finally {
            freeConnection();
        }
    }

    public int getDataCount() {
        int totalDataCount = 0;
        String sql = "select nvl(count(*), 0) from imageTest";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                totalDataCount = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("getDataCount() : " + e);
        } finally {
            freeConnection();
        }
        return totalDataCount;
    }

}
