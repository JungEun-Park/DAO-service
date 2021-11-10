package com.spring.shop.login;

public interface MemberMapper {
	//회원가입
	public abstract int join(MemberVO v);
	//로그인
	public abstract MemberVO signin(MemberVO v);
	//회원정보보기
	public abstract MemberVO member(MemberVO v); 
	//회원정보수정
	public abstract int memberUpdate(MemberVO v);
	//회원탈퇴
	public abstract int deleteMember(MemberVO v);	
	
}
