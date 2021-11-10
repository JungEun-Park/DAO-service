package com.spring.shop.notice;

import java.util.List;
import java.util.Map;

public interface NoticeMapper {
	//목록
	public abstract List<Map<String, Object>> getNoticeList(Map<String, Object> param);
	public abstract int getListTotalCnt();
	//글작성
	public abstract int noticeInsert(NoticeVO v);
	//글보기
	public abstract NoticeVO noticeDetail(NoticeVO v);
	//글수정
	public abstract int noticeUpdate(NoticeVO v);
	//글삭제
	public abstract int noticeDelete(NoticeVO v);
	
}
