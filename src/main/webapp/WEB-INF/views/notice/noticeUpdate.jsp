<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<main style="margin-top: 100px;">
 
<h2 style="margin-bottom: 30px;"> �Խñ� ���� </h2>
 
<div class="container">
    <form>
      <div class="form-group">
        <input type="hidden" class="form-control" id="num" name="num" value="${noticeDetail.b_num }" >
      </div>
      <div class="form-group">
        <label for="title">����</label>
        <input type="text" class="form-control" id="title" name="title" value="${noticeDetail.b_title }">
      </div>
      <div class="form-group">
        <label for="writer">�ۼ���</label>
        <input type="text" class="form-control" id="writer" name="writer" value="${noticeDetail.b_writer }" readonly>
      </div>
      <div class="form-group">
        <label for="writer">�ۼ���</label>
        <input type="text" class="form-control" id="date" name="date" value="${noticeDetail.b_date }" readonly>
      </div>
      <div class="form-group">
        <label for=content">����</label>
        <textarea class="form-control" id="content" name="content"  rows="5" >${noticeDetail.b_content }</textarea>
      </div>
      <div style="margin-top:20px;">
      <button class="btn btn-outline-success" type="submit">�����ϱ�</button>
      </div>
    </form>
</div>

</main>

</html>