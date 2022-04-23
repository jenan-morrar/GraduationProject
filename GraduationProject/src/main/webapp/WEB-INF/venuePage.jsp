<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- For calendar -->
<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/evo-calendar.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/evo-calendar.orange.coral.min.css" />">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Fira+Mono&display=swap"
	rel="stylesheet">
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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"></script>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">

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
<link rel="stylesheet"
	href="<c:url value="/resources/css/imageSlider.css" />">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
<link href="<c:url value="/resources/css/venuePage.css" />"
	rel="stylesheet">

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
								<li><a href="/adminVenuePage/${venueId}">قاعتي</a></li>
							</c:if>
							<li><a href="/aboutPage">من نحن</a></li>
							<li><a href="/contactPage">تواصل معنا</a></li>
							<li class="has-dropdown active"><a href="#">الخدمات</a>
								<ul class="dropdown">
									<li class="active"><a href="/venues">القاعات</a></li>
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
								<li><a href="/login">تسجيل دخول</a></li>
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

		<header id="fh5co-header" role="banner" class="venuePageHeader">
			<div class="overlay"></div>
		</header>
		<div class="pd-wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-7">
						<div class="slider" id="slider1">
							<!-- Slides -->
							<c:forEach items="${venuePage.images}" var="images">
								<div
									style="background-image: url(<c:out value="/user-photos/${venuePage.id}/${images.image}"/>)"></div>
							</c:forEach>

							<i class="left" class="arrows"
								style="z-index: 2; position: absolute;"><svg
									viewBox="0 0 100 100">
                           <path
										d="M 10,50 L 60,100 L 70,90 L 30,50  L 70,10 L 60,0 Z"></path>
                           </svg></i> <i class="right" class="arrows"
								style="z-index: 2; position: absolute;"><svg
									viewBox="0 0 100 100"> <path
										d="M 10,50 L 60,100 L 70,90 L 30,50  L 70,10 L 60,0 Z"
										transform="translate(100, 100) rotate(180) "></path>
						  </svg></i>
							<!-- Title Bar -->
							<span class="titleBar"> <span>
									<h1>صور قاعة</h1>
									<h1>
										<c:out value="${venuePage.name}" />
									</h1>
							</span>
							</span>
						</div>
					</div>
					<div class="col-md-5" id="venueInfo">
						<div class="product-dtl">
							<div class="product-info">
								<div class="product-name">
									<c:out value="${venuePage.name}" />
								</div>
								<div class="reviews-counter">
									<div class="rate" id="venueRate">
										<input type="radio" id="star5" name="rate" value="5" checked />
										<label for="star5" title="text">5 stars</label> <input
											type="radio" id="star4" name="rate" value="4" checked /> <label
											for="star4" title="text">4 stars</label> <input type="radio"
											id="star3" name="rate" value="3" checked /> <label
											for="star3" title="text">3 stars</label> <input type="radio"
											id="star2" name="rate" value="2" /> <label for="star2"
											title="text">2 stars</label> <input type="radio" id="star1"
											name="rate" value="1" /> <label for="star1" title="text">1
											star</label>
									</div>
								</div>
							</div>
							<p class="venueParg">
							<div>
								<hr>
							</div>
							<div class="venueDetaile">
								<div class="venueDetaileTitle">
									وصف القاعة &nbsp;&nbsp; <i class='far fa-building'
										style='font-size: 25px'></i>
								</div>
								<span><c:out value="${venuePage.description}" /></span>
							</div>
							<div class="venueDetaile">
								<div class="venueDetaileTitle">
									سعر القاعة &nbsp;&nbsp; <i class='fas fa-shekel-sign'
										style='font-size: 22px'></i>
								</div>
								<span><c:out value="${venuePage.price}" /></span>
							</div>

							<div class="venueDetaile">
								<div class="venueDetaileTitle">
									عدد الضيوف &nbsp;&nbsp; <i class='far fa-id-badge'
										style='font-size: 25px'></i>
								</div>
								<span><c:out value="${venuePage.price}" /></span>
							</div>

							<div class="venueDetaile">
								<div class="venueDetaileTitle">
									المصفات &nbsp; &nbsp; <i class='fas fa-car'
										style='font-size: 24px'></i>
								</div>
								<span><c:out value="${venuePage.venuePark}" /></span>
							</div>

							<div class="venueDetaile">
								<div class="venueDetaileTitle">
									موقع القاعة &nbsp; &nbsp; <i class='fas fa-map-marker-alt'
										style='font-size: 24px'></i>
								</div>
								<span><c:out value="${venuePage.location}" /></span>
							</div>

							<div class="venueDetaile">
								<div class="venueDetaileTitle">
									للتواصل مع القاعة &nbsp; &nbsp; <i class="fa fa-phone"
										style="font-size: 22px"></i>
								</div>
								<span><c:out value="${venuePage.venueContact}" /></span>
							</div>

						</div>
					</div>
				</div>

				<ul class="nav nav-tabs" id="venueNavTabs">
					<li><a data-toggle="tab" href="#Reviews">تقييم القاعة</a></li>
					<li><a data-toggle="tab" href="#venueLocation">موقع القاعة</a></li>
					<li class="active"><a data-toggle="tab"
						href="#VenueReservatio">حجز القاعة</a></li>
				</ul>

				<div class="tab-content" id="venueTabContent">
					<div id="VenueReservatio" class="tab-pane fade in active">
						<c:if test="${userName == \"noUser\"}">
							<h3>
								للحجز يجب <a href="/login">تسجيل الدخول</a>
							</h3>

							<input type="date" value="" id="event-date" hidden />
							<c:set var="reservations" scope="session"
								value="${reservationResult}" />
							<input hidden value id="reservations" />
							<script>
								var reservationsjs = new Array();
								<c:forEach items="${reservations}" var="reservation">
								res = new Object();
								res.id = "${reservation.id}";
								res.name = "wedding";
								res.description = "from ${reservation.fromTime} to ${reservation.toTime}";
								res.fromTime = "${reservation.fromTime}";
								res.toTime = "${reservation.toTime}";
								res.reservationDate = "${reservation.reservationDate}";
								res.type = "event";
								reservationsjs.push(res);
								</c:forEach>
								$("#reservations").val(
										JSON.stringify(reservationsjs));
							</script>
							<div class="--noshadow" id="demoEvoCalendar"></div>
						</c:if>

						<c:if test="${userName == \"user\"}">
							<h3>حجز القاعة</h3>
							<c:set var="reservations" scope="session"
								value="${reservationResult}" />
							<!--<form:form method="post" action="/venuePage/${venuePage.id}" modelAttribute="reservation">
								<form:input type="time" path="fromTime" />
								<form:input type="time" path="toTime" />
								<form:input type="date" path="reservationDate" />
								<input type="submit" value="submit"/>

							</form:form>-->
							<div class="user" id="add-event-form"
								style="margin-top: 3%; display: none;">
								<form:form method="post" action="/venuePage/${venuePage.id}"
									modelAttribute="reservation">
									<form:input type="time" id="from" name="from" path="fromTime" />
									<label for="from">من الساعة</label>
									<br>
									<form:input type="time" id="to" name="to" path="toTime" />
									<label for="to">إلى الساعة</label>
									<br>
									<label>reservation date</label>
									<form:input type="date" value="" id="event-date"
										path="reservationDate" />
									<form:input type="date" path="expirationDate" />
									<input type="submit" class="round-black-btn" value="إحجز الآن" />

								</form:form>
								<!--<h4>أختر التاريح الذي يناسبك</h4>
									<div class="--noshadow" id="demoEvoCalendar" data-services=""></div>-->
							</div>
							<input hidden value id="reservations" />
							<script>
								var reservationsjs = new Array();
								<c:forEach items="${reservations}" var="reservation">
								res = new Object();
								res.id = "${reservation.id}";
								res.name = "wedding";
								res.description = "from ${reservation.fromTime} to ${reservation.toTime}";
								res.fromTime = "${reservation.fromTime}";
								res.toTime = "${reservation.toTime}";
								res.reservationDate = "${reservation.reservationDate}";
								res.type = "event";
								reservationsjs.push(res);
								</c:forEach>
								$("#reservations").val(
										JSON.stringify(reservationsjs));
							</script>
							<div class="--noshadow" id="demoEvoCalendar"></div>
						</c:if>


					</div>

					<div id="venueLocation" class="tab-pane fade">
						<div id="map">
							<iframe src="<c:out value="${venuePage.mapOne}" />" width="500"
								height="400" style="border: 0;" allowfullscreen=""
								loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

							<iframe src="<c:out value="${venuePage.mapTwo}" />" width="500"
								height="400" style="border: 0;" allowfullscreen=""
								loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

						</div>
					</div>

					<div id="Reviews" class="tab-pane fade">
						<c:if test="${userName == \"noUser\"}">
							<h3>للتقيم لقاعة يجب تسجيل الدخول</h3>
							<a class="round-black-btn" href="/login">تسجيل الدخول</a>
						</c:if>
						<c:if test="${userName == \"user\"}">
							<div class="review-heading">تقييم القاعة</div>
							<form class="review-form">
								<div class="form-group">
									<label>تقيمك للقاعة</label>
									<div class="reviews-counter">
										<div class="rate">
											<input type="radio" id="star5" name="rate" value="5" /> <label
												for="star5" title="text">5 stars</label> <input type="radio"
												id="star4" name="rate" value="4" /> <label for="star4"
												title="text">4 stars</label> <input type="radio" id="star3"
												name="rate" value="3" /> <label for="star3" title="text">3
												stars</label> <input type="radio" id="star2" name="rate" value="2" />
											<label for="star2" title="text">2 stars</label> <input
												type="radio" id="star1" name="rate" value="1" /> <label
												for="star1" title="text">1 star</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label>اكتب تقيمك</label>
									<textarea class="form-control" rows="10"></textarea>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<input type="text" name="" class="form-control"
												placeholder="اسم المستخدم" required="required">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<input type="text" name="" class="form-control"
												placeholder="ايميل المستخدم" required="required">
										</div>
									</div>
								</div>
								<button class="round-black-btn">Submit Review</button>
							</form>
						</c:if>
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
	<script src="/resources/js/imageSlider.js"></script>
	<script src="/resources/js/evo-calendar.js"></script>
	<script src="/resources/js/demo.js"></script>


</body>
</html>