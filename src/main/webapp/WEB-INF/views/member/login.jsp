<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<main class="form-signin text-center">
	">
	<form action="/signin" method="post"
		style="padding-top: 50px; padding-bottom: 50px; padding-right: 35%; padding-left: 35%;">
		<img class="mb-4" src="/docs/5.1/assets/brand/bootstrap-logo.svg"
			alt="" width="72" height="57">
		<h1 class="h3 mb-3 fw-normal">Please sign in</h1>

		<div class="form-floating">
			<input type="text" name="id" class="form-control" id="floatingInput"
				placeholder="Id"> <label for="floatingInput">Id</label>
		</div>
		<div class="form-floating">
			<input type="password" name="pw" class="form-control" id="floatingPassword"
				placeholder="Password"> <label for="floatingPassword">Password</label>
		</div>

		<div class="checkbox mb-3">
			<label> <input type="checkbox" value="remember-me">
				Remember me
			</label>
		</div>
		<button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
		<button class="w-100 btn btn-lg btn-primary" style="margin-top: 5px;"
			type="button" onclick="location.href='/signup'">회원가입</button>
		<p class="mt-5 mb-3 text-muted">© 2017–2021</p>
	</form>
</main>
