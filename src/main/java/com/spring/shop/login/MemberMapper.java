package com.spring.shop.login;

public interface MemberMapper {
	//ȸ������
	public abstract int join(MemberVO v);
	//�α���
	public abstract MemberVO signin(MemberVO v);
	//ȸ����������
	public abstract MemberVO member(MemberVO v); 
	//ȸ����������
	public abstract int memberUpdate(MemberVO v);
	//ȸ��Ż��
	public abstract int deleteMember(MemberVO v);	
	
}
