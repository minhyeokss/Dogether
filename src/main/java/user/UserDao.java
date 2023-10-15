package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDao {
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
    public UserDao() {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");
        } catch (Exception e) {
            System.out.println("UserDao() : " + e);
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

    // signUpProc.jsp
    public void insertUser(UserDto userDto) {
        String sql = "insert into tbluser (user_id, user_grade, user_name, user_nickname,"
                + "user_pw, user_gender, user_email, user_regdate) "
                + "values(?, ?, ?, ?, ?, ?, ?, sysdate)";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userDto.getUser_id());
            pstmt.setInt(2, userDto.getUser_grade());
            pstmt.setString(3, userDto.getUser_name());
            pstmt.setString(4, userDto.getUser_nickname());
            pstmt.setString(5, userDto.getUser_pw());
            pstmt.setString(6, userDto.getUser_gender());
            pstmt.setString(7, userDto.getUser_email());
            // pstmt.setDate(8, stringToDate(user));
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("insertUser() : " + e);
        } finally {
            freeConnection();
        }
    }

    // loginProc.jsp
    public int loginCheck(String user_id, String user_pw) {
        String sql = "select user_pw from tbluser where user_id=?";
        String dbPW = "";
        int x;
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();
            if (rs.next()) { // 입력한 아이디에 해당하는 비밀번호가 있을 경우
                dbPW = rs.getString("user_pw");
                if (dbPW.equals(user_pw)) {// 비밀번호 비교
                    x = 1; // 같으면 인증 성공
                } else {
                    x = 0; // 비밀번호가 다른 경우
                }
            } else {
                x = -1; // 해당 아이디가 없는 경우
            }
        } catch (Exception e) {
            System.out.println("loginCheck() : " + e);
            return -2; // 예외 발생
        } finally {
            freeConnection();
        }
        return x;
    }

    // 회원 정보 가져오기
    public UserDto getUser(String user_id) {
        String sql = "SELECT * FROM tbluser WHERE user_id = ?";
        UserDto userDto = new UserDto();
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                userDto.setUser_id(rs.getString("user_id"));
                userDto.setUser_pw(rs.getString("user_pw"));
                userDto.setUser_name(rs.getString("user_name"));
                userDto.setUser_nickname(rs.getString("user_nickname"));
                userDto.setUser_gender(rs.getString("user_gender"));
                userDto.setUser_email(rs.getString("user_email"));
                userDto.setUser_grade(rs.getInt("user_grade"));
                userDto.setUser_nickname(rs.getString("user_nickname"));
            }
        } catch (Exception e) {
            System.out.println("getUser() : " + e);
        } finally {
            freeConnection();
        }
        return userDto;
    }

    // changePwProc.jsp
    public void updatePw(String user_id, String newUser_pw) {
        String sql = "UPDATE tbluser SET user_pw = ? WHERE user_id = ?";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newUser_pw);
            pstmt.setString(2, user_id);
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("updatePw() : " + e);
        } finally {
            freeConnection();
        }
    }

    public int deleteUser(String user_id, String user_pw) {
        String dbPW = "";
        int x = 0;
        String sql1 = "SELECT user_pw FROM tbluser WHERE user_id = ?";
        String sql2 = "DELETE FROM tbluser WHERE user_id=?";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql1);
            pstmt.setString(1, user_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                dbPW = rs.getString("user_pw");
                if (dbPW.equals(user_pw)) { // 비밀번호 비교
                    // 같을 경우 회원삭제 진행
                    pstmt = conn.prepareStatement(sql2);
                    pstmt.setString(1, user_id);
                    pstmt.executeUpdate();
                    x = 1; // 삭제 성공
                } else {
                    x = 0; // 비밀번호가 다른 경우
                }
            } else {
                x = -1; // 해당 아이디가 없는 경우
            }
        } catch (Exception e) {
            System.out.println("deleteUser() : " + e);
            return -2; // 예외 발생
        } finally {
            freeConnection();
        }
        return x;
    }

}
