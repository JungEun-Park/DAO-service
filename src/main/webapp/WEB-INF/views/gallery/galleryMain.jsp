<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<main>
	<div>
		<button class="btn btn-outline-success" type="button"
			style="float: left; margin-left: 20px;"
			onclick="location.href='/gallery/insert'">글작성</button>
	</div>

	<div class="album py-5 bg-light" style="margin-top: 70px;">
		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="gallery"></div>
		</div>
	</div>
	<div id="pageNav" style="margin-top: 60px;"></div>

</main>

<script>
 	var data ={};
 	$(document).ready(function() {
		search(1);
	});
 	
 	var search = function(selPage) {
 		data.curPage = selPage;
 		data.pagePerCnt = 6;
 		$.ajax({
 			type : "POST",
 			url : "galleryList",
 			dataType : "JSON",
 			data : data,
 			error : function(error) {
 				alert("Error!");
 			},
 			success : function(value) {
 				getGalleryList(value);
 				$("#pageNav").paging({
 					pageSize : data.pagePerCnt,
					PAGE_PER_CNT : data.pagePerCnt,
					currentPage : value.paging.CUR_PAGE,
					pageTotal : value.total
 				});
 			}
 		});
 	}
 	function goPage(selPage) {
		search(selPage);
	}
 	function getGalleryList(value) {
 		var list = value.list;
 		var html = "";
 		
 		if (list.length > 0) {
 			$("#gallery").children().remove();
 			for (var i = 0; i < list.length; i++) {
 				html += "<div class='col'>";
 		 		html += "<div class='card shadow-sm'>";
 		 		html += "<a href='/galleryDetail?gi_no="+ list[i].gi_no +"'>";
 		 		html += "<img src='/resources/file/"+ list[i].gi_file + "'alt='Thumbnail' style='height:100%; width: 100%'></a>";
 		 		html += "<div class='card-body'>";
 		 		html += "<a href='/galleryDetail?gi_no="+ list[i].gi_no +"'><strong><p class='card-text'>"+ list[i].gi_title +"</p></strong></a>";
 		 		html += "<div class='d-flex justify-content-between align-items-center'>";
 		 		html += "<div class='btn-group'>";
 		 		html += "<div>";
 		 		html += "<small class='text-muted'>"+ list[i].gi_date +"</small>";
 		 		html += "</div>";
 		 		html += "</div>";
 		 		html += "</div>";
 		 		html += "</div>";
 		 		html += "</div>";
 		 		html += "</div>";
 			}
 		}
 		$("#gallery").append(html);
 		
 	}
 	
 	var flag = "${Flag }"
 		if(flag == 'insertY'){
 			alert("게시글이 등록되었습니다.");
 		}
 		if(flag == 'insertN'){
 			alert("게시글 등록실패.");
 		}
 		if(flag == 'modifyY'){
 			alert("게시글이 수정되었습니다.");
 		}
 		if(flag == 'modifyN'){
 			alert("수정실패.");
 		}
 	
</script>
