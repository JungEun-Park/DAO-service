<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<main style="margin-top: 100px;">
 
<h2 style="margin-bottom: 30px;"> 게시글 수정 </h2>
 
<div class="container">
    <form>
      <div class="form-group">
        <input type="hidden" class="form-control" id="num" name="num" value="${noticeDetail.b_num }" >
      </div>
      <div class="form-group">
        <label for="title">제목</label>
        <input type="text" class="form-control" id="title" name="title" value="${noticeDetail.b_title }">
      </div>
      <div class="form-group">
        <label for="writer">작성자</label>
        <input type="text" class="form-control" id="writer" name="writer" value="${noticeDetail.b_writer }" readonly>
      </div>
      <div class="form-group">
        <label for="writer">작성일</label>
        <input type="text" class="form-control" id="date" name="date" value="${noticeDetail.b_date }" readonly>
      </div>
      <div class="form-group">
        <label for=content">내용</label>
        <textarea class="form-control" id="content" name="content"  rows="5" >${noticeDetail.b_content }</textarea>
      </div>
      <div style="margin-top:20px;">
      <button class="btn btn-outline-success" type="submit">수정하기</button>
      </div>
    </form>
</div>

</main>

</html>