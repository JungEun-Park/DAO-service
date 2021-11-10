package com.spring.shop.login;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.net.httpserver.Authenticator.Result;

@Service
public class MemberDAO {
	@Autowired
	SqlSession ss;
	
	//회원가입
	public int join(HttpServletRequest req) {
		MemberVO m = new MemberVO();
		m.setMi_id(req.getParameter("id"));
		m.setMi_name(req.getParameter("name"));
		m.setMi_pw(req.getParameter("password"));
		m.setMi_addr(req.getParameter("addr"));
		int rst = ss.getMapper(MemberMapper.class).join(m); //db랑 통신
		return rst;
	}
	
	//로그인
	public MemberVO signin(HttpServletRequest req) {
		MemberVO m = new MemberVO();
		m.setMi_id(req.getParameter("id"));
		m.setMi_pw(req.getParameter("pw"));
		MemberVO rst = ss.getMapper(MemberMapper.class).signin(m);
		return rst;
	}
	
	//회원정보보기
	public MemberVO member(HttpServletRequest req) {
		MemberVO m = new MemberVO();
		MemberVO rst = ss.getMapper(MemberMapper.class).member(m);
		return rst;

	}
	
	//회원정보수정
	public MemberVO memberUpdate(HttpServletRequest req) {
		MemberVO m = new MemberVO();
		MemberVO m2 = new MemberVO();
		m.setMi_id(req.getParameter("id"));
		m.setMi_name(req.getParameter("name"));
		m.setMi_pw(req.getParameter("password"));
		m.setMi_addr(req.getParameter("addr"));
		int rst = ss.getMapper(MemberMapper.class).memberUpdate(m);
		if(rst >= 1) {
			m2 = ss.getMapper(MemberMapper.class).member(m);
		}else {
			m2 = null;
		}
		return m2;

	}
	
	//회원탈퇴
	public int delete(HttpServletRequest req) {
		MemberVO m = new MemberVO();
		m.setMi_id(req.getParameter("mi_id"));
		
		int rst = ss.getMapper(MemberMapper.class).deleteMember(m);
		return rst;
	}
}
