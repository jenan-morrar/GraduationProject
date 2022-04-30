<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
							<li class="active"><a href="/index">الصفحة الرئيسية</a></li>
							<c:set var="userRole" scope="session" value="${userRole}" />
							<c:if test="${userRole == \"ROLE_ADMIN\"}">
								<li><a href="/adminVenuePage/${venueId}">قاعتي</a></li>
							</c:if>
							<li><a href="/aboutPage">من نحن</a></li>
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
							<li class="has-dropdown"><a href="#">اللغة</a>
								<ul class="dropdown">
									<li><a href="#">العربية</a></li>
									<li><a href="#">الأنجليزية</a></li>
								</ul></li>
							<c:if test="${userName == \"noUser\"}">
								<li><a href="/login"> تسجيل الدخول</a></li>
							</c:if>
							<c:if test="${userName ==\"user\"}">
								<form id="logoutForm" method="POST" action="/logout"
									style="margin: 0px; display: inline;">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form>
								<li><a onclick="document.forms['logoutForm'].submit()">تسجيل
										الخروج</a></li>
							</c:if>
						</ul>
					</div>
				</div>

			</div>
		</nav>


		<header id="fh5co-header" class="fh5co-cover" role="banner"
			style="background-image: url(/resources/images/cover-bg1.jpg);"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center">
						<div class="display-t">
							<div class="display-tc animate-box" data-animate-effect="fadeIn">
								<h2>ابحث عن القاعة التي تناسبك</h2>

								<div class="search">
									<form:form action="/index/search/" method="post"
										modelAttribute="search">
										<form:input type="text" name="text" class="searchInput"
											placeholder=" ... ابحث هنا" path="venueName" />
										<input type="submit" name="submit" class="fa searchSubmit"
											value=&#xf002;>
									</form:form>
								</div>

								<!--<div class="input-wrapper">
								<div class="fa fa-search"></div>
								<input type="text" placeholder="بحث" />
								<div class="fa fa-times"></div>
							  </div>-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>

		<div id="fh5co-couple">
			<div class="container">
				<div class="row">
					<div
						class="col-md-8 col-md-offset-2 text-center fh5co-heading animate-box">
						<h2>أهلاً بك في</h2>
						<h2>PalVenues</h2>
						<h3 style="margin-top: 40px;">الآن أصبح بأمكانك البحث عن قاعة
							مميزة لفرحك و حجزها من خلال هذه الموقع</h3>
						<h3 style="margin-bottom: 30px;">للمزيد من المعلومات</h3>
						<a class="btn btn-default btn-block" href="/aboutPage">اضغط
							هنا</a>
					</div>
				</div>
			</div>
		</div>

		<div id="fh5co-event" class="fh5co-bg"
			style="background-image: url(/resources/images/img_bg_3.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div
						class="col-md-8 col-md-offset-2 text-center fh5co-heading animate-box">
						<span>تمييز معنا بأرقى القاعات</span>
						<h2>اكثر القاعات حجزاً</h2>
					</div>
				</div>
				<div class="row">
					<div class="display-t">
						<div class="display-tc">
							<div class="col-md-10 col-md-offset-1">
								<c:forEach items="${mostReservedVenues}" var="mostReservedVenue">
									<div class="col-md-6 col-sm-6 text-center">
										<div class="event-wrap animate-box">
											<h3>${mostReservedVenue.name}</h3>
											<div class="event-col">
												<i class="icon-phone"></i> <span>${mostReservedVenue.venueContact}</span>
											</div>
											<div class="event-col">
												<i class="icon-location"></i> <span>${mostReservedVenue.location}</span>
											</div>
											<c:forEach var="images" items="${mostReservedVenue.images}"
												varStatus="loop">
												<c:if test="${loop.first}">
													<img alt="Gloria Venues"
														style="width: 250px; height: 250px;"
														src="<c:out value="/user-photos/${mostReservedVenue.id}/${images.image}"/>">
												</c:if>
											</c:forEach>

											<!-- <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p> -->
										</div>
									</div>
								</c:forEach>

								<!--<div class="col-md-6 col-sm-6 text-center">
									<div class="event-wrap animate-box">
										<h3>قاعة فيرست كلاس</h3>
										<div class="event-col">
											<i class="icon-phone"></i> <span>0595252546</span> <span>022920807</span>
										</div>
										<div class="event-col">
											<i class="icon-location"></i> <span>رام الله-الماصيون</span>
											<span>شارع حبوب </span>
										</div>
										<img src="/resources/images/firstclassimg.jpg"
											alt="First Class Venues">
									</div>
								</div>-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="fh5co-couple-story">
			<div class="container">
				<div class="row">
					<div
						class="col-md-8 col-md-offset-2 text-center fh5co-heading animate-box">
						<h2>: ردود الفعل</h2>
						<p>: عرض بعض التعليقات و التغذية الراجعة من مستخدمين الصفحة</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 col-md-offset-0">
						<ul class="timeline animate-box">
							<c:forEach items="${websiteRateResult}" var="websiteRateResult" varStatus="status">
							<c:if test="${status.index == 1}">
							<li class="timeline-inverted animate-box">
																<div class="timeline-badge"
										style="background-image: url(/resources/images/personIcon.png);"></div>
									<div class="timeline-panel">
										<div class="timeline-heading"></div>
										<div class="timeline-body">
											<br> <br>
											<p class="right">${websiteRateResult.message}</p>
											<br> <br>
										</div>
									</div>
							</li>
							</c:if>
							<c:if test="${status.index != 1}">
								<li class="animate-box">
									<div class="timeline-badge"
										style="background-image: url(/resources/images/personIcon.png);"></div>
									<div class="timeline-panel">
										<div class="timeline-heading"></div>
										<div class="timeline-body">
											<br> <br>
											<p class="right">${websiteRateResult.message}</p>
											<br> <br>
										</div>
									</div>
								</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="fh5co-services" class="fh5co-section-gray">
			<div class="container">

				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
						<h2>بعض الخدمات التي نوفرها</h2>
						<p>:توفر هذه الصفحة العديد من الخدمات التي هدفها مساعدة
							المقبلين على الزواج منها</p>
					</div>
				</div>
				<div class="col-md-6 animate-box">
					<div class="fh5co-video fh5co-bg"
						style="background-image: url(/resources/images/gallery-8.jpg);">
						<a><i class="icon-location"></i></a>
						<div class="overlay"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6" style="margin-top: 5%;">
						<div class="feature-left animate-box"
							data-animate-effect="fadeInLeft">
							<div class="feature-copy">
								<h3 class="right-Text">خدمة حجز قاعة</h3>
								<p class="right-Text">.بامكان الزوجين حجز اي قاعة توفرها
									الصفحة بالموعد و الوقت المناسب</p>
							</div>
							<span class="icon"> <i class="icon-calendar"></i>
							</span>

						</div>

						<div class="feature-left animate-box"
							data-animate-effect="fadeInLeft">
							<div class="feature-copy">

								<h3 class="right-Text">اختر اغانيك</h3>
								<p class="right-Text">امكانية اختيار اي اغنية تفضلها
									واضافتها على قائمة اغانيك وارسالها تلقائيا مع الحجز</p>
							</div>
							<span class="icon"> <i class="icon-music"></i>
							</span>

						</div>

						<div class="feature-left animate-box"
							data-animate-effect="fadeInLeft">
							<div class="feature-copy">
								<h3 class="right-Text">البحث المستهدف</h3>
								<p class="right-Text">.امكانية البحث عن اي قاعة متوفرة بناءٌ
									على الموقع او عدد الضيوف وغيرها</p>
							</div>
							<span class="icon"> <i class="icon-search"></i>
							</span>

						</div>

					</div>


				</div>


			</div>
		</div>


		<div id="fh5co-started" class="fh5co-bg"
			style="background-image: url(/resources/images/img_bg_4.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
						<h2>ما هو رأيك بصفحتنا ؟</h2>
						<p>...اترك بصمتك هنا معنا و ابدي رأيك الخاص في صفحتنا</p>
					</div>
				</div>
				<div class="row animate-box">
					<div class="col-md-10 col-md-offset-1">
						<form:form class="form-inline" method="POST" action="/index"
							modelAttribute="userWebsiteRate">
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label for="text" class="sr-only"><textarea name=""
											cols="150" rows="150"></textarea></label>
									<form:input type="text" class="form-control"
										placeholder="التعليق" required="required" path="message" />
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label for="name" class="sr-only">Name</label>
									<form:input type="text" class="form-control" id="name"
										placeholder="الاسم" required="required" path="senderName" />
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<input type="submit" value="إرسال"
									class="btn btn-default btn-block" />
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>

		<footer id="fh5co-footer" role="contentinfo">
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

	<!-- // <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/0.0.1/prism.min.js"></script> -->
	<script src="/resources/js/simplyCountdown.js"></script>
	<!-- Main -->
	<script src="/resources/js/main.js"></script>

	<script>
		var d = new Date(new Date().getTime() + 200 * 120 * 120 * 2000);

		// default example
		simplyCountdown('.simply-countdown-one', {
			year : d.getFullYear(),
			month : d.getMonth() + 1,
			day : d.getDate()
		});

		//jQuery example
		$('#simply-countdown-losange').simplyCountdown({
			year : d.getFullYear(),
			month : d.getMonth() + 1,
			day : d.getDate(),
			enableUtc : false
		});
	</script>

						</body>
</html>