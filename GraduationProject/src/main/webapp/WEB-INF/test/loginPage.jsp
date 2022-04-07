<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>تسجيل الدخول</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" href="/resources/images/logo.ico" type="image/x-icon">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css" />">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css" />">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css" />">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/animate/animate.css" />">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/css-hamburgers/hamburgers.min.css" />">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/vendor/select2/select2.min.css" />">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="<c:url value="/resources/CSS/registrationStyle.css" />">
<link rel="stylesheet" href="<c:url value="/resources/CSS/util.css" />">
<!--===============================================================================================-->
<link
	href="https://fonts.googleapis.com/css2?family=Aref+Ruqaa&family=Cormorant+Garamond:ital,wght@1,300&family=Montserrat:wght@100&family=Poiret+One&family=Rakkas&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Aref+Ruqaa&family=Cormorant+Garamond:ital,wght@1,300&family=Lateef&family=Montserrat:wght@100&family=Poiret+One&display=swap"
	rel="stylesheet">
<!--===============================================================================================-->
</head>
<body>

	<!--<c:if test="${logoutMessage != null}">
		<c:out value="${logoutMessage}"></c:out>
	</c:if>
	<h1>Login</h1>
	<c:if test="${errorMessage != null}">
		<c:out value="${errorMessage}"></c:out>
	</c:if>-->

	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('/resources/images/image.png');">
			<div class="wrap-login100 p-b-30" id="responsiveLoginForm">
				<div class="loginForm">
					<form method="POST" action="/login"
						class="login100-form validate-form">
						<div class="login100-form-avatar">
							<img src="/resources/images/profilePic.png" alt="AVATAR">
						</div>
						<span class="login100-form-title p-t-20 p-b-45"> إنشاء حساب
						</span>

						<div class="wrap-input100 validate-input m-b-10"
							data-validate=" أدخل ايميل المستخدم">
							<input id="email" class="input100" type="text" name="email"
								placeholder="ايميل المستخدم"> <span class="focus-input100"></span>
							<span class="symbol-input100"> <i class="fa fa-user"></i>
							</span>
						</div>

						<div class="wrap-input100 validate-input m-b-10"
							data-validate="يجب إدخال كلمة المرور">
							<input class="input100" type="password" id="password"
								name="password" placeholder="كلمة المرور"> <span
								class="focus-input100"></span> <span class="symbol-input100">
								<i class="fa fa-lock"></i>
							</span>
						</div>

						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /> <input type="submit"
							value="تسجيل الدخول" class="login100-form-btn" />
						<div class="text-center w-full">
							<p class="txt1">
								هل تمتلك حساب ؟<a class="txt1" href="/registration">&nbsp;
									إنشاء حساب </a> <i class="fa fa-long-arrow-right"></i>
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--===============================================================================================-->
	<script src="/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/js/registrationScript.js"></script>


</body>
</html>