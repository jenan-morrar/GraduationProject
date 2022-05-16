
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!doctype html>
<html dir="rtl" lang="ar">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>جميع المستخدمين</title>

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

</head>
<body>
	<div class="container">
		<form action="/superAdmin/users/search">
			<input type="text" name="freeText" placeholder="ابحث">
			<button class="btn btn-primary" style="background-color: #ff9e69;">ابحث</button>
		</form>
	</div>

	<section class="ftco-section">
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
								<tr>
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
												<button class="btn btn-danger" type="submit" value="Delete"><i class="fa fa-close"></i></button>
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

</body>
</html>

