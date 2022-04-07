<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>PalVenues</title>
<link rel="icon" type="image/png"
	href="/resources/images/ring map logo.png" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<link
	href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700'
	rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css?family=Sacramento"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Aref+Ruqaa&family=Dancing+Script:wght@700&display=swap"
	rel="stylesheet">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Animate.css -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/animate.css" />">

<!-- Icomoon Icon Fonts-->
<link rel="stylesheet"
	href="<c:url value="/resources/css/icomoon.css" />">

<!-- Bootstrap  -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.css" />">

<!-- Magnific Popup -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/magnific-popup.css" />">

<!-- Owl Carousel  -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/owl.carousel.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/owl.theme.default.min.css" />">

<!-- Theme style  -->
<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">

<!-- Modernizr JS -->
<script src="/resources/js/modernizr-2.6.2.min.js"></script>
</head>
<body>

	<div class="fh5co-loader"></div>

	<div id="page">
		<nav class="fh5co-nav" role="navigation">
			<div class="container">
				<div class="row">
					<div class="col-xs-3">
						<div id="fh5co-logo">
							<img src="/resources/images/ring map logo.png" alt="logo" style
								width="50px" height="60px"> <a href="/index">PalVenues<strong>.</strong></a>
						</div>
					</div>
					<div class="col-xs-9 text-right menu-1">
						<ul style="margin-top: 2%;">
							<li class="active"><a href="/cartPage">&#128722</a></li>
							<li><a href="/index">الصفحة الرئيسية</a></li>
							<c:set var="userRole" scope="session" value="${userRole}" />
							<c:if test="${userRole == \"ROLE_ADMIN\"}">
								<li><a href="adminVenuePage">قاعتي</a></li>
							</c:if>
							<li><a href="/aboutPage">من نحن</a></li>
							<c:set var="userName" scope="session" value="${currentUser}" />
							<c:if test="${userName == \"noUser\"}">
								<li><a href="/login">تسجيل دخول</a></li>
							</c:if>
							<c:if test="${userName ==\"user\"}">
								<form id="logoutForm" method="POST" action="/logout" style="margin: 0px; display:inline;">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form>
								<li><a onclick="document.forms['logoutForm'].submit()">تسجيل الخروج</a></li>
							</c:if>
							<li class="has-dropdown"><a href="#">الخدمات</a>
								<ul class="dropdown">
									<li><a href="/venues">القاعات</a></li>
									<li><a href="/songsPage">الأغاني</a></li>
								</ul></li>
							<li class="has-dropdown"><a href="#">اللغة</a>
								<ul class="dropdown">
									<li><a href="#">العربية</a></li>
									<li><a href="#">الأنجليزية</a></li>
								</ul></li>
							<li><a href="/contactPage">تواصل معنا</a></li>
						</ul>
					</div>
				</div>

			</div>
		</nav>

		<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm"
			role="banner"
			style="background-image: url(/resources/images/img_bg_1.jpg);">
			<div class="overlay"></div>
			<div class="fh5co-container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center">
						<div class="display-t">
							<div class="display-tc animate-box" data-animate-effect="fadeIn">
								<h1>PalVenues</h1>
								<h2>القاعات التي تم حجزها</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>

		<footer id="fh5co-footer" role="contentinfo"
			class="fh5co-section-gray">
			<div class="container">

				<div class="row copyright">
					<div class="col-md-12 text-center">
						<p>
							<small class="block">&copy; 2022 PalVenues Website.</small>
						</p>
						<p>
						<ul class="fh5co-social-icons">
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-linkedin"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
						</ul>
						</p>
					</div>
				</div>

			</div>
		</footer>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>

	<!-- jQuery -->
	<script src="/resources/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="/resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="/resources/js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="/resources/js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="/resources/js/jquery.countTo.js"></script>

	<!-- Stellar -->
	<script src="/resources/js/jquery.stellar.min.js"></script>
	<!-- Magnific Popup -->
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/js/magnific-popup-options.js"></script>
	<!-- Google Map -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>

	<!-- Main -->
	<script src="/resources/js/main.js"></script>
</body>
</html>