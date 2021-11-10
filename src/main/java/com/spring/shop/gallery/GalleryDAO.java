package com.spring.shop.gallery;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@Service
public class GalleryDAO {
	
	@Autowired
	SqlSession ss;
	
	//글작성
	public int galleryInsert(HttpServletRequest req) {
		GalleryVO g = new GalleryVO();
		MultipartRequest mr = null;
		String path = req.getSession().getServletContext().getRealPath("resources/file");
		File f = new File(path);
		if(!f.exists()) { 
						  
			f.mkdirs();  
		}
		try {
			mr = new MultipartRequest(req, path, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			// TODO: handle exception
		}
				
		g.setGi_title(mr.getParameter("title"));
		g.setGi_writer(mr.getParameter("writer"));
		g.setGi_content(mr.getParameter("content"));
		g.setGi_file(mr.getFilesystemName("gi_file")); 
		int rst = ss.getMapper(GalleryMapper.class).galleryInsert(g);
		return rst;	
	}
	
	//글목록
	public Map<String,Object> galleryList(HttpServletRequest req) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		float total = ss.getMapper(GalleryMapper.class).getListTotalCnt();
		
		float pagePerCnt = Integer.parseInt(req.getParameter("pagePerCnt"));
		int curPage = Integer.parseInt(req.getParameter("curPage"));
		
		Map<String, Object> paging = generatePagingParam(total, pagePerCnt, curPage);
		List<Map<String, Object>> rst = ss.getMapper(GalleryMapper.class).getGalleryList(paging);
		
		result.put("list", rst);
		result.put("paging", paging);
		result.put("total", total);
		return result;
	}
	
	//페이징
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
	
	//글상세보기
	public GalleryVO galleryDetail(HttpServletRequest req) {
		GalleryVO g = new GalleryVO();
		g.setGi_no(Integer.parseInt(req.getParameter("gi_no")));
		GalleryVO rst = ss.getMapper(GalleryMapper.class).galleryDetail(g);
		return rst;
	}
		
	//글삭제
	public int galleryDelete(HttpServletRequest req) {
		GalleryVO g = new GalleryVO();
		g.setGi_no(Integer.parseInt(req.getParameter("gi_no")));
		
		int rst = ss.getMapper(GalleryMapper.class).galleryDelete(g);

		return rst;
	}
	//글수정
	public int galleryUpdate(HttpServletRequest req) {
		GalleryVO g = new GalleryVO();
		GalleryVO g2 = new GalleryVO(); // 수정된내용 저장
		MultipartRequest mr = null;
		
		String path = req.getSession().getServletContext().getRealPath("resources/file");
		File f = new File(path);
		if(!f.exists()) {
			f.mkdirs();  
		}
		try {
			mr = new MultipartRequest(req, path, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		g.setGi_no(Integer.parseInt(mr.getParameter("gi_no")));
		g.setGi_title(mr.getParameter("title"));
		g.setGi_content(mr.getParameter("content"));

		g2 = ss.getMapper(GalleryMapper.class).galleryDetail(g);
		g.setGi_file(mr.getFilesystemName("gi_file"));
		if (mr.getFilesystemName("gi_file") != null) {
			File f2 = new File(path + "/" + g2.getGi_file()); // 사진 덮어쓰기
			f2.delete();
		}

		int result = ss.getMapper(GalleryMapper.class).galleryUpdate(g);

		return result;
	}
	
	

}
