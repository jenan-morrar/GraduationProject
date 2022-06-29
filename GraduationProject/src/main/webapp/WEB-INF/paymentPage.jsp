<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>صفحة الدفع</title>

<link rel="icon" type="image/png"
	href="/resources/images/ring map logo.png" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css
">
<style>
body {
	font-family: Arial;
	font-size: 17px;
	padding: 8px;
	font-family: "Work Sans", 'Aref Ruqaa', serif, Arial, sans-serif;
}

* {
	box-sizing: border-box;
}

.row {
	display: -ms-flexbox; /* IE10 */
	display: flex;
	-ms-flex-wrap: wrap; /* IE10 */
	flex-wrap: wrap;
	margin: 0 -16px;
}

.col-25 {
	-ms-flex: 25%; /* IE10 */
	flex: 25%;
}

.col-50 {
	-ms-flex: 50%; /* IE10 */
	flex: 50%;
}

.col-75 {
	-ms-flex: 75%; /* IE10 */
	flex: 75%;
}

.col-25, .col-50, .col-75 {
	padding: 0 16px;
}

.container {
	background-color: #f2f2f2;
	padding: -15px 2px 5px 2px;
	margin: 8%;
	margin-top: 1%;
	border: 2px solid lightgrey;
	border-radius: 18px;
}

input[type=text] {
	width: 100%;
	margin-bottom: 20px;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 3px;
	text-align: right;
}

label {
	margin-bottom: 10px;
	display: block;
}

.icon-container {
	margin-bottom: 20px;
	padding: 7px 0;
	font-size: 24px;
}

.btn {
	background-color: #cd7e53;
	text-align: center;
	color: white;
	padding: 12px;
	border: none;
	width: 40%;
	border-radius: 3px;
	font-size: 17px;
}

.btn:hover {
	background-color: #cd7e53;
}

a {
	color: #2196F3;
}

hr {
	border: 1px solid lightgrey;
}

span.price {
	float: right;
	color: #cd7e53;
}

label {
	float: right;
}

h1 {
	text-align: center;
}

.currency {
	float: right;
}

.text-center {
  text-align: center;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media ( max-width : 800px) {
	.row {
		flex-direction: column-reverse;
	}
	.col-25 {
		margin-bottom: 20px;
	}
}
</style>
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro&display=swap
"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap
"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Fira+Mono&display=swap
"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Aref+Ruqaa&family=Cormorant+Garamond:ital,wght@1,300&family=Montserrat:wght@100&family=Poiret+One&family=Rakkas&display=swap
"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Aref+Ruqaa&family=Cormorant+Garamond:ital,wght@1,300&family=Lateef&family=Montserrat:wght@100&family=Poiret+One&display=swap
"
	rel="stylesheet">
<link
	href='https://fonts.googleapis.com/css?family=Work+Sans:400,300,600,400italic,700
'
	rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css?family=Sacramento
"
	rel="stylesheet">

</head>
<body>
	<div class="row">
		<div class="col-75">
			<div class="container">
				<form method="post" action="/pay">
					<div class="col-50">
						<div class="test">
							<h1>صفحة الدفع</h1>
							<label>البطاقات االبنكية المتاحة</label>
							<div class="icon-container">
								<i class="fa fa-cc-visa" style="color: navy;"></i> <i
									class="fa fa-cc-amex" style="color: blue;"></i> <i
									class="fa fa-cc-mastercard" style="color: red;"></i> <i
									class="fa fa-cc-discover" style="color: orange;"></i>
							</div>

							<label for="price">السعر</label> <input class="right" type="text"
								id="price" name="price" value="0.5" readonly>
						</div>
						<label for="currency">العملة</label>
						<div>
							<input type="text" id="currency" name="currency"
								placeholder="العملة" class="right"> <label for="method">طريقة
								الدفع</label> <input type="text" id="method" name="method"
								placeholder="الدفع بواسطة..."> <label for="intent">وصف</label>
							<input type="text" id="intent" name="intent" value="sale"
								readonly> <label for="description">اسم الدفع</label> <input
								type="text" id="description" name="description"
								placeholder="اسم الدفع">
						</div>
					</div>

					<div class="text-center">
					<input type="submit" value="استكمال الدفع" class="btn"> <br>
					</div>
					
					<br> <a href="/index" style="color: #cd7e53">الصفحة
						الرئيسية</a> <br>
				</form>
				<br> <br>
			</div>
		</div>
	</div>
	</div>

</body>
</html>