package com.spring.shop.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	@Autowired
	MemberDAO mDAO;

	// �α���������
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest req) {
		req.setAttribute("content", "member/login.jsp");
		return "home";
	}

	// ȸ������������
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(HttpServletRequest req) {
		req.setAttribute("content", "member/signup.jsp");
		return "home";
	}

	// ȸ������������
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(HttpServletRequest req) {
		req.setAttribute("content", "member/mypage.jsp");
		return "home";
	}

	// ȸ������ ����������
	@RequestMapping(value = "/mypage/update", method = RequestMethod.GET)
	public String mypageUpdate(HttpServletRequest req) {
		req.setAttribute("content", "member/mypageUpdate.jsp");
		return "home";
	}

	// ȸ������
	@RequestMapping(value = "/signup/insert", method = RequestMethod.POST)
	public String insert(HttpServletRequest req) {

		int rst = mDAO.join(req);
		if (rst >= 1) {
			req.setAttribute("Flag", "joinY");
		} else {
			req.setAttribute("Flag", "joinN");
		}
		req.setAttribute("content", "home/main.jsp");

		return "home";

	}

	// �α���
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String signin(HttpServletRequest req) {
		
		MemberVO rst = mDAO.signin(req);
		if (rst != null) {
			req.setAttribute("Flag", "loginY");
			req.getSession().setAttribute("loginMember", rst); // ���ǿ� vo�� �־��ִ� ��
			req.getSession().setMaxInactiveInterval(300); // 300�� �Ŀ� ���� �ڵ� ����

		}
		req.setAttribute("content", "home/main.jsp");

		return "home";

	}

	// ȸ��������ȸ
	@RequestMapping(value = "/mypage/read", method = RequestMethod.GET)
	public String member(HttpServletRequest req) {
		MemberVO rst = mDAO.member(req);
		req.getSession().setAttribute("loginMember", rst);

		req.setAttribute("content", "member/mypage.jsp");
		return "home";
	}

	// ȸ����������
	@RequestMapping(value = "/mypage/update", method = RequestMethod.POST)
	public String memberUpdate(HttpServletRequest req) {

		MemberVO rst = mDAO.memberUpdate(req);
		if (rst != null) {
			req.setAttribute("Flag", "modifyY");
			req.getSession().setAttribute("loginMember", rst);
		} else {
			req.setAttribute("Flag", "modifyN");
		}

		req.setAttribute("content", "member/mypage.jsp");
		return "home";
	}

	// ȸ��Ż��
	@RequestMapping(value = "/deleteMember", method = RequestMethod.GET)
	public String delete(HttpServletRequest req) {	
		int rst = mDAO.delete(req);
		
		if (rst >= 1) {
			req.setAttribute("Flag", "deleteY");
			req.getSession().invalidate();
		} else {
			req.setAttribute("Flag", "deleteN");
		}
		req.setAttribute("content", "home/main.jsp");

		return "home";
	}

	// �α׾ƿ�
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {

		req.getSession().invalidate();
		req.setAttribute("Flag", "logout");
		req.setAttribute("content", "home/main.jsp");
		return "home";

//		���������ϴ� ���
//		1) req.getSession().invalidate();
//		2) req.getSession().setAttribute("loginMember", null);
	}

}
