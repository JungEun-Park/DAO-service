<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>Home</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
	<script  src="/resources/js/jquery.js"></script>
	<script  src="/resources/js/jquery-ui.js"></script>
	<script  src="/resources/js/jquery.ui.paging.js"></script>
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="/">Carousel</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
					aria-controls="navbarCollapse" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<ul class="navbar-nav me-auto mb-2 mb-md-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/notice">Notice</a></li>
						<li class="nav-item"><a class="nav-link" href="/gallery">Gallery</a>
						<li class="nav-item"><a class="nav-link" href="/covid">Covid</a>
						</li>
						<!-- <li class="nav-item">
            <a class="nav-link disabled"></a>
          </li> -->
					</ul>
					<c:choose>
						<c:when test="${loginMember eq null }">
							<button class="btn btn-outline-success" type="button" onclick="location.href='/login'">Login</button>
						</c:when>
						<c:otherwise>
							<a class="btn btn-outline-success" href="/mypage" style="margin: 0 10 0 0;">${loginMember.mi_name }</a>
							<button class="btn btn-outline-success" type="button" onclick="location.href='/logout'">Logout</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</nav>
	</header>

	<jsp:include page="${content }"></jsp:include>

	<!-- FOOTER -->
	<footer class="container" style="margin-top: 50px;">
		<p class="float-end">
			<a href="#">Back to top</a>
		</p>
		<p>
			© 2017–2021 Company, Inc. · <a href="#">Privacy</a> · <a href="#">Terms</a>
		</p>
	</footer>


</body>
</html>
