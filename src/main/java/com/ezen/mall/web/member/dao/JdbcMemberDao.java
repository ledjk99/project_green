package com.ezen.mall.web.member.dao;


import com.ezen.mall.domain.common.database.ConnectionFactory;
import com.ezen.mall.web.member.dto.Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 회원 관련 관계형 Database 전담 처리 클래스
 */
public class JdbcMemberDao implements MemberDao{

    private ConnectionFactory connectionFactory;

    public JdbcMemberDao(){
        connectionFactory = ConnectionFactory.getInstance();
    }

    // 회원 테이블에 회원정보 입력
    public void create(Member member) throws Exception{
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO members (member_id, passwd, name, email, phone)")
                .append(" VALUES (?, ?, ?, ?, ?)");
        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPasswd());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getEmail());
            pstmt.setString(5, member.getPhone());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                if(pstmt != null) pstmt.close();
                if(con !=  null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    // 회원아이디를 전달받아 회원 상세정보를 반환
    public Member findById(String id) throws SQLException {
        Member member = null;
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT member_id, name, email, phone, TO_CHAR(regdate,'yyyy-MM-DD HH24:MI:SS') regdate")
                .append(" FROM members")
                .append(" WHERE member_id = ?");
        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            while(rs.next()){
                member = new Member();
                member.setId(rs.getString("member_id"));
                member.setName(rs.getString("name"));
                member.setEmail(rs.getString("email"));
                member.setPhone(rs.getString("phone"));
                member.setRegdate(rs.getString("regdate"));

            }
        } finally {
            try {
                if(rs != null)    rs.close();
                if(pstmt != null) pstmt.close();
                if(con !=  null)  con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return  member;
    }

    // 회원아이디와 비밀번호 전달받아 인증 결과 반환
    public boolean findByIdNPasswd(String id, String passwd) throws SQLException {
        boolean isMember = false;
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT member_id, name, email")
                .append(" FROM members")
                .append(" WHERE member_id = ? AND passwd = ?");
        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, id);
            pstmt.setString(2, passwd);
            rs = pstmt.executeQuery();
            isMember = rs.next();
        } finally {
            try {
                if(rs != null)    rs.close();
                if(pstmt != null) pstmt.close();
                if(con !=  null)  con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return  isMember;
    }

    @Override
    public List<Member> findByAll() throws SQLException {
        List<Member> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT member_id, name, email, phone, TO_CHAR(regdate, 'yyyy-MM-DD HH24:MI:SS') regdate")
                .append(" FROM members");
        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            while(rs.next()){
                Member member = new Member();
                member.setId(rs.getString("member_id"));
                member.setName(rs.getString("name"));
                member.setEmail(rs.getString("email"));
                member.setPhone(rs.getString("phone"));
                member.setRegdate(rs.getString("regdate"));
                list.add(member);
            }
        } finally {
            try {
                if(rs != null)    rs.close();
                if(pstmt != null) pstmt.close();
                if(con !=  null)  con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return  list;
    }

    public static void main(String[] args) throws Exception {


        MemberDao memberDao = new JdbcMemberDao();
        boolean isMember = memberDao.findByIdNPasswd("monday", "1111");
//        System.out.println(isMember);



//        MemberDao memberDao = new JdbcMemberDao();
//        boolean isMember = memberDao.findByIdNPasswd("monday", "1111");
//        System.out.println(isMember);
//
//        List<Member> list = memberDao.findByAll();
//        for (Member member : list) {
//            System.out.println(member);
//        }
    }

}
