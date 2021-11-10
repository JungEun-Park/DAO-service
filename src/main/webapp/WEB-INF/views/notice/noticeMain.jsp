<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<main class="container" style="margin-top: 100px;">
	<form class="d-flex">
		<input class="form-control me-2" type="search" placeholder="Search"
			aria-label="Search">
		<button class="btn btn-outline-success" type="submit">Search</button>
	</form>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">이름</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody id="tbody"></tbody>
	</table>
	<div><button class="btn btn-outline-success" type="button" style="float: right;" onclick="location.href='/insert'">글작성</button></div>
	<div id="pageNav" style="margin-top: 60px;"></div>
</main>
<script>
	var data = {};
	$(document).ready(function() {
		search(1);
	});

	var search = function(selPage) {
		data.curPage = selPage;
		data.pagePerCnt = 2;
		$.ajax({
			type : 'POST',
			url : "/notice/list",
			dataType : "JSON",
			data : data,
			error : function(error) {
				alert("Error!");
			},
			success : function(value) {
				console.log(value);
				getNoticeList(value);
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
	function getNoticeList(value) {
		var list = value.list; // value 안에 있는 list가 있어서 그거 가져오면 됨
		var html = "";
		
		if (list.length > 0) {
			$("#tbody").children().remove();
			for (var i = 0; i < list.length; i++) {
				html += "<tr>";
				html += "<td>" + list[i].b_num + "</td>";
				html += "<td><a href='/detail?b_num="+list[i].b_num+"'>" + list[i].b_title + "</a></td>";
				html += "<td>" + list[i].b_writer + "</td>";
				html += "<td>" + list[i].b_date + "</td>";
				html += "</tr>";

			}
		} else {
			html += "<tr>";
			html += "<td>";			
			html += "<td>등록된 공지가 없습니다.</td>";
			html += "<td>";			
			html += "<td>";			
			html += "<tr>";
		} 
		$("#tbody").append(html);
	}
	
	var flag = "${Flag }"
	if(flag == 'insertY'){
		alert("게시글이 등록되었습니다.");
	}
	if(flag == 'insertN'){
		alert("게시글 등록실패.");
	}
	if(flag == 'modifyY'){
		alert("수정이 완료되었습니다.");
	}
	if(flag == 'modifyN'){
		alert("수정실패");
	}

	
</script>
