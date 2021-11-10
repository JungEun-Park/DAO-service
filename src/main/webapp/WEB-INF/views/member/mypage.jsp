<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<main>
	<form style="padding-top: 200px; padding-bottom: 50px; padding-right: 35%; padding-left: 35%;">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon1">아이디</span>
			</div>
			<input type="text" name="id" value="${loginMember.mi_id }" class="form-control" placeholder="아이디를 입력해주세요"
				aria-label="id" aria-describedby="basic-addon1" readonly>
		</div>

		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon3">이름</span>
			</div>
			<input type="text" name="name" value="${loginMember.mi_name }" class="form-control" placeholder="이름을 입력해주세요"
				id="basic-url" aria-describedby="name" readonly>
		</div>

		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon3">주소</span>
			</div>
			<input type="text" name="addr" value="${loginMember.mi_addr }" class="form-control" placeholder="주소를 입력해주세요"
				id="basic-url" aria-describedby="address" readonly>
		</div>
			<button class="w-100 btn btn-lg btn-primary" style="margin-top: 20px;" type="button" onclick="location.href='/mypage/update'">수정하기</button>
			<button class="w-100 btn btn-lg btn-primary" style="margin-top: 5px;" type="button" onclick="location.href='/deleteMember?mi_id=${loginMember.mi_id}'">탈퇴하기</button>
	</form>
</main>
<script>
var flag = "${Flag }"
if(flag == 'modifyY'){
	alert("수정완료")
}
if(flag == 'modifyN'){
	alert("수정실패")
}
</script>

