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
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css'>
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
	href="<c:url value="/resources/css/venueCard.css" />">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
<link href="<c:url value="/resources/css/venuePage.css" />"
	rel="stylesheet">

<!-- Modernizr JS -->
<script src="/resources/js/modernizr-2.6.2.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(
			function() {
				$("#myInput").on(
						"keyup",
						function() {
							var value = $(this).val().toLowerCase();
							$("#venueCardStyle div").filter(
									function() {
										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});
						});
			});
</script>
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

		<div class="row">
			<div class="col-md-8" id="venues-card-item">
				<input id="myInput" type="text" placeholder="...ابحث"
					class="form-control"
					style="width: 80%; float: right; margin-right: 4%"><br>
				<br>
				<c:if test="${filterSearchResult1.size()==0}">
					<div id="venueCardStyle">
						<c:forEach items="${venues}" var="venueCard">
							<div class="col-md-4" id="venueCardStyle">
								<div class="product-grid">
									<span class="product-image"> <c:if
											test="${venueCard.images.size()==0}">
											<a href="/venuePage/${venueCard.id}" class="image"> <img
												class="pic-1" style="height: 200px;"
												src="/resources/images/noImage.jpg">
											</a>
										</c:if> <c:forEach var="images" items="${venueCard.images}"
											varStatus="loop">
											<c:if test="${loop.first}">
												<a href="/venuePage/${venueCard.id}" class="image"> <img
													class="pic-1"
													src="<c:out value="/user-photos/${venueCard.id}/${images.image}"/>">
												</a>
											</c:if>
										</c:forEach>
									</span>
									<div class="product-content">

										<h3 class="title">
											<a href="/venuePage/${venueCard.id}"><c:out
													value="${venueCard.name}" /></a>
											<h4>${venueCard.location }</h4>

										</h3>
										<a class="add-to-cart" href="/venuePage/${venueCard.id}">اذهب
											إلى القاعة</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>
				<c:if test="${filterSearchResult1.size() > 0}">
					<div id="venueCardStyle">
						<c:forEach items="${filterSearchResult1}" var="venueCard">
							<div class="col-md-4" id="venueCardStyle">
								<div class="product-grid">
									<span class="product-image"> <c:if
											test="${venueCard.images.size()==0}">
											<a href="/venuePage/${venueCard.id}" class="image"> <img
												class="pic-1" style="height: 200px;"
												src="/resources/images/noImage.jpg">
											</a>
										</c:if> <c:forEach var="images" items="${venueCard.images}"
											varStatus="loop">
											<c:if test="${loop.first}">
												<a href="/venuePage/${venueCard.id}" class="image"> <img
													class="pic-1"
													src="<c:out value="/user-photos/${venueCard.id}/${images.image}"/>">
												</a>
											</c:if>
										</c:forEach>
									</span>
									<div class="product-content">

										<h3 class="title">
											<a href="/venuePage/${venueCard.id}"><c:out
													value="${venueCard.name}" /></a>
											<h4>${venueCard.location }</h4>

										</h3>
										<a class="add-to-cart" href="/venuePage/${venueCard.id}">اذهب
											إلى القاعة</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>


			</div>
			<!-- <div class="col-md-4">
				<form action="" method="post">
					<input type="hidden" name="_method" value="put">
					<div id="filter-search">
						<div class="filter-search-items">
							<label>موقع القاعة</label> <br> <select id="locations"
								name="location">
								<option value="location1">الماصيون</option>
								<option value="location2">الأرسال</option>
								<option value="location3">أم الشرايط</option>
								<option value="location4">بيرزيت</option>
								<option value="location5">البيرة</option>
								<option value="location6">كفر عقب</option>
							</select>

						</div>
						<div class="filter-search-items">
							<label>سعر القاعة</label> <br> <select id="price"
								name="price">
								<option value="price1">2000 - 4000</option>
								<option value="price2">4000 - 7000</option>
								<option value="price3">7000 - 10000</option>
								<option value="price4">10000 - 15000</option>
								<option value="price5">15000 - 20000</option>
								<option value="price5">20000 - 25000</option>
								<option value="price5">25000 - 30000</option>
								<option value="price5">>30000</option>
							</select>
						</div>
						<div class="filter-search-items">
							<label>عدد الضيوف</label> <br> <select id="numOfGuests"
								name="numOfGuests">
								<option value="numOfGuests1">50 - 100</option>
								<option value="numOfGuests2">100 - 200</option>
								<option value="numOfGuests3">200 - 300</option>
								<option value="numOfGuests4">300 - 400</option>
								<option value="numOfGuests5">400 - 500</option>
								<option value="numOfGuests6">500 - 600</option>
								<option value="numOfGuests6">600 - 700</option>
								<option value="numOfGuests6">700 - 800</option>
								<option value="numOfGuests6">800 - 900</option>
								<option value="numOfGuests6">900 - 1000</option>
							</select>
						</div>


						<div class="venue-a">
							<input type="submit" class="round-black-btn"
								value="ابحث عن القاعة" />
						</div>
					</div>
				</form>
			</div>-->

			<div class="col-md-3">
				<div class="wrapper-slider">
					<form:form method="POST" action="/venues"
						modelAttribute="filterSearch">
						<div class="filter-search-items">
							<label>موقع القاعة</label> <br>
							<form:select id="locations" name="location" path="location">
								<form:option value="الماصيون" />
								<form:option value="الأرسال" />
								<form:option value="أم الشرايط" />
								<form:option value="بيرزيت" />
								<form:option value="البيرة" />
								<form:option value="كفر عقب" />
							</form:select>
						</div>
						<div id="price-slider">
							<div class="filter-search-items">
								<label>سعر القاعة</label> <br>
								<div class="price-input">
									<div class="field">
										<span>الحد الأدنى</span>
										<form:input type="number" class="input-min" value="2500"
											path="minPrice" />
									</div>
									<div class="separator">-</div>
									<div class="field">
										<span>الحد الأقصى</span>
										<form:input type="number" class="input-max" value="7500"
											path="maxPrice" />
									</div>
								</div>
								<div class="slider">
									<div class="progress"></div>
								</div>
								<div class="range-input">
									<form:input type="range" class="range-min" min="0" max="10000"
										value="2500" step="100" path="minPrice" />
									<form:input type="range" class="range-max" min="0" max="10000"
										value="7500" step="100" path="maxPrice" />
								</div>
							</div>
						</div>

						<div id="numOfguests-slider">
							<div class="filter-search-items">
								<label>عدد الضيوف</label> <br>
								<div class="numOfGuests-input">
									<div class="field">
										<span>الحد الأدنى</span>
										<form:input type="number" class="input2-min"
											path="minNumOfGuests" />
									</div>
									<div class="separator">-</div>
									<div class="field">
										<span>الحد الأقصى</span>
										<form:input type="number" class="input2-max"
											path="maxNumOfGuests" />
									</div>
								</div>
								<div class="slider2">
									<div class="progress"></div>
								</div>
								<div class="range2-input">
									<form:input type="range" class="range2-min" min="0" max="2000"
										value="2500" step="100" path="minNumOfGuests" />
									<form:input type="range" class="range2-max" min="0" max="2000"
										value="7500" step="100" path="maxNumOfGuests" />
								</div>
							</div>
						</div>

						<div class="venue-a" style="margin-top: 5%;">
							<input type="submit" class="round-black-btn"
								value="ابحث عن القاعة" /> <a href="#" class="round-black-btn">عرض
								جميع القاعات</a>
						</div>

					</form:form>
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
	<script src="/resources/js/venuesSlider.js"></script>
	<script src="/resources/js/main.js"></script>
</body>
</html>