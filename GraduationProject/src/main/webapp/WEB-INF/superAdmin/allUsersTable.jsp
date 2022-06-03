
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
<title>جميع المستخدمين</title>
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


<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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


<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

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

<link rel="stylesheet" href="/fonts/icomoon/style.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/css/bootstrap.min.css">

<!-- Style -->
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
<link href="<c:url value="/resources/css/venuePage.css" />"
	rel="stylesheet">


<script src="/resources/js/modernizr-2.6.2.min.js"></script>

</head>
<body>
	<div class="fh5co-loader"></div>
	<nav class="fh5co-nav" role="navigation">
		<div class="container">
			<div class="row">
				<div class="col-xs-3">
					<div id="fh5co-logo">
						<img src="/resources/images/ring map logo.png" alt="logo"
							width="50px" height="60px" style="text-align: left;"> <a
							href="/index" style="text-align: right;">PalVenues<strong>.</strong></a>
					</div>
				</div>
				<div class="col-xs-9 text-right menu-1">
					<ul style="margin-top: 2%;">
						<li><a href="/index">الصفحة الرئيسية</a></li>
						<c:set var="userRole" scope="session" value="${userRole}" />
						<c:if test="${userRole == \"ROLE_ADMIN\"}">
							<li class="active"><a href="/adminVenuePage/${venueId}">قاعتي</a></li>
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
	<div class="container"
		style="padding: 10px; margin-top: 30px; text-align: right;">
		<form action="/superAdmin/users/search">
			<input type="text" name="freeText" placeholder="ابحث هنا"
				style="width: 90%; float: right; text-align: center; background-color: #ff9e69; border: 2px solid #cd7e53; border-radius: 30px;">
			<button class="btn btn-primary"
				style="background-color: #ff9e69; float: left;">ابحث</button>
		</form>
	</div>

	<section class="ftco-section" dir='rtl' lang='ar'>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">المستخدمين</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">
						<table class="table table-responsive-xl">
							<thead>
								<tr style="text-align: center;">
									<th>&nbsp;</th>
									<th>رقم المستخدم</th>
									<th>الايميل</th>
									<th>اسم المستخدم</th>
									<th>رقم الهاتف</th>
									<th>الدور</th>
									<th>تعيين</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${allUsers}" var="user">
									<tr class="alert" role="alert">
										<td><label class="checkbox-wrap checkbox-primary">
												<input type="checkbox" checked> <span
												class="checkmark"></span>
										</label></td>
										<td><c:out value="${user.id}" /></td>
										<td class="d-flex align-items-center">
											<div class="pl-3 email">
												<span><c:out value="${user.email}" /></span> <span><c:out
														value="${user.createdAt}" /></span>
											</div>
										</td>
										<td><c:out value="${user.username}" /></td>
										<td><c:out value="${user.mobileNumber}" /></td>
										<td><c:forEach items="${user.roles}" var="role">
												<c:out value="${role.name}" />
											</c:forEach></td>

										<td>
											<div class="container content">
												<div class="row align-items-center content">
													<div class="col-12 text-center">
														<c:forEach items="${user.roles}" var="role">
															<c:if test="${role.name=='ROLE_USER'}">
																<button type="button" class="btn btn-outline-warning"
																	data-toggle="modal" data-target="#exampleModalCenter"
																	id="${user.id}" onClick="reply_click(this.id)">

																	تعيين قاعة</button>
															</c:if>
															<%-- <c:if test="${role.name=='ROLE_ADMIN'}">
																<button type="button" class="btn btn-outline-warning"
																	data-toggle="modal" data-target="#exampleModalCenter"
																	id="${user.id}" onClick="reply_click(this.id)">

																	إعادة تعيين</button>
															</c:if> --%>
														</c:forEach>
													</div>
												</div>

											</div>
										</td>
										<td>
											<form id="delete-form" action="/superAdmin/${user.id}/delete"
												method="post">
												<input type="hidden" name="_method" value="delete">
												<button class="btn btn-danger" type="submit" value="Delete">
													<i class="fa fa-close"></i>
												</button>
											</form>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content rounded-0">
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
									style="font-family: Sacramento, 'Aref Ruqaa', serif, Arial, serif;">تعيين
									المستخدم للقاعة</h2>
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
								style="font-family: Sacramento, 'Aref Ruqaa', serif, Arial, serif;">تسجيل
								قاعة جديدة</h3>
							<p class="mb-4">يتم انشاء هذه القاعة و تعيينها للمستخد
								المختار , وذلك بإدخال اسم القاعة وموقعها كرابط لخارطتها .</p>
							<form:form action="/superAdmin/venues/add" method="post"
								modelAttribute="venue" class="form-outline">
								<div class="form-outline" style="padding: 5px;">
									<form:errors path="name" />
									<form:input class="form-control mr-3" path="name"
										placeholder="أدخل اسم القاعة" />
								</div>
								<div class="form-outline" style="padding: 5px;">
									<form:errors path="mapOne" />
									<form:input class="form-control mr-3" path="mapOne"
										placeholder="أدخل الرابط الاول لموقع القاعة" />
								</div>
								<div class="form-outline" style="padding: 5px;">
									<form:errors path="mapTwo" />
									<form:input class="form-control mr-3" path="mapTwo"
										placeholder="أدخل الرابط الثاني لموقع القاعة" />
								</div>
								<div>
									<form:errors path="user" />
									<form:input type="hidden" path="user" name="user_id_modal" />
								</div>

								<div class="form-outline">
									<input type="submit" class="btn btn-primary" value="إنشاء">
								</div>
							</form:form>
							<p class="mb-0 cancel">
								<a href="#" data-dismiss="modal">لاحقاً</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<footer id="fh5co-footer" role="contentinfo" class="fh5co-section-gray">
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



	<script src="/js/jquery-3.3.1.min.js"></script>
	<script src="/js/popper.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/main.js"></script>
	<script src="/js/jquery.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

	<script type="text/javascript">
		function reply_click(clicked_id) {
			console.log(clicked_id);
			$("input[name='user']").val(clicked_id);
		}
	</script>
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

