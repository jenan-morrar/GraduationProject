<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>تم بنجاح</title>
<link rel="icon" type="image/png"
	href="/resources/images/ring map logo.png" />
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
</head>
<style>
.font {
	font-family: "Work Sans", 'Aref Ruqaa', serif, Arial, sans-serif;
}

body {
	font-family: "Work Sans", 'Aref Ruqaa', serif, Arial, sans-serif;
	font-weight: 400;
	font-size: 16px;
	line-height: 1.7;
	color: #828282;
	background: #fff;
}

.button {
	display: inline-block;
	padding: 7px 5px;
	text-align: center;
	text-decoration: none;
	color: #ffffff;
	background-color: #cd7e53;
	border-radius: 7px;
	outline: none;
	height: 25px;
	width: 150px;
	font-size: 20px;
}

.contain {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: linear-gradient(#cd7e53, #cd7e53, #cd7e53);
	background-image: linear-gradient(to bottom right, #686868, #e1e1e1);
}

.done {
	width: 100px;
	height: 100px;
	position: relative;
	left: 0;
	right: 0;
	top: -20px;
	margin: auto;
}

.contain h1 {
	font-family: "Work Sans", 'Aref Ruqaa', serif, Arial, sans-serif;
	font-size: 1.4em;
	color: #cd7e53;
}

.congrats {
	position: relative;
	left: 50%;
	top: 50%;
	max-width: 800px;
	transform: translate(-50%, -50%);
	width: 80%;
	min-height: 300px;
	max-height: 900px;
	border: 2px solid gray;
	border-radius: 5px;
	box-shadow: 12px 15px 20px 0 rgba(46, 61, 73, .3);
	background-image: linear-gradient(to bottom right, #02b3e4, #02ccba);
	background: #fff;
	text-align: center;
	font-size: 2em;
	color: #cd7e53;
}

.text {
	position: relative;
	font-weight: normal;
	left: 0;
	right: 0;
	margin: auto;
	width: 80%;
	max-width: 800px;
	font-family: "Work Sans", 'Aref Ruqaa', serif, Arial, sans-serif;
	font-size: 0.6em;
}

@media ( max-width :600px) {
	.congrats h1 {
		font-size: 1.2em;
	}
	.done {
		top: -10px;
		width: 80px;
		height: 80px;
	}
	.text {
		font-size: 0.5em;
	}
	.regards {
		font-size: 0.6em;
	}
}

@media ( max-width :500px) {
	.congrats h1 {
		font-size: 1em;
	}
	.done {
		top: -10px;
		width: 70px;
		height: 70px;
	}
}

@media ( max-width :410px) {
	.congrats h1 {
		font-size: 1em;
	}
	.congrats .hide {
		display: none;
	}
	.congrats {
		width: 100%;
	}
	.done {
		top: -10px;
		width: 50px;
		height: 50px;
	}
	.regards {
		font-size: 0.55em;
	}
	.body {
		font-family: "Work Sans", 'Aref Ruqaa', serif, Arial, sans-serif;
	}
}
</style>
<body>

	<div class="contain">
		<div class="congrats">
			<div class="font">
				<h1>مبارك تم دفع العربون</h1>
				<br>
			</div>
			<div class="done">
				<svg version="1.1" id="tick" xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
					viewBox="0 0 37 37" style="enable-background: new 0 0 37 37;"
					xml:space="preserve">
<path class="circ path"
						style="fill:#cd7e53;stroke:#a46442;stroke-width:3;stroke-linejoin:round;stroke-miterlimit:10;"
						d="
	M30.5,6.5L30.5,6.5c6.6,6.6,6.6,17.4,0,24l0,0c-6.6,6.6-17.4,6.6-24,0l0,0c-6.6-6.6-6.6-17.4,0-24l0,0C13.1-0.2,23.9-0.2,30.5,6.5z" />
<polyline class="tick path"
						style="fill:none;stroke:#fff;stroke-width:3;stroke-linejoin:round;stroke-miterlimit:10;"
						points="
	11.6,20 15.9,24.2 26.4,13.8 " />
</svg>
			</div>
			<div class="text">
				<p>
					تم حجز القاعة بنجاح معنا <br>
			</div>
			<br> <a class="button" href="/index">الصفحة الرئيسية</a> <br>
			<br>
		</div>

	</div>
	</div>
</html>
</body>