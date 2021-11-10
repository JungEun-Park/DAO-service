<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<main class="container" style="margin-top: 100px;">

	<table class="table">
		<thead>
			<tr>
				<th scope="col">글번호</th>		
				<th scope="col">확진자 수</th>
				<th scope="col">격리해제 수</th>
				<th scope="col">치료중 환자 수</th>
				<th scope="col">사망자 수</th>
			</tr>
		</thead>
		<tbody id="tbody"></tbody> 
	</table>
</main>
<script>
	$(document).ready(function() {
		$.ajax({
			type : 'GET',
			url : "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson?serviceKey=S9rBaFio8QGz%2BFEnx2IHDcUggYJvdFMcEm%2Bc%2BPm8hhfuH%2BFRO9etq27vzdFKqrvvEHzibwKdl%2BwqGaOPyUkj1A%3D%3D&pageNo=1&numOfRows=10&startCreateDt=20200310&endCreateDt=20200320",
			dataType : 'JSON',
			error : function(error) {
				alert("Error");
			},
			success : function(value) {
				alert("suc");
				console.log(value);
				covid(value);
			}
		});
	
	});
	function covid(value) {
		var list = value.response.body.items.item;
		console.log(list);
		var html = "";
		
		for (var i = 0; i < list.length; i++) {
			html += "<tr>";
			html += "<td>" + list[i].seq + "</td>";
			html += "<td>" + list[i].decideCnt + "</td>";
			html += "<td>" + list[i].clearCnt + "</td>";
			html += "<td>" + list[i].careCnt + "</td>";
			html += "<td>" + list[i].deathCnt + "</td>";
			html += "</tr>";
		}
		
		$("#tbody").append(html);

	}
</script>
