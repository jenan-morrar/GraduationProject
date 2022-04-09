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
							<li><a href="/index">الصفحة الرئيسية</a></li>
							<c:set var="userRole" scope="session" value="${userRole}" />
							<c:if test="${userRole == \"ROLE_ADMIN\"}">
								<li><a href="adminVenuePage">قاعتي</a></li>
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
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>

		<div class="pd-wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div id="myCarousel" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
							</ol>

							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item active">
									<img src="/resources/images/gloria_1.jpg" alt="Los Angeles"
										style="width: 100%;">
								</div>

								<div class="item">
									<img src="/resources/images/gloria_2.jpg" alt="Chicago"
										style="width: 100%;">
								</div>

								<div class="item">
									<img src="/resources/images/gloria_3.jpg" alt="New york"
										style="width: 100%;">
								</div>
							</div>

							<!-- Left and right controls -->
							<a class="left carousel-control" href="#myCarousel"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#myCarousel"
								data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<div class="col-md-6">
						<div class="product-dtl">
							<div class="product-info">
								<div class="product-name">Variable Product</div>
								<div class="reviews-counter">
									<div class="rate">
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
									<span>3 Reviews</span>
								</div>
								<div class="product-price-discount">
									<span>$39.00</span><span class="line-through">$29.00</span>
								</div>
							</div>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
							<div class="row">
								<div class="col-md-6">
									<label for="size">Size</label> <select id="size" name="size"
										class="form-control">
										<option>S</option>
										<option>M</option>
										<option>L</option>
										<option>XL</option>
									</select>
								</div>
								<div class="col-md-6">
									<label for="color">Color</label> <select id="color"
										name="color" class="form-control">
										<option>Blue</option>
										<option>Green</option>
										<option>Red</option>
									</select>
								</div>
							</div>
							<div class="product-count">
								<label for="size">Quantity</label>
								<form action="#" class="display-flex">
									<div class="qtyminus">-</div>
									<input type="text" name="quantity" value="1" class="qty">
									<div class="qtyplus">+</div>
								</form>
								<a href="#" class="round-black-btn">Add to Cart</a>
							</div>
						</div>
					</div>
				</div>

				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#Description">Description</a></li>
					<li><a data-toggle="tab" href="#Reviews">Reviews</a></li>
					<li><a data-toggle="tab" href="#location">location</a></li>
				</ul>

				<div class="tab-content">
					<div id="Description" class="tab-pane fade in active">
						<h3>HOME</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
							aute irure dolor in reprehenderit in voluptate velit esse cillum
							dolore eu fugiat nulla pariatur. Excepteur sint occaecat
							cupidatat non proident, sunt in culpa qui officia deserunt mollit
							anim id est laborum. Sed ut perspiciatis unde omnis iste natus
							error sit voluptatem accusantium doloremque laudantium, totam rem
							aperiam.</p>
					</div>
					<div id="Reviews" class="tab-pane fade">
						<div class="review-heading">REVIEWS</div>
						<p class="mb-20">There are no reviews yet.</p>
						<form class="review-form">
							<div class="form-group">
								<label>Your rating</label>
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
								<label>Your message</label>
								<textarea class="form-control" rows="10"></textarea>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<input type="text" name="" class="form-control"
											placeholder="Name*">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input type="text" name="" class="form-control"
											placeholder="Email Id*">
									</div>
								</div>
							</div>
							<button class="round-black-btn">Submit Review</button>
						</form>
					</div>
					<div id="location" class="tab-pane fade">
						<h3>Menu 2</h3>
						<p>Sed ut perspiciatis unde omnis iste natus error sit
							voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
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

</body>
</html>