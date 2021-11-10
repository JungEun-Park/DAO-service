<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<main style="margin-top: 100px;">

	<h2 style="margin-bottom: 30px;">게시글 보기</h2>

	<div class="container">
		<form action="/galleryUpdate" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<input type="hidden" class="form-control" id="gi_no" name="gi_no" value="${galleryDetail.gi_no }">
			</div>
			<div class="form-group">
				<label for="title">제목</label> 
				<input type="text" class="form-control" id="title" name="title" value="${galleryDetail.gi_title }" readonly>
			</div>
			<div class="form-group">
				<label for="writer">작성자</label> 
				<input type="text" class="form-control readonly" id="writer" name="writer" value="${galleryDetail.gi_writer }" readonly>
			</div>
			<div class="form-group readonly">
				<label for="date">작성일</label> 
				<input type="text" class="form-control readonly" id="date" name="date" value="${galleryDetail.gi_date }" readonly>
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" id="content" name="content" rows="5" readonly>${galleryDetail.gi_content }</textarea>
			</div>
			<div class="form-group ">
				<label for="img">이미지</label> 
				<input type="file" class="form-control hide-btn" id="gi_file" name="gi_file"  onchange="readURL(this);">
				<img id="file" src='/resources/file/${galleryDetail.gi_file }' alt="Thumbnail" style="height: 60%; width: 100%">
			</div>
			
			<div style="margin-top: 20px;">
				<c:choose>
					<c:when test="${loginMember.mi_id eq galleryDetail.gi_writer }">
						<button class="btn btn-outline-success show-btn" type="button" onclick="modify()">수정</button>
						<button class="btn btn-outline-success hide-btn" id="modifyBtn" type="submit">수정하기</button>
						<button class="btn btn-outline-success hide-btn" type="button" onclick="galleryDelete()">삭제하기</button>
						<button class="btn btn-outline-success" type="button" onclick="location.href='/gallery'">게시글목록</button>
					</c:when>
					<c:otherwise>
						<button class="btn btn-outline-success" type="button" onclick="location.href='/gallery'">게시글목록</button>
					</c:otherwise>
				</c:choose>

			</div>

		</form>
	</div>

</main>
<script>
	$(document).ready(function() {
		$('.hide-btn').hide();
		$("#gi_file").change(function(){
	         readURL(this);
	     });
		
	});
	function modify() {
		$('#title').removeAttr('readonly');
		$('#content').removeAttr('readonly');
		$('.show-btn').hide();
		$('.hide-btn').show();

	}
	

 	function galleryDelete() {

		var gi_no = $('#gi_no').val();

		$.ajax({
			type : 'POST',
			url : '/galleryDelete',
			dataType : 'JSON',
			data : {gi_no : gi_no},
			error : function(error) {
				alert("Error");
			},
			success : function(value) {
				alert("게시글이 삭제되었습니다.");
				location.href = "/gallery"

			}
		});
	}
 	 function readURL(input) {
         if (input.files && input.files[0]) {
             var reader = new FileReader();
             reader.onload = function (e) {
                 $('#file').attr('src', e.target.result);
             };

             reader.readAsDataURL(input.files[0]);
         }
     }
 	 
 	 
 	
 	

</script>

</html>