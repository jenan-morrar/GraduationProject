<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>طلبات الحجز</title>
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
<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
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
										<li class="active"><a
											href="/adminVenuePage/${venueId}/requests">طلبات الحجز</a></li>
										<li><a href="/adminVenuePage/${venueId}/venueReservation">حجوزات
												القاعة </a></li>
									</ul></li>
							</c:if>
							<%-- 							<c:if test="${userRole == \"ROLE_ADMIN\"}">
								<li><a href="/adminVenuePage/${venueId}">قاعتي</a></li>
							</c:if>
							<c:if test="${userRole == \"ROLE_ADMIN\"}">
								<li class="active"><a
									href="/adminVenuePage/${venueId}/requests">طلبات الحجز</a></li>
							</c:if> --%>
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

		<div style="overflow-x: auto;">
			<table class="service-table"
				style="margin-top: 3%; margin-bottom: 3%;">
				<tr>
					<th></th>
					<th>نهاية الحجز</th>
					<th>بداية الحجز</th>
					<th>تاريخ الحجز</th>
					<th>اسم الشحص</th>
					<th>رقم الحجز</th>

				</tr>
				<c:forEach items="${reservationResult}" var="reservationResultItem"
					varStatus="loop">
					<tr>
						<td>
							<form id="delete-form"
								action="/adminVenuePage/${venueId}/requests/${reservationResultItem.id}/delete">
							</form> <a id="delete-reservation" onclick="deleteReservation()"
							href="#" class="x">&#10006;</a> <script type="text/javascript">
								function deleteReservation() {
									Swal.fire({
										  title: 'هل تريد حذف الحجز ${reservationResultItem.id} ؟',
										  text: "لا تستطيع إرجاع ما يتم حذفه",
										  icon: 'warning',
										  showCancelButton: true,
										  confirmButtonColor: '#3085d6',
										  cancelButtonColor: '#d33',
										  confirmButtonText: 'حذف'
										}).then((result) => {
										  if (result.isConfirmed) {
										    Swal.fire(
										      'تم الحذف',
										      'هذا الحجز تم حذفه بنجاح',
										      'success'
										    ).then((result) => {
										    	  if (result.isConfirmed) {
														document.getElementById("delete-form").submit();
										    		  }
										    		});
										  }
										});
								}
							</script>

							<form id="approve-form"
								action="/adminVenuePage/${venueId}/requests/${reservationResultItem.id}/approve">
							</form> <a id="delete-reservation" onclick="approveReservation()"
							href="#" class="checkmark">&#10004;</a> <script
								type="text/javascript">
								function approveReservation() {
									Swal.fire({
										  title: 'هل تريد تأكيد الحجز ${reservationResultItem.id} ؟',
										  text: "بعد التثبيت لا يمكن حذف الحجز",
										  icon: 'warning',
										  showCancelButton: true,
										  confirmButtonColor: '#3085d6',
										  cancelButtonColor: '#d33',
										  confirmButtonText: 'قم بالتثبيت'
										}).then((result) => {
										  if (result.isConfirmed) {
										    Swal.fire(
										      'تم التثبيت بنجاح',
										      'هذا الحجز تم ثبيته',
										      'success'
										    ).then((result) => {
										    	  if (result.isConfirmed) {
														document.getElementById("approve-form").submit();
										    		  }
										    		});
										  }
										});
								}
							</script>
						</td>

						<%-- <td><button id="myBtn${loop.index}">عرض التفاصيل</button> <!-- The Modal -->
							<div id="myModal" class="detail-modal">

								<!-- Modal content -->
								<div class="modal-content">
									<span class="close">&times;</span>
									<div class="grid-container">

										<div>
											<h2>الخدمات المطلوبة</h2>
											<c:forEach items="${reservationResultItem.services}"
												var="service">
												<i class='fas fa-shekel-sign' style='font-size: 10px'></i>
												<c:out value="${service.price}"></c:out>
												<c:out value="${service.name}"></c:out>
												<br>
											</c:forEach>
										</div>

										<div>
											<h2>قائمة الأغاني</h2>
											<p id="songs_display"></p>
											<p id="songs-string-item">
												<c:out value="${reservationResultItem.userSongs.songs}"></c:out>
											</p>
											<script type="text/javascript">
												var songsString = document
														.getElementById("songs-string-item");
												songsString.innerHTML = songsString.innerHTML
														.replace(',', '<br>');
												;
											</script>

										</div>

									</div>

								</div>

							</div> <script type="text/javascript">
								// Get the modal
								var modal = document.getElementById("myModal");

								// Get the button that opens the modal
								var index = $
								{
									loop.index
								};
								var btn = document.getElementById("myBtn"
										+ index);

								// Get the <span> element that closes the modal
								var span = document
										.getElementsByClassName("close")[0];

								// When the user clicks on the button, open the modal
								btn.onclick = function() {
									modal.style.display = "block";
								}

								// When the user clicks on <span> (x), close the modal
								span.onclick = function() {
									modal.style.display = "none";
								}

								// When the user clicks anywhere outside of the modal, close it
								window.onclick = function(event) {
									if (event.target == modal) {
										modal.style.display = "none";
									}
								}
							</script></td> --%>
						<td>${reservationResultItem.fromTime}</td>
						<td>${reservationResultItem.toTime}</td>
						<td>${reservationResultItem.reservationDate}</td>
						<td>${reservationResultItem.user.username}</td>
						<td>${reservationResultItem.id}</td>
					</tr>

				</c:forEach>
			</table>
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

	<!-- 	<script>
		var responsiveSlider = function() {

			var slider = document.getElementById("slider");
			var sliderWidth = slider.offsetWidth;
			var slideList = document.getElementById("slideWrap");
			var count = 1;
			var items = slideList.querySelectorAll("li").length;
			var prev = document.getElementById("prev");
			var next = document.getElementById("next");

			window.addEventListener('resize', function() {
				sliderWidth = slider.offsetWidth;
			});

			var prevSlide = function() {
				if (count > 1) {
					count = count - 2;
					slideList.style.left = "-" + count * sliderWidth + "px";
					count++;
				} else if (count = 1) {
					count = items - 1;
					slideList.style.left = "-" + count * sliderWidth + "px";
					count++;
				}
			};

			var nextSlide = function() {
				if (count < items) {
					slideList.style.left = "-" + count * sliderWidth + "px";
					count++;
				} else if (count = items) {
					slideList.style.left = "0px";
					count = 1;
				}
			};

			next.addEventListener("click", function() {
				nextSlide();
			});

			prev.addEventListener("click", function() {
				prevSlide();
			});

			setInterval(function() {
				nextSlide()
			}, 5000);

		};

		window.onload = function() {
			responsiveSlider();
		}
	</script>
 -->

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