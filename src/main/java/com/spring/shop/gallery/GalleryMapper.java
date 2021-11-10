package com.spring.shop.gallery;

import java.util.List;
import java.util.Map;

public interface GalleryMapper {
	//���ۼ�
	public abstract int galleryInsert(GalleryVO v);
	//�۸��
	public abstract List<Map<String, Object>> getGalleryList(Map<String, Object> param);
	public abstract int getListTotalCnt();
	//�ۺ���
	public abstract GalleryVO galleryDetail(GalleryVO v);
	//�ۼ���
	public abstract int galleryUpdate(GalleryVO v);
	//�ۻ���
	public abstract int galleryDelete(GalleryVO v);

}
