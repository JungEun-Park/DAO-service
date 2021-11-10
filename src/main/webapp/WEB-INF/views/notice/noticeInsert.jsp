<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<main style="margin-top: 100px;">
 
<h2 style="margin-bottom: 30px;"> 게시글 작성 </h2>
 
<div class="container">
    <form action="/noticeInsert" method="post">
      <div class="form-group">
        <label for="title">제목</label>
        <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요.">
      </div>
      <div class="form-group">
        <label for="writer">작성자</label>
        <input type="text" class="form-control" id="writer" name="writer" value="${loginMember.mi_id }" readonly>
      </div>
      <div class="form-group">
        <label for=content">내용</label>
        <textarea class="form-control" id="content" name="content" rows="5"></textarea>
      </div>
      <div style="margin-top:20px;">
      <button class="btn btn-outline-success" type="submit">게시글작성</button>
      <button class="btn btn-outline-success" type="button" onclick="location.href='/notice'">게시글목록</button>
      </div>
    </form>
</div>

</main>

</html>