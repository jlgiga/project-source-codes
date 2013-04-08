<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
	</head>
	<body>
		<div id="templatmeo_header">
			<div id="site_title"><h1><a href="http://localhost:8080/flightReservationSystem">Free CSS Templates</a></h1></div>
			<div id="templatemo_menu">
				<ul>
					<li><g:link controller="flight" action="aboutFRS">About FRS</g:link></li>
					<li><g:link controller="flight" action="contact" class="current">Contact Us</g:link></li>
					<sec:ifNotLoggedIn>
						<li><g:link controller="register">Sign-up</g:link></li>
						<li><g:link controller="login">Sign-in</g:link></li>
					</sec:ifNotLoggedIn>
					<sec:ifAllGranted roles="ROLE_CUSTOMER">
						<li><g:link controller="customer" action="customerInfo">Account</g:link></li>
					</sec:ifAllGranted>
					<sec:ifLoggedIn><li><g:link controller="logout">Logout</g:link></li></sec:ifLoggedIn>
				</ul>    	
			</div>
		</div> <!-- end of header -->
		<div id="templatemo_middle_sub">
			<div id="mid_title">FRS >> Contact Us</div>
			<p>For further questions regarding the online booking, you can email us using the email below and we will do our best to answer all of your questions.</p>
		</div> <!-- end of middle -->
    
     <div id="templatemo_main">            
        <div class="col_w450 float_l">
            <h4>Our Location</h4>
            <div id="map"><a href="../images/map_big.jpg" title="Our Location"><img src="../images/map_thumb.jpg" width="300" height="150" alt="Location" class="image_wrapper"/></a></div>
            <div class="cleaner h30"></div>
            
            <h4>Mailing Address</h4>
            <h6>Our Company</h6>
            360-180 Pellentesque habitant morbi, <br />
            Suspendisse tincidunt facilisis, 14450<br />
            Sed placerat ligula elit<br /><br />
			
			<strong>Phone: </strong>020-040-0550<br />
            <strong>Email: </strong><a href="mailto:info@yourcompany.com">onlinebooking@frs.com</a><br/><br/>
			
			<h6>For Security concerns, please contact:</h6>
			<strong>Security Sub-Department</strong><br/>
			PAL Gate 2, Andrews Avenue <br/>
			Nichols, Pasay City 1300 
			Tel: (632) 852-5874  <br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;855-8000 loc 2393/2057<br/>
			e-mail: sfpd@pal.com.ph
        </div>
    	
    	<div class="cleaner"></div>
    </div> <!-- end of templatemo_main -->
	</body>
</html>