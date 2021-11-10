package com.spring.shop.gallery;

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
public class GalleryController {
	
	@Autowired
	GalleryDAO gDAO;
	
	// 목록페이지
	@RequestMapping(value = "/gallery", method = RequestMethod.GET)
	public String gallery(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberVO m = (MemberVO) session.getAttribute("loginMember");
		if (m == null) {
			req.setAttribute("Flag", "galleryN");
			req.setAttribute("content", "home/main.jsp");
			return "home";
		}else {
			req.setAttribute("content", "gallery/galleryMain.jsp");			
			return "home";
		}
		
	}
	
	// 글작성페이지
	@RequestMapping(value = "/gallery/insert", method = RequestMethod.GET)
	public String galleryInsert(HttpServletRequest req) {
		req.setAttribute("content", "gallery/galleryInsert.jsp");
		return "home";
	}
	
	// 글상세페이지
	@RequestMapping(value = "/gallery/detail", method = RequestMethod.GET)
	public String galleryDetail(HttpServletRequest req) {
		req.setAttribute("content", "gallery/galleryDetail.jsp");
		return "home";
	}
	
	// 글등록
	@RequestMapping(value = "/galleryInsert", method = RequestMethod.POST)
	public String insert(HttpServletRequest req) {
		
		
		int rst = gDAO.galleryInsert(req);
		if (rst >= 1) {
			req.setAttribute("Flag", "insertY");
		} else {
			req.setAttribute("Flag", "insertN");
		}
		req.setAttribute("content", "gallery/galleryMain.jsp");
		return "home";

	}
	
	// 글목록
	@RequestMapping(value = "/galleryList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> galleryList(HttpServletRequest req) {
		Map<String, Object> rst = gDAO.galleryList(req);
		
		return rst;
	}
	
	// 글상세보기
	@RequestMapping(value = "/galleryDetail", method = RequestMethod.GET)
	public String detail(HttpServletRequest req) {
		GalleryVO rst = gDAO.galleryDetail(req);
		
		req.getSession().setAttribute("galleryDetail", rst);
		req.setAttribute("content", "gallery/galleryDetail.jsp");
		return "home";
	}
	
	// 글삭제
	@RequestMapping(value = "/galleryDelete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> gallerydelete(HttpServletRequest req) {
		int rst = gDAO.galleryDelete(req);
		Map<String, Object> result = new HashMap<String, Object>();
		if (rst >= 1) {
			result.put("Flag", "Y");
		} else {
			result.put("Flag", "N");
		}
		return result;
	}
	
	// 글수정
	@RequestMapping(value = "/galleryUpdate", method = RequestMethod.POST)
	public String galleryupdate(HttpServletRequest req) {
		int rst = gDAO.galleryUpdate(req);
		
		if (rst >= 1) {
			req.setAttribute("Flag", "modifyY");
			req.getSession().setAttribute("galleryDetail", rst);
			
		}else {
			req.setAttribute("Flag", "modifyN");
		}
		
		req.setAttribute("content", "gallery/galleryMain.jsp");
		return "home";
	}
	
	
}
