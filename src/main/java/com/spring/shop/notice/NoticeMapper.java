package com.spring.shop.notice;

import java.util.List;
import java.util.Map;

public interface NoticeMapper {
	//���
	public abstract List<Map<String, Object>> getNoticeList(Map<String, Object> param);
	public abstract int getListTotalCnt();
	//���ۼ�
	public abstract int noticeInsert(NoticeVO v);
	//�ۺ���
	public abstract NoticeVO noticeDetail(NoticeVO v);
	//�ۼ���
	public abstract int noticeUpdate(NoticeVO v);
	//�ۻ���
	public abstract int noticeDelete(NoticeVO v);
	
}
