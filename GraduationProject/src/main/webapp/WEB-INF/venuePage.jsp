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

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>

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

<!-- For Rating -->
<link data-require="fontawesome@*" data-semver="4.5.0" rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.css" />

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
	href="<c:url value="/resources/css/rating.css" />">

<link rel="stylesheet"
	href="<c:url value="/resources/css/venueCard.css" />">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/imageSlider.css" />">
<link href="<c:url value="/resources/css/venuePage.css" />"
	rel="stylesheet">

<!-- Modernizr JS -->
<script src="/resources/js/modernizr-2.6.2.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.17/dist/sweetalert2.all.min.js"></script>

<link rel="stylesheet"
	href="<c:url value="/resources/css/reservationsRequests.css" />">

</head>
<body>
	<div class="fh5co-loader"></div>

	<div id="page">
		<nav class="fh5co-nav" role="navigation">
			<div class="container">
				<div class="row">
					<div class="col-xs-3">
						<div id="fh5co-logo">
							<img src="/resources/images/ring map logo.png" alt="logo"
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
							<%-- <c:if test="${userRole == \"ROLE_ADMIN\"}">
								<li><a href="/adminVenuePage/${venueId}">قاعتي</a></li>
							</c:if>
							<c:if test="${userRole == \"ROLE_ADMIN\"}">
								<li><a href="/adminVenuePage/${venueId}/requests">طلبات
										الحجز</a></li>
							</c:if> --%>
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
										<c:set var="venueRatingValue" scope="session"
											value="${venueRatingValue}" />

										<!-- <input type="radio" id="star5" name="rate" value="5" /> <label
											for="star5" title="text">5 stars</label> <input type="radio"
											id="star4" name="rate" value="4" /> <label for="star4"
											title="text">4 stars</label> <input type="radio" id="star3"
											name="rate" value="3" /> <label for="star3" title="text">3
											stars</label> <input type="radio" id="star2" name="rate" value="2" />
										<label for="star2" title="text">2 stars</label> <input
											type="radio" id="star1" name="rate" value="1" /> <label
											for="star1" title="text">1 star</label>
												<c:out value="${venueRatingValue}"></c:out>
										<c:out
											value="${(venueRatingValue + venueRatingValue)/venueRatingValue}"></c:out> -->

										<c:forEach begin="1" end="5" varStatus="loop">

											<c:choose>
												<c:when test="${venueRatingValue == 5 and loop.index==1}">
													<input type="radio" id="star1" name="rate" value="1"
														checked />
													<label for="star1" title="text">1 star</label>
												</c:when>
												<c:when test="${venueRatingValue == 4 and loop.index==2}">
													<input type="radio" id="star2" name="rate" value="2"
														checked />
													<label for="star2" title="text">2 star</label>
												</c:when>
												<c:when test="${venueRatingValue == 3 and loop.index==3}">
													<input type="radio" id="star3" name="rate" value="3"
														checked />
													<label for="star3" title="text">3 star</label>
												</c:when>
												<c:when test="${venueRatingValue == 2 and loop.index==4}">
													<input type="radio" id="star4" name="rate" value="4"
														checked />
													<label for="star4" title="text">4 star</label>
												</c:when>
												<c:when test="${venueRatingValue == 1 and loop.index==5}">
													<input type="radio" id="star5" name="rate" value="5"
														checked />
													<label for="star5" title="text">5 star</label>
												</c:when>
												<c:otherwise>
													<input type="radio" id="star${loop.index }" name="rate"
														value="${loop.index }" />
													<label for="star${loop.index }" title="text">${loop.index }
														star</label>
												</c:otherwise>
											</c:choose>

										</c:forEach>
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
								<span class="venueDetaile-span"><c:out
										value="${venuePage.description}" /></span>
							</div>
							<div class="venueDetaile">
								<div class="venueDetaileTitle">
									سعر القاعة &nbsp;&nbsp; <i class='fas fa-shekel-sign'
										style='font-size: 22px'></i>
								</div>
								<span class="venueDetaile-span"><c:out
										value="${venuePage.price}" /></span>
							</div>

							<div class="venueDetaile">
								<div class="venueDetaileTitle">
									عدد الضيوف &nbsp;&nbsp; <i class='far fa-id-badge'
										style='font-size: 25px'></i>
								</div>
								<span class="venueDetaile-span"><c:out
										value="${venuePage.numOfGuests}" /></span>
							</div>

							<div class="venueDetaile">
								<div class="venueDetaileTitle">
									المصفات &nbsp; &nbsp; <i class='fas fa-car'
										style='font-size: 24px'></i>
								</div>
								<span class="venueDetaile-span"><c:out
										value="${venuePage.venuePark}" /></span>
							</div>

							<div class="venueDetaile">
								<div class="venueDetaileTitle">
									موقع القاعة &nbsp; &nbsp; <i class='fas fa-map-marker-alt'
										style='font-size: 24px'></i>
								</div>
								<span class="venueDetaile-span"><c:out
										value="${venuePage.location}" /></span>
							</div>

							<div class="venueDetaile">
								<div class="venueDetaileTitle">
									للتواصل مع القاعة &nbsp; &nbsp; <i class="fa fa-phone"
										style="font-size: 22px"></i>
								</div>
								<span class="venueDetaile-span"><c:out
										value="${venuePage.venueContact}" /></span>
							</div>

						</div>
					</div>
				</div>

				<ul class="nav nav-tabs" id="venueNavTabs">
					<li><a class="venueNavTabs-tilte" data-toggle="tab"
						href="#Reviews">تقييم القاعة</a></li>
					<li><a class="venueNavTabs-tilte" data-toggle="tab"
						href="#venueLocation">موقع القاعة</a></li>
					<li><a class="venueNavTabs-tilte" data-toggle="tab"
						href="#VenueServices">خدمات القاعة</a></li>
					<li class="active"><a class="venueNavTabs-tilte"
						data-toggle="tab" href="#VenueReservatio">حجز القاعة</a></li>
				</ul>

				<div class="tab-content" id="venueTabContent">
					<div id="VenueReservatio" class="tab-pane fade in active">
						<c:if test="${userName == \"noUser\"}">
							<h3 id="reservation-no-user">
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
								res.status = "${reservation.status}";
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

							<c:set var="conflictTime" scope="session" value="${conflictTime}" />
							<c:set var="toTimeAfterFromTime" scope="session"
								value="${toTimeAfterFromTime}" />
							<c:set var="wayOfPayment" scope="session" value="${wayOfPayment}" />

							<script type="text/javascript">
								<c:if test="${wayOfPayment == \"cach\" }">
								
								<c:if test="${conflictTime == \"conflictTime\" }">
								Swal
										.fire({
											icon : 'error',
											title : 'لا يمكن اتمام عملية الحجز',
											text : 'يوجد حجز في هذا الموعد اختر موعد آخر'
										});
								</c:if>
								<c:if test="${toTimeAfterFromTime == \"noToTimeAfterFromTime\" }">
								Swal
										.fire({
											icon : 'error',
											title : 'لا يمكن اتمام عملية الحجز',
											text : 'يجب أن يكون تاريخ انتهاء الحجز بعد تاريح بدء الحجز'
										});
								</c:if>
								
								<c:if test="${conflictTime != \"conflictTime\" }">
								<c:if test="${toTimeAfterFromTime != \"noToTimeAfterFromTime\" }">
								Swal
										.fire({
											icon : 'success',
											title : 'لقد قمت بعمل حجز اولي, لإتمام هذا الحجز يجب دفع العربون لصاحب القاعة',
											text : 'إذا لم يتم الدفع خلال يوم واحد كحد أقصى سيتم حذف هذا الحجز'
										});
								</c:if>
								</c:if>
								</c:if>
							</script>

							<div class="user" id="add-event-form"
								style="margin-top: 3%; display: none;">
								<form:form method="post" action="/venuePage/${venuePage.id}"
									modelAttribute="reservation" class="reservationForm"
									id="reservation-form-submit">
									<label>اختر ما يلي لحجز القاعة</label>
									<br>
									<form:input type="time" id="from" name="from" path="startTime"
										value="17:00" required="required" />
									<label for="from">من الساعة</label>
									<br>
									<form:input type="time" id="to" name="to" path="endTime"
										value="21:00" required="required" />
									<label for="to">إلى الساعة</label>
									<br>
									<label id="payment-way">طريقة الدفع</label>
									<div id="payment-way-radio">
										كاش
										<form:radiobutton path="wayOfPayment" value="cach"
											required="required" />
										&nbsp; &nbsp; &nbsp; PayPAl
										<form:radiobutton path="wayOfPayment" value="paypal"
											required="required" />
									</div>

									<div class="dropdown">
										<button class="btn btn-default dropdown-toggle" type="button"
											id="dropdownMenu1" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="true"
											style="font-size: 20px; color: #cd7e53;">
											اختر من خدمات القاعة &nbsp;<span class="caret"></span>
										</button>
										<ul class="dropdown-menu checkbox-menu allow-focus"
											style="left: auto;" aria-labelledby="dropdownMenu1">
											<c:forEach items="${venuePage.services}" var="services"
												varStatus="loop">
												<li><label style="font-size: 16px;"> &nbsp; <i
														class='fas fa-shekel-sign' style='font-size: 10px'></i> <c:out
															value="${services.price}" /> &nbsp;&nbsp;&nbsp; <c:out
															value="${services.name}" /> <form:checkbox
															value="${services.id}" id="${services.id}"
															path="services" />
												</label></li>
											</c:forEach>
										</ul>
									</div>
									<script>
										$(".checkbox-menu")
												.on(
														"change",
														"input[type='checkbox']",
														function() {
															$(this)
																	.closest(
																			"li")
																	.toggleClass(
																			"active",
																			this.checked);
														});
										$(document).on('click', '.allow-focus',
												function(e) {
													e.stopPropagation();
												});
									</script>

									<%-- <form:radiobutton name="gender" value="chash" path="wayOfPayment" />دفع كاش
			                        <form:radiobutton type="radio" name="gender" value="paypal" path="wayOfPayment" />دفع بواسطة PayPal --%>

									<form:input type="date" value="" id="event-date"
										style="display: none;" path="reservationDate" />

									<input type="submit" id="reserveButt" class="round-black-btn"
										value="إحجز الآن" onclick="conflictReservatiosn()" />

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
								res.status = "${reservation.status}";
								reservationsjs.push(res);
								</c:forEach>
								$("#reservations").val(
										JSON.stringify(reservationsjs));
							</script>

							<div class="--noshadow" id="demoEvoCalendar"></div>
						</c:if>
					</div>

					<div id="VenueServices" class="tab-pane fade">
						<table class="service-table">
							<tr>
								<th>سعر الخدمة</th>
								<th>اسم الخدمة</th>
							</tr>
							<c:forEach items="${venuePage.services}" var="service">

								<tr>
									<td><i class='fas fa-shekel-sign' style='font-size: 10px'></i>
										<c:out value="${service.price}" /></td>
									<td><c:out value="${service.name}" /></td>
								</tr>
							</c:forEach>
						</table>
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
							<h3 id="rating-no-user">
								لتقييم القاعة يجب <a href="/login">تسجيل الدخول</a>
							</h3>


							<h3 id="rating2-no-user">تقيمات القاعة</h3>
							<div>
								<c:set var="venueRatingsResults" scope="session"
									value="${venueRatingsResult}" />
								<div class="rating-slider">
									<div class="rating-slides">
										<c:forEach items="${venueRatingsResults}"
											var="venueRatingsResult" varStatus="loop">

											<div id="#slide-${loop.index}">
												<div>
													<div class="rating-title" id="first-rating-tilte">اسم
														المستخدم</div>
													<div>
														<c:out value="${venueRatingsResult.senderName}" />
													</div>
												</div>
												<div>
													<div class="rating-title">تقييم القاعة</div>

													<c:choose>
														<c:when test="${venueRatingsResult.rating ==1}">
															<div>
																<span class="fa fa-star checked"></span> <span
																	class="fa fa-star "></span> <span class="fa fa-star "></span>
																<span class="fa fa-star"></span> <span
																	class="fa fa-star"></span>
															</div>
														</c:when>
														<c:when test="${venueRatingsResult.rating ==2}">
															<div>
																<span class="fa fa-star checked"></span> <span
																	class="fa fa-star checked"></span> <span
																	class="fa fa-star "></span> <span class="fa fa-star"></span>
																<span class="fa fa-star"></span>
															</div>
														</c:when>
														<c:when test="${venueRatingsResult.rating ==3}">
															<div>
																<span class="fa fa-star checked"></span> <span
																	class="fa fa-star checked"></span> <span
																	class="fa fa-star checked"></span> <span
																	class="fa fa-star"></span> <span class="fa fa-star"></span>
															</div>
														</c:when>
														<c:when test="${venueRatingsResult.rating ==4}">
															<div>
																<span class="fa fa-star checked"></span> <span
																	class="fa fa-star checked"></span> <span
																	class="fa fa-star checked"></span> <span
																	class="fa fa-star checked"></span> <span
																	class="fa fa-star"></span>
															</div>
														</c:when>
														<c:when test="${venueRatingsResult.rating ==5}">
															<div>
																<span class="fa fa-star checked"></span> <span
																	class="fa fa-star checked"></span> <span
																	class="fa fa-star checked"></span> <span
																	class="fa fa-star checked"></span> <span
																	class="fa fa-star checked"></span>
															</div>
														</c:when>
														<c:otherwise>
															<div>
																<span class="fa fa-star"></span> <span
																	class="fa fa-star"></span> <span class="fa fa-star"></span>
																<span class="fa fa-star"></span> <span
																	class="fa fa-star"></span>
															</div>
														</c:otherwise>
													</c:choose>

												</div>
												<div>
													<div class="rating-title">تعليقه على القاعة</div>

													<div>
														<c:out value="${venueRatingsResult.ratingMasseag}" />
													</div>
												</div>

											</div>

										</c:forEach>
									</div>
								</div>
							</div>

						</c:if>
						<c:if test="${userName == \"user\"}">
							<form:form method="POST"
								action="/venuePage/${venuePage.id}/rating"
								modelAttribute="venueRate" class="review-form">
								<div class="form-group">

									<label class="rating-label">تقيمك للقاعة</label>
									<div class="reviews-counter">

										<form:input type="number" name="rating" id="rating-input"
											min="1" max="5" style="display: none;" path="rating" />

										<div class="rating" role="optgroup">
											<!-- in Rails just use 1.upto(5) -->
											<i class="fa fa-star-o fa-2x rating-star" id="rating-1"
												data-rating="1" tabindex="0"
												aria-label="Rate as one out of 5 stars" role="radio"></i> <i
												class="fa fa-star-o fa-2x rating-star" id="rating-2"
												data-rating="2" tabindex="0"
												aria-label="Rate as two out of 5 stars" role="radio"></i> <i
												class="fa fa-star-o fa-2x rating-star" id="rating-3"
												data-rating="3" tabindex="0"
												aria-label="Rate as three out of 5 stars" role="radio"></i>
											<i class="fa fa-star-o fa-2x rating-star" id="rating-4"
												data-rating="4" tabindex="0"
												aria-label="Rate as four out of 5 stars" role="radio"></i> <i
												class="fa fa-star-o fa-2x rating-star" id="rating-5"
												data-rating="5" tabindex="0"
												aria-label="Rate as five out of 5 stars" role="radio"></i>
										</div>
										<!--<div class="rate">
											<input type="radio" id="star5" name="rate" value="5" /> <label
												for="star5" title="text">5 stars</label> <input type="radio"
												id="star4" name="rate" value="4" /> <label for="star4"
												title="text">4 stars</label> <input type="radio" id="star3"
												name="rate" value="3" /> <label for="star3" title="text">3
												stars</label> <input type="radio" id="star2" name="rate" value="2" />
											<label for="star2" title="text">2 stars</label> <input
												type="radio" id="star1" name="rate" value="1" /> <label
												for="star1" title="text">1 star</label></div>-->
									</div>
								</div>
								<div class="form-group" style="clear: both;">
									<label class="rating-label">اكتب تقيمك</label>
									<form:textarea class="form-control" rows="10"
										path="ratingMasseag" required="required" />
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<form:input type="text" name="" class="form-control"
												placeholder="اسم المستخدم" required="required"
												path="senderName" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<form:input type="text" name="" class="form-control"
												placeholder="ايميل المستخدم" required="required"
												path="senderEmail" />
										</div>
									</div>
								</div>
								<input type="submit" value="أضف تقيميك" class="round-black-btn"
									id="rating-submit-butt">
							</form:form>
						</c:if>
					</div>
				</div>

			</div>
		</div>
		<!-- Recommendation results -->

		<div class="col-md-8" id="venues-card-item"
			style="float: right; padding: 15px; margin: 11.534px;">
			<div id="venueCardStyle">
				<h1
					style="text-align: right; color: #cd7e53; padding: 30px; border-bottom: 2px solid #cd7e53;">قاعات
					مشابهة قد تعجبك</h1>
				<!-- <div>
						<hr style="color:#cd7e53;">
					</div> -->
				<c:forEach items="${recommendedVenues}" var="venueCard">
					<div class="col-md-4" id="venueCardStyle" style="float: right;">
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
	<script src="/resources/js/rating.js"></script>
	<script src="/resources/js/main.js"></script>
	<script src="/resources/js/imageSlider.js"></script>
	<script src="/resources/js/evo-calendar.js"></script>
	<script src="/resources/js/demo.js"></script>




</body>
</html>