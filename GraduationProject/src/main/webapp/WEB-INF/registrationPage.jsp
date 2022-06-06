<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>إنشاء حساب</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="/resources/images/ring map logo.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css" />">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/loginFonts/font-awesome-4.7.0/css/font-awesome.min.css" />">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/loginFonts/Linearicons-Free-v1.0.0/icon-font.min.css" />">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/animate/animate.css" />">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/css-hamburgers/hamburgers.min.css" />">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/select2/select2.min.css" />">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/loginCss/util.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/loginCss/main.css" />">
<!--===============================================================================================-->
<link
	href="https://fonts.googleapis.com/css2?family=Aref+Ruqaa&family=Cormorant+Garamond:ital,wght@1,300&family=Montserrat:wght@100&family=Poiret+One&family=Rakkas&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Aref+Ruqaa&family=Cormorant+Garamond:ital,wght@1,300&family=Lateef&family=Montserrat:wght@100&family=Poiret+One&display=swap"
	rel="stylesheet">
<!--===============================================================================================-->

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
							<!--<li><a href="/cartPage">&#128722</a></li>-->
							<li><a href="/index">الصفحة الرئيسية</a></li>
							<li><a href="/aboutPage">من نحن</a></li>
							<li><a href="/contactPage">تواصل معنا</a></li>
							<li class="has-dropdown"><a href="#">الخدمات</a>
								<ul class="dropdown">
									<li><a href="/venues">القاعات</a></li>
									<li><a href="/songsPage">الأغاني</a></li>
								</ul></li>

							<li class="active"><a href="/login">تسجيل دخول</a></li>
						</ul>
					</div>
				</div>

			</div>
		</nav>

		<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm"
			role="banner"
			style="background-image: url(/resources/images/login_bg.png);">
			<div class="overlay"></div>
			<div class="fh5co-container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center">
						<div class="display-t">
							<div class="display-tc animate-box" data-animate-effect="fadeIn">
								<div class="welcomTitle" style="margin-top: 8%;">
									<h1>أهلاً وسهلاً</h1>
									<h1>PalVenues</h1>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>

		<div class="limiter">
			<div class="container-login100">
				<div class="wrap-login100 p-b-30" id="responsiveLoginForm">
					<div class="loginForm">
						<form:form method="POST" action="/registration" id="registration-form-part"
							modelAttribute="user" class="login100-form validate-form">
							<div class="login100-form-avatar">
								<img src="/resources/images/registerIcon.png" alt="AVATAR">
							</div>

							<span class="login100-form-title p-t-20 p-b-45"> إنشاء
								حساب </span>
						
								<p class="errorStyle">
									<c:out value="${alreadyExist}" />
								</p>

							<div class="wrap-input100 validate-input m-b-10"
								data-validate=" أدخل اسم المستخدم">
								<form:input path="username" class="input100" type="text"
									name="email" placeholder="اسم المستخدم" />
								<span class="focus-input100"></span> <span
									class="symbol-input100"> <i class="fa fa-user"></i>
								</span>
							</div>
							<p class="errorStyle">
								<form:errors path="username" class="error" />
							</p>
							<div class="wrap-input100 validate-input m-b-10"
								data-validate=" أدخل ايميل المستخدم" style="margin-bottom:7%;">
								<form:input path="email" class="input100" type="text"
									name="email" placeholder="ايميل المستخدم" />
								<span class="focus-input100"></span> <span
									class="symbol-input100"> <i class="fa fa-envelope"></i>
								</span>
							</div>

							<div class="wrap-input100 validate-input m-b-10"
								data-validate=" أدخل رقم هاتف المستخدم" style="margin-bottom:7%;">
								<form:input path="mobileNumber" class="input100" type="text"
									name="mobile" placeholder="رقم الهاتف المستخدم" />
								<span class="focus-input100"></span> <span
									class="symbol-input100"> <i class="fa fa-mobile"></i>
								</span>
							</div>

							<div class="wrap-input100 validate-input m-b-10"
								data-validate="أدخل كلمة المرور">
								<form:password path="password" class="input100" name="password"
									placeholder="كلمة المرور" />
								<span class="focus-input100"></span> <span
									class="symbol-input100"> <i class="fa fa-lock"></i>
								</span>
							</div>
							<p class="errorStyle">
								<form:errors path="password" class="error" />
							</p>

							<div class="wrap-input100 validate-input m-b-10"
								data-validate="أدخل كلمة المرور">
								<form:password path="passwordConfirmation" class="input100"
									name="passwordConfirmation" placeholder="تأكيد كلمة المرور" />
								<span class="focus-input100"></span> <span
									class="symbol-input100"> <i class="fa fa-lock"></i>
								</span>
							</div>
							<p class="errorStyle">
								<form:errors path="passwordConfirmation" class="error" />
							</p>

							<div class="container-login100-form-btn p-t-10">
								<!--<button class="login100-form-btn">
								إنشاء حساب
							</button>-->
								<input type="submit" value="إنشاء حساب"
									class="login100-form-btn" />
							</div>
							<div class="text-center w-full">
								<p class="txt1">
									هل تمتلك حساب ؟<a class="txt1" href="/login">&nbsp; تسجيل
										الدخول </a> <i class="fa fa-long-arrow-right"></i>
								</p>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>

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

	<!--===============================================================================================-->
	<script src="/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/loginJs/main.js"></script>

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