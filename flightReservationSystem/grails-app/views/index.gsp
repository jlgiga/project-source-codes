<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>FRS | Flight Reservation System</title>
		<script type="text/javascript"></script> 
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
		<script>
		$(function() {
			$( "#datepicker" ).datepicker({ dateFormat: 'yy-mm-dd', minDate: 0 + 1 }).val();
		});
		</script>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}
            
			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body id="home">
		<div id="templatmeo_header">
			<div id="site_title"><h1><a class="home" href="${createLink(uri: '/')}">Home</a></h1></div>
			<div id="templatemo_menu">
				<ul>
					<li><g:link controller="flight" action="aboutFRS">About FRS</g:link></li>
					<li><g:link controller="flight" action="contact">Contact Us</g:link></li>
					<sec:ifNotLoggedIn>
						<li><g:link controller="register">Sign-up</g:link></li>
						<li><g:link controller="login">Sign-in</g:link></li>
					</sec:ifNotLoggedIn>
					<sec:ifLoggedIn>
						<sec:ifAllGranted roles="ROLE_ADMIN">
								<li><g:link controller="clerk" action="adminManage">Manage Flights</g:link></li>
						</sec:ifAllGranted>
						<sec:ifAllGranted roles="ROLE_CASHIER">
								<li><g:link controller="flightBooking" action="searchBookingCode">Search Booking Code</g:link></li>
						</sec:ifAllGranted>
						<sec:ifAllGranted roles="ROLE_CUSTOMER">
								<li><g:link controller="customer" action="customerInfo">Account</g:link></li>
						</sec:ifAllGranted>
						<li><g:link controller="logout">Logout</g:link></li>
					</sec:ifLoggedIn>
				</ul>
			</div>
		</div>
    
		<div id="templatemo_middle">
			<div id="search_flight_form">
				<div id="mid_title">Book a Flight</div>
					<g:form name="search" controller="flight" action="searchFlight">
						Trip Type: One Way
						<hr/><br/>
						Origin:
						<g:select name="origin" from="${['Bacolod', 'Basco(Batanes)', 'Busuanga(Coron)', 'Butuan', 'Cagayan de Oro', 'Calbayog', 'Catarman', 'Caticlan (Boracay)', 'Cebu', 'Clark', 'Cotabato', 'Davao', 'Dipolog', 'Dumaguete', 'General Santos', 'Iloilo', 'Jolo', 'Kalibu', 'Kuala Lumpur', 'Laoag', 'Legaspi', 'Manila', 'Masbate', 'Naga', 'Ozamiz', 'Pagadian', 'Puerto Prinsesa', 'Roxas', 'Sandakan', 'San Jose (Mindoro)', 'Surigao', 'Tacloban', 'Tagbilaran (Bohol)', 'Tawi-Tawi', 'Tuguegarao', 'Zamboanga']}" noSelection="['':'']"/>&nbsp;&nbsp;&nbsp;&nbsp;	
						Destination:
						<g:select name="destination" from="${['Bacolod', 'Basco(Batanes)', 'Busuanga(Coron)', 'Butuan', 'Cagayan de Oro', 'Calbayog', 'Catarman', 'Caticlan (Boracay)', 'Cebu', 'Clark', 'Cotabato', 'Davao', 'Dipolog', 'Dumaguete', 'General Santos', 'Iloilo', 'Jolo', 'Kalibu', 'Kuala Lumpur', 'Laoag', 'Legaspi', 'Manila', 'Masbate', 'Naga', 'Ozamiz', 'Pagadian', 'Puerto Prinsesa', 'Roxas', 'Sandakan', 'San Jose (Mindoro)', 'Surigao', 'Tacloban', 'Tagbilaran (Bohol)', 'Tawi-Tawi', 'Tuguegarao', 'Zamboanga']}" noSelection="['':'']"/><br/><br/>
						Departing On:
						<input type="text" id="datepicker" name="departureDate"/>
						<br/><br/>
						<input type="submit" value="Search" class="btn success"/>
					</g:form>
					<br/><br/>
			</div>
		</div>
    
		 <div id="templatemo_main">
			<div id="templatemo_content">
			
				<div class="col_allw300">
					<h2>Welcome to FRS</h2>
					<p>Things you can do:</p><br/>
								
					<ul class="templatemo_list">
						<li>Book a flight</li>
						<li>Check flight status</li>
						<li>Check for Available Flights</li> 
						<li>Create account to record your transactions</li>     
					</ul>
					<div class="cleaner"></div>
					<a href="#" class="more">Read more</a>
				</div>
				
					<div class="col_allw300">
						<h2>Updates</h2>
						<div class="sb_news_box">
							<img src="images/templatemo_image_05.jpg" alt="Image 05" />
							<div class="news_date">MAR 18, 2012</div>
							<h6><a href="#">New Online Booking System</a></h6>
							
						 <div class="cleaner"></div>
						</div>
						<div class="sb_news_box">
							<img src="images/templatemo_image_03.jpg" alt="Image 03" />
							<div class="news_date">OCT 24, 2048</div>
							<h6><a href="#">Donec et purus velit, eget euismod risus consectetur dolo.</a></h6>
							
							<div class="cleaner"></div>
						</div>
						<div class="sb_news_box">
							<img src="images/templatemo_image_04.jpg" alt="Image 04" />
							<div class="news_date">OCT 16, 2048</div>
							<h6><a href="#">Curabitur scelerisque, in lacinia massa consectetur sit amet.</a></h6>
							<div class="cleaner"></div>
						</div>
						<div class="sb_news_box">
							<img src="images/templatemo_image_06.jpg" alt="Image 06" />
							<div class="news_date">OCT 12, 2048</div>
							<h6><a href="#">Praesent eu dolor nibh. In hac habitasse platea dictumst. </a></h6>
							<div class="cleaner"></div>
						</div>
					   
						<a href="#" class="more">Read All</a>   
					</div>
				
					<div class="col_allw300 col_last">
						<h2>Featured Sites</h2>
						<div class="fp_lw_box">
							<div class="image_frame"><span></span><img src="images/templatemo_image_01.jpg" alt="Image 01" /></div>
							<p><em>Morbi sed nulla ac est cursus suscipit ac lectus.</em></p>
						</div>
						<div class="fp_lw_box">
							<div class="image_frame"><span></span><img src="images/templatemo_image_02.jpg" alt="Image 02" /></div>
							<p><em>Proin iaculis dui vel lorem vulputate venenatis.</em></p>
						</div>
						<div class="cleaner"></div>
						<a href="#" class="more">Read more</a>
					</div>
					<div class="cleaner"></div>
				</div>
			</div>
		</div>

	</body>
</html>
