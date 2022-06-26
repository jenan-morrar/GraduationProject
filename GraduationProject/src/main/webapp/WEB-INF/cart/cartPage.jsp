
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>حجوزاتي</title>

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



<!-- Modernizr JS -->
<script src="/resources/js/modernizr-2.6.2.min.js"></script>

<!-- Style -->
<!-- new -->
<!-- new -->

<link rel="stylesheet" href="/Modal/css/ionicons.min.css">



<link rel="stylesheet"
	href="<c:url value="/resources/css/imageSlider.css" />">
<link rel="stylesheet" href="/Modal/css/style.css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
<link href="<c:url value="/resources/css/venuePage.css" />"
	rel="stylesheet">

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/cartStyle.css">




<!-- script -->
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
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
							<c:if test="${userRole == \"ROLE_ADMIN\"}">
								<li><a href="/adminVenuePage/${venueId}/requests">طلبات
										الحجز</a></li>
							</c:if>
							<c:if test="${userRole == \"ROLE_SUPERADMIN\"}">
								<li><a href="/superAdmin/users">المستخدمين</a></li>
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
		<div class="container" dir="rtl" lang="ar">
			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row">
					<div class="col-md-9">
						<div class="ibox">
							<div class="ibox-title">
								<h2 style="text-align: right; padding-right: 10px;">حجوزاتي
									للقاعات</h2>
							</div>
							<div class="ibox-content">
								<div class="table-responsive">
									<table class="table shoping-cart-table">

										<tbody>
											<c:forEach items="${reservations}" var="reservation">
												<tr id="reservation_${reservation.id}">
													<td class="desc">
														<h3>
															<a href="#" class="text-navy"> <c:out
																	value="${reservation.venue.name}" />
															</a>
														</h3>
														<dl class="small m-b-none">
															<dt>تفاصيل الحجز</dt>
															<dd>
																تاريخ الحجز:
																<c:out value="${reservation.reservationDate}" />
															</dd>
															<dd>
																وقت البدأ :
																<c:out value="${reservation.fromTime}" />
															</dd>
															<dd>
																وقت الانتهاء :
																<c:out value="${reservation.toTime}" />
															</dd>
															<dd>
																حالة الحجز:
																<c:out value="${reservation.status}" />
															</dd>
															<dd>
																تم انشاء هذا الحجز:
																<c:out value="${reservation.createdAt}" />
															</dd>
															<dd>
																الخدمات المختارة :
																<c:forEach items="${reservation.services}" var="s">
																	<c:out value="${s.name}" />
																	<c:out value="${s.price}₪" />
																	<br>
																</c:forEach>
															</dd>
														</dl>
														<div class="m-t-sm">
															<a href="/reservation/${reservation.id}/edit/${reservation.venue.id}"> تعديل
																الحجز</a>
														</div>
														<div>
															<div class="wrap w-100">
																<button type="button"
																	class="btn btn-primary py-3 px-4 js-cancelReserve"
																	data-toggle="modal" data-target="#exampleModalCenter2"
																	data-id="${reservation.id}"
																	data-url="/sendEmail/${reservation.id}">الغاء
																	الحجز</button>
																<input type="hidden" value="${reservation.deleteCode}"
																	id="datbase_code">

															</div>
														</div>

													</td>
													<td><c:out value="${reservation.venue.price}₪"></c:out></td>
													<td width="65"><input type="hidden"
														class="form-control" placeholder="1"></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

							</div>
							<div class="ibox-content">
								<!-- <button class="btn btn-primary pull-right">
								<i class="fa fa fa-shopping-cart"></i> Checkout
							</button> -->
								<button class="btn btn-white">
									<i class="fa fa-arrow-left"></i> العودة الى صفحة القاعات
								</button>

							</div>
						</div>

					</div>
					<div class="col-md-3">
						<div class="ibox">
							<div class="ibox-title">
								<h5>ملخص الكارت</h5>
							</div>
							<div class="ibox-content">
								<span> المبلغ الكامل للدفع </span>
								<h2 class="font-bold">
									<c:set var="total" value="${0}" />
									<c:forEach items="${reservations}" var="reservation">
										<c:forEach items="${reservation.services}" var="s">
											<c:set var="total"
												value="${s.price + reservation.venue.price}₪" />
										</c:forEach>
									</c:forEach>
									<c:out value="${total}"></c:out>
								</h2>

								<hr>
								<!-- <span class="text-muted small"> *For United States, France
								and Germany applicable sales tax will be applied </span> -->
								<div class="m-t-sm">
									<!-- <div class="btn-group">
									<a href="#" class="btn btn-primary btn-sm"><i
										class="fa fa-shopping-cart"></i> Checkout</a> <a href="#"
										class="btn btn-white btn-sm"> Cancel</a>
								</div> -->
								</div>
							</div>
						</div>

						<div class="ibox">
							<div class="ibox-title">
								<h5>للدعم</h5>
							</div>
							<div class="ibox-content text-center">
								<h4>
									<i class="fa fa-phone"></i> +059-735-93-92
								</h4>
								<span class="small"> لأي استفسار تواصلوا معنا </span>
							</div>
						</div>

						<!-- <div class="ibox">
						<div class="ibox-content">

							<p class="font-bold">Other products you may be interested</p>
							<hr>
							<div>
								<a href="#" class="product-name"> Product 1</a>
								<div class="small m-t-xs">Many desktop publishing packages
									and web page editors now.</div>
								<div class="m-t text-righ">

									<a href="#" class="btn btn-xs btn-outline btn-primary">Info
										<i class="fa fa-long-arrow-right"></i>
									</a>
								</div>
							</div>
							<hr>
							<div>
								<a href="#" class="product-name"> Product 2</a>
								<div class="small m-t-xs">Many desktop publishing packages
									and web page editors now.</div>
								<div class="m-t text-righ">

									<a href="#" class="btn btn-xs btn-outline btn-primary">Info
										<i class="fa fa-long-arrow-right"></i>
									</a>
								</div>
							</div>
						</div>
					</div> -->
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<%-- 	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<!-- <div class="modal-content rounded-0"> -->
				<div class="modal-body bg-image overlay"
					style="background-image: url('/resources/images/simpleBackground.png');">

					<div class="line px-3 to-front">
						<div class="row align-items-center">
							<div class="col logo">
								<a href="#"><img src="/resources/images/ring map logo.png"
									alt="Image" class="img-fluid"></a>
							</div>
							<div class="col-md-8 text-center">
								<h2
									style="font-family: Sacramento, 'Aref Ruqaa', serif, Arial, serif;">تعديل
									على الحجز</h2>
							</div>
							<div class="col text-right">
								<a href="#" class="close-btn" data-dismiss="modal"
									aria-label="Close"> <span aria-hidden="true"><span
										class="icon-close2"></span></span>
								</a>
							</div>
						</div>
					</div>
					<div class="p-4 to-front">
						<div class="text-center">
							<h3
								style="font-family: Sacramento, 'Aref Ruqaa', serif, Arial, serif;">
								تفاصيل الحجز</h3>
							<p class="mb-4">يمكن تعديل التواريخ والأوقات المختارة في حال
								وجود حجوزات متوفرة .</p>
							<form:form action="/reservation/edit" method="post"
								modelAttribute="reservation" class="form-outline">
								<div class="form-outline" style="padding: 5px;">
									<form:errors path="reservationDate" />
									<form:input class="form-control mr-3" path="reservationDate"
										placeholder="أدخل اسم القاعة" />
								</div>
								
							</form:form>
							<p class="mb-0 cancel">
								<a href="#" data-dismiss="modal">الغاء</a>
							</p>
						</div>
					</div>
				</div>
			</div>

		</div> --%>


		<!-- new modal -->
		<div class="modal fade" id="exampleModalCenter2" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header ftco-degree-bg">
						<button type="button"
							class="close d-flex align-items-center justify-content-center"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true" class="ion-ios-close"></span>
						</button>
					</div>
					<div class="modal-body pt-md-0 pb-md-5 text-center">
						<h2>لقد وصلك بريد الكتروني !</h2>
						<div class="icon d-flex align-items-center justify-content-center">
							<img src="images/email.svg" alt="" class="img-fluid">
						</div>
						<h4 class="mb-2">يرجى كتابة رمز التأكيد الخاص بك</h4>
						<form class="js-form" data-action="/reservation/delete">
							<input type="hidden" name="reservation_id"> <input
								type="text" id="code_input" name="code_input">
							<button type="submit" id="cancel_button">الغاء الحجز</button>
						</form>
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

	<!-- this script is to check the code the user has entered  -->
	<script>
		function toggleLoader(action) {

			if (action === 'show') {
				$('.fh5co-loader').show();
			} else if (action === 'hide') {
				$('.fh5co-loader').hide();
			}
		}

		var _ajaxIsSending = false;
		$('.js-cancelReserve').click(
				function(e) {
					e.preventDefault();
					if (_ajaxIsSending) {
						return;
					}

					var _clickedBtn = $(this);
					var _url = _clickedBtn.attr('data-url');
					$("#exampleModalCenter2").find("[name='reservation_id']")
							.val(_clickedBtn.attr('data-id'));

					$("#exampleModalCenter2").modal("show").addClass('show');
					$('.modal-backdrop').addClass('show').removeClass('hide');

					$.ajax({
						url : _url,
						method : "GET",
						//dataType:"JSON",
						//contentType:"JSON",
						data : {
						// id: _clickedBtn.attr('data-id')
						},
						beforeSend : function() {
							// Show the loader
							_ajaxIsSending = true;
							toggleLoader('show');
						},
						success : function(response) {
							console.log("response", response);
							$("#exampleModalCenter2").modal("show");
						},
						error : function(xhr) {
							console.log("xhr", xhr);
							alert("Error");
							//$("#exampleModalCenter2").modal("show");
						},
						complete : function() {
							// Hide the loader
							_ajaxIsSending = false;
							toggleLoader('hide');
						},
					});
					console.log('_clickedBtn', _url);
				});

		$('.js-form').submit(
				function(e) {
					e.preventDefault();
					if (_ajaxIsSending) {
						return;
					}
					var _submittedForm = $(this);
					var _url = _submittedForm.attr('data-action');

					var reservation_id = _submittedForm.find(
							"[name='reservation_id']").val();

					$.ajax({
						url : _url,
						method : "POST",
						// dataType : "JSON",
						// contentType : "JSON", 
						data : _submittedForm.serialize(),
						beforeSend : function() {
							// Show the loader
							_ajaxIsSending = true;
							toggleLoader('show');
						},
						success : function(response) {
							alert(response);
							$("#reservation_" + reservation_id).remove();

							$("#exampleModalCenter2").modal("hide").addClass(
									'hide').removeClass('show');
							$('.modal-backdrop').addClass('hide').removeClass(
									'show');
						},
						error : function(xhr) {
							alert(xhr.responseText);
						},
						complete : function() {
							// Hide the loader
							_ajaxIsSending = false;
							toggleLoader('hide');
						},
					});
				});
	</script>


	<script src="/js/jquery-3.3.1.min.js"></script>
	<script src="/js/popper.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/main.js"></script>
	<script src="/js/jquery.min.js"></script>

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