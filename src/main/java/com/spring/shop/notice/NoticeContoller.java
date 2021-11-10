package com.spring.shop.notice;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.shop.login.MemberVO;

@Controller
public class NoticeContoller {

	@Autowired
	NoticeDAO nDAO;

	// 목록페이지
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberVO m = (MemberVO) session.getAttribute("loginMember");
		if (m == null) {
			req.setAttribute("Flag", "noticeN");
			req.setAttribute("content", "home/main.jsp");
			return "home";
		}else {
			
			req.setAttribute("content", "notice/noticeMain.jsp");
			return "home";
		}
		
	}

	// 글작성페이지
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String noticeInsert(HttpServletRequest req) {
		req.setAttribute("content", "notice/noticeInsert.jsp");
		return "home";
	}


	// 목록보기
	@RequestMapping(value = "/notice/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> noticeList(HttpServletRequest req) {
		Map<String, Object> rst = nDAO.noticeList(req);
		return rst;

	}

	// 글등록
	@RequestMapping(value = "/noticeInsert", method = RequestMethod.POST)
	public String insert(HttpServletRequest req) {

		int rst = nDAO.noticeInsert(req);
		if (rst >= 1) {
			req.setAttribute("Flag", "insertY");
		} else {
			req.setAttribute("Flag", "insertN");
		}

		req.setAttribute("content", "notice/noticeMain.jsp");
		return "home";

	}

	// 글보기 , 글수정페이지
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(HttpServletRequest req) {
		NoticeVO rst = nDAO.noticeDetail(req);
		
		req.getSession().setAttribute("noticeDetail", rst);

		req.setAttribute("content", "notice/noticeDetail.jsp");
		return "home";
	}

	// 글수정
	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.POST)
	public String update(HttpServletRequest req) {

		NoticeVO rst = nDAO.noticeUpdate(req);
		
		if (rst != null) {
			req.setAttribute("Flag", "modifyY");
			req.getSession().setAttribute("noticeDetail", rst);
		} else {
			req.setAttribute("Flag", "modifyN");

		}

		req.setAttribute("content", "notice/noticeMain.jsp");
		return "home";

	}
	
	// 글삭제
	@RequestMapping(value = "/noticeDelete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> noticedelete(HttpServletRequest req) {
		int rst = nDAO.noticeDelete(req);
		Map<String, Object> result = new HashMap<String, Object>();
		if (rst >= 1) {
			result.put("flag", "Y");
		} else {
			result.put("flag", "N");
		}
		return result;
		
	}
	

}
