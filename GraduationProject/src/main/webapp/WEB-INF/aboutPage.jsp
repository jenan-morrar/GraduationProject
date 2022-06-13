<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>من نحن</title>
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
	href="https://fonts.googleapis.com/css2?family=Aref+Ruqaa&family=Cormorant+Garamond:ital,wght@1,300&family=Montserrat:wght@100&family=Poiret+One&family=Rakkas&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Aref+Ruqaa&family=Cormorant+Garamond:ital,wght@1,300&family=Lateef&family=Montserrat:wght@100&family=Poiret+One&display=swap"
	rel="stylesheet">
<link
	href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700'
	rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css?family=Sacramento"
	rel="stylesheet">

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
<link rel="stylesheet"
	href="<c:url value="/resources/plugins/bootstrap/css/bootstrap.min.css" />">

<!-- Icon Font Css -->
<link rel="stylesheet"
	href="<c:url value="/resources/plugins/themify/css/themify-icons.css" />">

<link rel="stylesheet"
	href="<c:url value="/resources/plugins/fontawesome/css/all.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/plugins/magnific-popup/dist/magnific-popup.css" />">

<!-- Owl Carousel CSS -->
<link rel="stylesheet"
	href="<c:url value="/resources/plugins/slick-carousel/slick/slick.css" />">

<link rel="stylesheet"
	href="<c:url value="/resources/plugins/slick-carousel/slick/slick-theme.css" />">

<!-- Theme style  -->
<link rel="stylesheet" href="<c:url value="/resources/css/about.css" />">
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
							<li><a href="/index">الصفحة الرئيسية</a></li>
							<c:set var="userRole" scope="session" value="${userRole}" />
							<c:if test="${userRole == \"ROLE_ADMIN\"}">
								<li class="has-dropdown"><a href="#">صاحب القاعة</a>
									<ul class="dropdown">
										<li><a href="/adminVenuePage/${venueId}">قاعتي</a></li>
										<li><a href="/adminVenuePage/${venueId}/requests">طلبات
												الحجز</a></li>
										<li><a href="/adminVenuePage/${venueId}/venueReservation">حجوزات
												القاعة </a></li>
									</ul></li>
							</c:if>
							<%-- 							<c:if test="${userRole == \"ROLE_ADMIN\"}">
								<li><a href="/adminVenuePage/${venueId}">قاعتي</a></li>
							</c:if>
							<c:if test="${userRole == \"ROLE_ADMIN\"}">
								<li><a href="/adminVenuePage/${venueId}/requests">طلبات
										الحجز</a></li>
							</c:if> --%>
							<li class="active"><a href="/aboutPage">من نحن</a></li>
							<li><a href="/contactPage">تواصل معنا</a></li>
							<li class="has-dropdown"><a href="#">الخدمات</a>
								<ul class="dropdown">
									<li><a href="/venues">القاعات</a></li>
									<li><a href="/songsPage">الأغاني</a></li>
								</ul></li>
							<c:set var="userName" scope="session" value="${currentUser}" />
							<c:if test="${userName ==\"user\"}">
								<li><a href="/cartPage">&#128722</a></li>
							</c:if>

							<c:if test="${userName == \"noUser\"}">
								<li><a href="/login">تسجيل دخول</a></li>
							</c:if>
							<c:if test="${userName ==\"user\"}">
								<form id="logoutForm" method="POST" action="/logout"
									style="margin: 0px; display: inline;">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form>
								<li><a onclick="document.forms['logoutForm'].submit()"
									id="aboutLogout">تسجيل الخروج</a></li>
							</c:if>
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
								<h2>من نحن</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>

		<div id="fh5co-couple-story">
			<div class="container">
				<div class="row">
					<div
						class="col-md-8 col-md-offset-2 text-center fh5co-heading animate-box">
						<h2>PalVenues</h2>
						<p style="font-size: 22px;">هو موقع للبحث عن أماكن الزفاف
							المحلية وحجزها. الهدف الرئيسي من هذا الموقع هو تسهيل عملية العثور
							على الأماكن وحجزها على العملاء. هذا الموقع مجاني ويمكن استخدامه
							بواسطة أجهزة الكمبيوتر وأجهزة الكمبيوتر المحمولة والهواتف الذكية
							طالما أن المتصفح قيد التشغيل متصل بالإنترنت.</p>
					</div>
				</div>
			</div>
		</div>

		<section class="about-info section pt-0">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-4 col-md-6 col-sm-6 animate-box">
						<div class="about-info-item mb-4 mb-lg-0"
							style="text-align: right; font-size: 18px;">
							<h3 class="mb-3">
								<span class="text-color mr-2 text-md">رؤيتنا</span>
							</h3>
							<p>يضم هذا الموقع كل قاعات رام الله و نتطلع الى تطوير هذا
								الموقع ليصبح يشمل كل قاعات فلسطين. باللإضافة نحن نسعى إلى تطوير
								هذا الموقع من خلال استخدام تقنيات جديدة تساعد على تنظيم حفل
								الزفاف مثلا تمكين المستخدمين من اختيار ديكورات القاعة و تصميم
								كرت الزفاف و تحديد قائمة الضيوف و غيرها من الخدمات المميزة</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6 animate-box">
						<div class="about-info-item mb-4 mb-lg-0"
							style="text-align: right; font-size: 18px;">
							<h3 class="mb-3">

								<span class="text-color mr-2 text-md">نهجنا</span>

							</h3>
							<p>يساعد هذا الموقع الأزواج والمخطوبين بالبحث عن قاعات
								الأفراح ومقارنة أسعارهم وخدماتهم وتفاصيل أخرى ، وحتى حجزها من
								أجهزة الكمبيوتر الخاصة بهم. الفكرة الرئيسية مستوحاة من التجارب
								السابقة للأزواج عند التخطيط لحفل زفافهم. كان العثور على الأوصاف
								التفصيلية ومعلومات التسعير الدقيقة وتوافر أماكن الزفاف أمرًا شبه
								مستحيل بدون مكالمات هاتفية واسعة النطاق واجتماعات شخصية وحتى
								العثور على موعد متاح مناسب. لذا ، فإن الهدف هو تبسيط عملية البحث
								عن المواقع وعملية الحجز وصولاً إلى نقرة على فأرة الكمبيوتر
								وبالتالي توفير الوقت والجهد بالنسبة لهم.</p>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 col-sm-6 animate-box">
						<div class="about-info-item mb-4 mb-lg-0"
							style="text-align: right; font-size: 18px;">
							<h3 class="mb-3">
								<span class="text-color mr-2 text-md ">مهمتنا</span>
							</h3>
							<p>يقدم هذا الموقع العديد من الميزات والخدمات المفيدة ، حيث
								انه يمكن العملاء من البحث عن مكان معين ، أو بدلاً من ذلك ،
								يمكنهم تقديم بعض المعايير ويقدم هذا الموقع قائمة بالأماكن التي
								تتوافق مع معايير البحث الخاصة بهم. يمكن للعميل عرض صفحة تفاصيل
								كل مكان والاختيار من بين خدماته مع خيار حجزه في الأماكن المتاحة
								الموضحة في التقويم. يمكن للعميل مراجعة عربة التسوق الخاصة به
								التي تحتوي على أماكن محجوزة مع حالة الدفع (على سبيل المثال ، غير
								مدفوعة ، مدفوعة) وحالة المكان (معلق ، محجوز ، متاح) ، وجميع
								التفاصيل الأخرى. بالأضافة يعرض الموقع أكثر الأماكن حجزاً لهذا
								العام من خلال نظام التوصية. بالإضافة إلى ذلك ، يقدم الموقع
								اقتراحات لأغاني الزفاف العربية الأكثر شعبية حتى يتمكن العملاء من
								عمل قوائم تشغيل.</p>
						</div>
					</div>

				</div>
			</div>
		</section>

		<!--  Section Services Start -->
		<section class="section team">
			<div class="container">
				<div class="row justify-content-center animate-box">
					<div class="col-lg-7 text-center">
						<div class="section-title">
							<span class="h4 text-color" style="font-size: 20px;">مرمجين
								هذا الموقع </span>
							<h2 class="mt-3 content-title" style="font-size: 25px;">أعضاء
								الفريق الخبراء القائمين على هذا الموقع</h2>
						</div>
					</div>
				</div>

				<div class="row justify-content-center">
					<div class="col-lg-4 col-md-6 col-sm-6 animate-box">
						<div class="team-item-wrap mb-5">
							<div class="team-item position-relative">
								<img src="/resources/images/team1.jpg" alt=""
									class="img-fluid w-100">
								<div class="team-img-hover">
									<ul class="team-social list-inline">
										<li class="list-inline-item"><a href="#" class="facebook"><i
												class="fab fa-facebook-f" aria-hidden="true"></i></a></li>
										<li class="list-inline-item"><a href="#" class="twitter"><i
												class="fab fa-twitter" aria-hidden="true"></i></a></li>
										<li class="list-inline-item"><a href="#"
											class="instagram"><i class="fab fa-instagram"
												aria-hidden="true"></i></a></li>
										<li class="list-inline-item"><a href="#" class="linkedin"><i
												class="fab fa-linkedin-in" aria-hidden="true"></i></a></li>
									</ul>
								</div>
							</div>
							<div class="team-item-content">
								<h4 class="mt-3 mb-0 text-capitalize">Batoul Sammoudi</h4>
								<p>Software Developer</p>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 col-sm-6 animate-box">
						<div class="team-item-wrap mb-5">
							<div class="team-item position-relative">
								<img src="/resources/images/team1.jpg" alt=""
									class="img-fluid w-100">
								<div class="team-img-hover">
									<ul class="team-social list-inline">
										<li class="list-inline-item"><a href="#" class="facebook"><i
												class="fab fa-facebook-f" aria-hidden="true"></i></a></li>
										<li class="list-inline-item"><a href="#" class="twitter"><i
												class="fab fa-twitter" aria-hidden="true"></i></a></li>
										<li class="list-inline-item"><a href="#"
											class="instagram"><i class="fab fa-instagram"
												aria-hidden="true"></i></a></li>
										<li class="list-inline-item"><a href="#" class="linkedin"><i
												class="fab fa-linkedin-in" aria-hidden="true"></i></a></li>
									</ul>
								</div>
							</div>
							<div class="team-item-content">
								<h4 class="mt-3 mb-0 text-capitalize">Jenan Morrar</h4>
								<p>Software Developer</p>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 col-sm-6 animate-box">
						<div class="team-item-wrap mb-5 ">
							<div class="team-item position-relative">
								<img src="/resources/images/team1.jpg" alt=""
									class="img-fluid w-100">
								<div class="team-img-hover">
									<ul class="team-social list-inline">
										<li class="list-inline-item"><a href="#" class="facebook"><i
												class="fab fa-facebook-f" aria-hidden="true"></i></a></li>
										<li class="list-inline-item"><a href="#" class="twitter"><i
												class="fab fa-twitter" aria-hidden="true"></i></a></li>
										<li class="list-inline-item"><a href="#"
											class="instagram"><i class="fab fa-instagram"
												aria-hidden="true"></i></a></li>
										<li class="list-inline-item"><a href="#" class="linkedin"><i
												class="fab fa-linkedin-in" aria-hidden="true"></i></a></li>
									</ul>
								</div>
							</div>
							<div class="team-item-content">
								<h4 class="mt-3 mb-0 text-capitalize">Noora Qwasmi</h4>
								<p>Software Developer</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

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

	<!-- Main -->
	<script src="/resources/js/main.js"></script>
</body>
</html>