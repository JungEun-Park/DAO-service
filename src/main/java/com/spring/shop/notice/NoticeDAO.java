package com.spring.shop.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shop.login.MemberMapper;

@Service
public class NoticeDAO {

	@Autowired
	SqlSession ss;

	// 목록보기
	public Map<String, Object> noticeList(HttpServletRequest req) {
		Map<String, Object> result = new HashMap<String, Object>();
		float total = ss.getMapper(NoticeMapper.class).getListTotalCnt();
		float pagePerCnt = Integer.parseInt(req.getParameter("pagePerCnt"));
		int curPage = Integer.parseInt(req.getParameter("curPage"));
		Map<String, Object> paging = generatePagingParam(total, pagePerCnt, curPage);
		List<Map<String, Object>> rst = ss.getMapper(NoticeMapper.class).getNoticeList(paging);
		
		result.put("list", rst);
		result.put("paging", paging);
		result.put("total", total);
		return result;
	}
	// 페이징
	public Map<String, Object> generatePagingParam(float totalCnt, float pagePerCnt, int curPage) {
		Map<String, Object> pageValue = new HashMap<String, Object>();
		int pageCount = (int) Math.ceil(totalCnt / pagePerCnt);
		pageValue.put("S_OFFSET", pagePerCnt * (curPage - 1));
		pageValue.put("E_OFFSET", pagePerCnt * (curPage - 1) + pagePerCnt);
		pageValue.put("CUR_PAGE", curPage);
		pageValue.put("PAGE_CNT", pageCount);
		pageValue.put("TOTAL_CNT", totalCnt);

		return pageValue;
	}
	// 글작성
	public int noticeInsert(HttpServletRequest req) {
		NoticeVO n = new NoticeVO();
		n.setB_title(req.getParameter("title"));
		n.setB_writer(req.getParameter("writer"));
		n.setB_content(req.getParameter("content"));
		int rst = ss.getMapper(NoticeMapper.class).noticeInsert(n);
		return rst;
	}
	
	// 글상세보기
	public NoticeVO noticeDetail(HttpServletRequest req) {
		NoticeVO n = new NoticeVO();
		n.setB_num(Integer.parseInt(req.getParameter("b_num")));
		NoticeVO rst = ss.getMapper(NoticeMapper.class).noticeDetail(n);
		return rst;
	}
	
	// 글수정
	public NoticeVO noticeUpdate(HttpServletRequest req) {
		NoticeVO n = new NoticeVO();
		NoticeVO n2 = new NoticeVO(); // 수정한거 저장할 곳
		n.setB_num(Integer.parseInt(req.getParameter("b_num")));
		n.setB_title(req.getParameter("title"));
		n.setB_content(req.getParameter("content"));

		int rst = ss.getMapper(NoticeMapper.class).noticeUpdate(n);
		if(rst >= 1 ) {
			n2 = ss.getMapper(NoticeMapper.class).noticeDetail(n);
		}else {
			n2 = null;
		}
		
		return n2;
		
	}
	
	// 글삭제
	public int noticeDelete(HttpServletRequest req) {
		NoticeVO n = new NoticeVO();
		n.setB_num(Integer.parseInt(req.getParameter("b_num")));
		
		int rst = ss.getMapper(NoticeMapper.class).noticeDelete(n);
		return rst;
		
		
	}
	



}
