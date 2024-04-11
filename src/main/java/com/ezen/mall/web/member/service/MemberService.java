package com.ezen.mall.web.member.service;

import com.ezen.mall.web.member.dao.JdbcMemberDao;
import com.ezen.mall.web.member.dao.MemberDao;
import com.ezen.mall.web.member.dto.Member;

import java.sql.SQLException;

/**
 * 회원 관련한 비즈니스 메소드 정의
 */
public class MemberService {

    private MemberDao memberDao;

    public MemberService() {
        memberDao = new JdbcMemberDao();
    }

    // 회원가입
    public Member registerMember(Member member) throws Exception {
        memberDao.create(member);
        return memberDao.findById(member.getId());
    }

    // 로그인(회원인증)
    public Member login(String id, String passwd) throws SQLException {
        Member loginMember = null;
        boolean isMember = memberDao.findByIdNPasswd(id, passwd);
        if(isMember){
            loginMember = memberDao.findById(id);
        }
        System.out.println(loginMember);
        return  loginMember;
    }
    // 기타 등등

    public static void main(String[] args) throws SQLException {
        MemberService memberService = new MemberService();
        Member loginMember = memberService.login("monday", "1111");
        System.out.println(loginMember);
    }
}
