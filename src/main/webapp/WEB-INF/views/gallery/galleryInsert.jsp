<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<main style="margin-top: 100px;">
 
<h2 style="margin-bottom: 30px;"> �Խñ� �ۼ� </h2>
 
<div class="container">
    <form action="/galleryInsert" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <label for="title">����</label>
        <input type="text" class="form-control" id="title" name="title" placeholder="������ �Է��ϼ���.">
      </div>
      <div class="form-group">
        <label for="writer">�ۼ���</label>
        <input type="text" class="form-control" id="writer" name="writer" value="${loginMember.mi_id }" readonly>
      </div>
      <div class="form-group">
        <label for=content">����</label>
        <textarea class="form-control" id="content" name="content" rows="5"></textarea>
      </div>
      <div class="form-group">
        <label for="file">�̹���</label>
        <input type="file" class="form-control" id="gi_file" name="gi_file">
      </div>
      <div style="margin-top:20px;">
      <button class="btn btn-outline-success" type="submit">�Խñ��ۼ�</button>
      <button class="btn btn-outline-success" type="button" onclick="location.href='/gallery'">�Խñ۸��</button>
      </div>
    </form>
</div>

</main>

</html>