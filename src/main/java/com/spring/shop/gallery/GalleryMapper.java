package com.spring.shop.gallery;

import java.util.List;
import java.util.Map;

public interface GalleryMapper {
	//글작성
	public abstract int galleryInsert(GalleryVO v);
	//글목록
	public abstract List<Map<String, Object>> getGalleryList(Map<String, Object> param);
	public abstract int getListTotalCnt();
	//글보기
	public abstract GalleryVO galleryDetail(GalleryVO v);
	//글수정
	public abstract int galleryUpdate(GalleryVO v);
	//글삭제
	public abstract int galleryDelete(GalleryVO v);

}
