<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<main>
	<form action="/mypage/update" method="post"
		style="padding-top: 200px; padding-bottom: 50px; padding-right: 35%; padding-left: 35%;">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon1">아이디</span>
			</div>
			<input type="text" name="id" value="${loginMember.mi_id }" class="form-control" placeholder="아이디를 입력해주세요"
				aria-label="id" aria-describedby="basic-addon1" readonly>
		</div>

		<div class="input-group mb-3">
			<div class="input-group-append">
				<span class="input-group-text" id="basic-addon2">비밀번호</span>
			</div>
			<input type="password" name="password" value="${loginMember.mi_pw }" class="form-control" placeholder="비밀번호를 입력해주세요"
				aria-label="password" aria-describedby="basic-addon2">
		</div>

		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon3">이름</span>
			</div>
			<input type="text" name="name" value="${loginMember.mi_name }" class="form-control" placeholder="이름을 입력해주세요"
				id="basic-url" aria-describedby="name">
		</div>

		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon3">주소</span>
			</div>
			<input type="text" name="addr" value="${loginMember.mi_addr }" class="form-control" placeholder="주소를 입력해주세요"
				id="basic-url" aria-describedby="address">
		</div>
		<button class="w-100 btn btn-lg btn-primary" style="margin-top: 20px;"
			type="submit">수정</button>
	</form>
</main>

