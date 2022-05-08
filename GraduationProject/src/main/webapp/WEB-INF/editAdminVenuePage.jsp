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
								<li class="active"><a href="/adminVenuePage/${venueId}">قاعتي</a></li>
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
								<li><a href="/login/#login-form-part">تسجيل دخول</a></li>
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
							<c:forEach items="${venue.images}" var="images">
								<div
									style="background-image: url(<c:out value="/user-photos/${venue.id}/${images.image}"/>)"></div>
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
										<c:out value="${venue.name}" />
									</h1>
							</span>
							</span>
						</div>
						<form:form action="/adminVenuePage/${venue.id}/images/add"
							method="post" enctype="multipart/form-data"
							modelAttribute="venue">
							<c:forEach varStatus="us" var="images" items="${venue.images}">
								<tr>
									<td><img class="imageVenue"
										src="<c:out value="/user-photos/${venue.id}/${images.image}"/>"
										width="80px" height="85px"></td>
									<form:input type="hidden" path="images[${us.index}].id" />
									<td><a
										href="/adminVenuePage/${venue.id}/images/delete/${images.id}">Delete</a></td>
								</tr>
								&nbsp; &nbsp;
							</c:forEach>
							<br>
							<input type="file" class="form-control" name="image"
								accept="image/png, image/jpeg" multiple="multiple" required="required" />
							<div class="venue-a">
								<input type="submit" class="round-black-btn"
									value="إضافة الصورة" />
							</div>
						</form:form>
					</div>
					<div class="col-md-5" id="venueInfo">
						<div class="product-dtl">
							<div class="product-info">
								<form:form action="/adminVenuePage/${venue.id}" method="post"
									modelAttribute="venue">
									<input type="hidden" name="_method" value="put">

									<div class="product-name">
										<form:label path="name">اسم القاعة</form:label>
										<form:errors path="name" />
										<form:input class="form-control" path="name" />
									</div>
									<hr>
									<div class="venueDetaile">
										<div class="venueDetaileTitle">
											وصف القاعة &nbsp;&nbsp; <i class='far fa-building'
												style='font-size: 25px'></i>
										</div>
										<form:errors path="description" />
										<form:textarea class="form-control" path="description" />
									</div>

									<div class="venueDetaile">
										<div class="venueDetaileTitle">
											سعر القاعة &nbsp;&nbsp; <i class='fas fa-shekel-sign'
												style='font-size: 22px'></i>
										</div>
										<form:errors path="price" />
										<form:input class="form-control" type="number" path="price" />
									</div>

									<div class="venueDetaile">
										<div class="venueDetaileTitle">
											عدد الضيوف &nbsp;&nbsp; <i class='far fa-id-badge'
												style='font-size: 25px'></i>
										</div>
										<form:errors path="numOfGuests" />
										<form:input class="form-control" type="number"
											path="numOfGuests" />
									</div>
									<div class="venueDetaile">
										<div class="venueDetaileTitle">
											المصفات &nbsp; &nbsp; <i class='fas fa-car'
												style='font-size: 24px'></i>
										</div>
										<form:errors path="VenuePark" />
										<form:input class="form-control" path="VenuePark" />
									</div>

									<div class="venueDetaile">
										<div class="venueDetaileTitle">
											موقع القاعة &nbsp; &nbsp; <i class='fas fa-map-marker-alt'
												style='font-size: 24px'></i>
										</div>
										<form:errors path="location" />
										<form:select class="location-select" id="locations"
											name="location" path="location">
											<form:option value="الماصيون" />
											<form:option value="الأرسال" />
											<form:option value="أم الشرايط" />
											<form:option value="بيرزيت" />
											<form:option value="البيرة" />
											<form:option value="كفر عقب" />
										</form:select>
									</div>

									<div class="venueDetaile">
										<div class="venueDetaileTitle">
											للتواصل مع القاعة &nbsp; &nbsp; <i class="fa fa-phone"
												style="font-size: 22px"></i>
										</div>
										<form:errors path="venueContact" />
										<form:input class="form-control" path="venueContact" />
									</div>
									<div class="venue-a">
										<a class="round-black-btn" href="/adminVenuePage/${venue.id}">العودة
											إلى صفحة القاعة</a> <input type="submit" class="round-black-btn"
											value="حفظ التعديلات" />
									</div>
								</form:form>

							</div>
						</div>
					</div>
				</div>

				<ul class="nav nav-tabs" id="venueNavTabs">
					<li><a data-toggle="tab" href="#Reviews">تقييم القاعة</a></li>
					<li><a data-toggle="tab" href="#VenueLocation">موقع القاعة</a></li>
					<li><a data-toggle="tab" href="#VenueReservatio">حجوزات
							القاعة</a></li>
					<li class="active"><a data-toggle="tab" href="#VenueServices">خدمات
							القاعة</a></li>
				</ul>

				<div class="tab-content" id="venueTabContent">

					<div id="VenueServices" class="tab-pane fade in active">
						<h3>خدمات القاعة</h3>
						<form:form action="/adminVenuePage/${venue.id}/services/add"
							method="post" modelAttribute="venue">
							<c:forEach varStatus="us" var="service" items="${venue.services}">
								<tr>
									<td><form:input path="services[${us.index}].name" /></td>
									<td><form:input path="services[${us.index}].price" /></td>
									<form:input type="hidden" path="services[${us.index}].id" />
								</tr>
								<td><a
									href="/adminVenuePage/${venue.id}/services/delete/${service.id}">Delete</a></td>
								<br>
								<br>
							</c:forEach>
							<br>

							<input type="text" class="form-control"
								placeholder="الرجاء إدخال الخدمة" name="serviceName"
								required="required" />
							<br>
							<input type="number" class="form-control"
								placeholder="سعر الخدمة" name="servicePrice" required="required" />
							<div class="venue-a">
								<input type="submit" class="round-black-btn"
									value="إضافة الخدمة" />
							</div>
						</form:form>
					</div>

					<div id="VenueReservatio" class="tab-pane fade in">
						<h3>حجوزات القاعة</h3>
						<!-- <divclass="--noshadow" id="demoEvoCalendar"></div> -->
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
					</div>

					<div id="VenueLocation" class="tab-pane fade">
						<div id="map">
							<iframe src="<c:out value="${venue.mapOne}" />" width="500"
								height="400" style="border: 0;" allowfullscreen=""
								loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

							<iframe src="<c:out value="${venue.mapTwo}" />" width="500"
								height="400" style="border: 0;" allowfullscreen=""
								loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

						</div>
					</div>

					<div id="Reviews" class="tab-pane fade">
						<div class="review-heading">تقييم القاعة</div>
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