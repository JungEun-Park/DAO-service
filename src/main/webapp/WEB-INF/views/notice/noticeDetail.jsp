<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<main style="margin-top: 100px;">
 
<h2 style="margin-bottom: 30px;"> 게시글 보기 </h2>
 
<div class="container">
    <form action="/noticeUpdate" method="post">
      <div class="form-group">
        <input type="hidden" class="form-control" id="b_num" name="b_num" value="${noticeDetail.b_num }" >
      </div>
      <div class="form-group">
        <label for="title">제목</label>
        <input type="text" class="form-control" id="title" name="title" value="${noticeDetail.b_title }" readonly>
      </div>
      <div class="form-group">
        <label for="writer">작성자</label>
        <input type="text" class="form-control" id="writer" name="writer" value="${noticeDetail.b_writer }" readonly>
      </div>
      <div class="form-group">
        <label for="date">작성일</label>
        <input type="text" class="form-control" id="date" name="date" value="${noticeDetail.b_date }" readonly>
      </div>
      <div class="form-group">
        <label for=content">내용</label>
        <textarea class="form-control" id="content" name="content"  rows="5" readonly>${noticeDetail.b_content }</textarea>
      </div>
			<div style="margin-top: 20px;">
				<c:choose>
					<c:when test="${loginMember.mi_id eq noticeDetail.b_writer }">
						<button class="btn btn-outline-success" id="btn" type="button" onclick="modify()">수정</button>
						<button class="btn btn-outline-success hide-btn" id="modifyBtn" type="submit">수정하기</button>
						<button class="btn btn-outline-success hide-btn" type="button" onclick="noticeDelete()">삭제하기</button>
						<button class="btn btn-outline-success" type="button" onclick="location.href='/notice'">게시글목록</button>
					</c:when>
					<c:otherwise>
						<button class="btn btn-outline-success" type="button" onclick="location.href='/notice'">게시글목록</button>
					</c:otherwise>
				</c:choose>

			</div>
		</form>
</div>

</main>
<script>

	$(document).ready(function() {
		$('.hide-btn').hide();
	});
	function modify() {
		$('input').prop('readonly', false);
		$('#content').removeAttr('readonly');
		$('#btn').hide();
		$('.hide-btn').show();

	}
 	function noticeDelete(){
		
		var b_num = $('#b_num').val();
		
		$.ajax({
			type : 'POST',
			url : "/noticeDelete",
			dataType : 'JSON',
			data : {b_num : b_num},
			error : function(error) {
				alert("Error");
			},
			success : function(value) {
				alert("게시글이 삭제되었습니다.");
				location.href = "/notice"
				
			}
		});
	} 
	
</script>

</html>