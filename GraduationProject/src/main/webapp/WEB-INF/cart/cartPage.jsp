
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!doctype html>
<html dir="rtl" lang="ar">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>حجوزاتي</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


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
<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/cartStyle.css">
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
</head>
<body>
	<div class="container">
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
											<tr>
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
													</dl> <!-- <div class="m-t-sm">
														<a href="#" class="text-muted" data-toggle="modal"
															data-target="#exampleModalCenter"><i
															class='far fa-edit'></i> تعديل الحجز</a> | <a href="#"
															class="text-muted"><i class="fa fa-trash"></i> الغاء
															الحجز</a>
													</div> -->
													<div class="m-t-sm">
														<button type="button" class="btn btn-outline-warning"
															data-toggle="modal" data-target="#exampleModalCenter"
															id="${reservation.id}" onClick="reply_click(this.id)">

															تعديل الحجز <i class='far fa-edit'></i>
														</button>
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
							<%--  <form:form action="/reservation/${reservation.id}" method="post"
								modelAttribute="reservation" class="form-outline">
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
							</form:form>  --%>
							<p class="mb-0 cancel">
								<a href="#" data-dismiss="modal">الغاء</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/js/jquery-3.3.1.min.js"></script>
	<script src="/js/popper.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/main.js"></script>
	<script src="/js/jquery.min.js"></script>
</body>
</html>