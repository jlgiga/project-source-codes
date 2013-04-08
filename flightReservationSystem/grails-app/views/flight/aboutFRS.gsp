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
					<li><g:link controller="flight" action="aboutFRS" class="current">About FRS</g:link></li>
					<li><g:link controller="flight" action="contact">Contact Us</g:link></li>
					<sec:ifNotLoggedIn>
						<li><g:link controller="register">Sign-up</g:link></li>
						<li><g:link controller="login">Sign-in</g:link></li>
					</sec:ifNotLoggedIn>
					<sec:ifAllGranted roles="ROLE_CUSTOMER">
						<li><g:link controller="customer" action="show">Account</g:link></li>
					</sec:ifAllGranted>
					<sec:ifLoggedIn>
						<li><g:link controller="logout">Logout</g:link></li>
					</sec:ifLoggedIn>
				</ul>    	
			</div>
		</div>
		<div id="templatemo_middle_sub">
			<div id="mid_title">About FRS</div>
			<p>Curabitur scelerisque accumsan mauris, in lacinia massa consectetur sit amet. Maecenas in tincidunt metus. Quisque vitae lectus in risus faucibus vulputate. Quisque rutrum interdum tellus volutpat interdum. Proin iaculis dui vel lorem vulputate venenatis. Quisque at mi quis leo semper ullamcorper. Fusce et pellentesque nisi.</p>
		</div> <!-- end of middle -->
    
     <div id="templatemo_main">
        <div class="col_w600 float_l">
        	
            <h2>Who We Are</h2>
       
             <p><em>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent aliquam velit a magna sodales quis elementum ipsum auctor.</em></p>
            <p>In ac libero urna. Suspendisse sed <a href="#">odio ut mi</a> auctor blandit. Duis luctus nulla metus, a vulputate mauris. Integer sed nisi sapien, ut gravida mauris. Nam et tellus libero. Cras purus libero, dapibus nec risus. Ut interdum mi sit amet magna feugiat auctor.</p>
            <div class="h30"></div>
            <div class="image_frame image_fr"><span></span><img src="images/templatemo_image_01.jpg" alt="Image 01" /></div>
            <h6>Duis pellentesque est non lacus aliquam</h6>
            <p>Praesent volutpat dolor at nulla egestas in vestibulum mauris lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris eu lorem nec enim sollicitudin sodales condimentum ut arcu.</p>
        </div>
        <div class="col_w300 float_r">
            <cite>FRS - <span>says:</span></cite><br/>
            <p>To all our valued passengers, we would like to inform you that you can create an account here to record flight booking transactions.</p>
			<br/><br/>
			<sec:ifNotLoggedIn>
				<blockquote>
					<h2>Already a Member?</h2>
					<li><g:link controller="register">Sign-up</g:link></li>
					<li><g:link controller="login">Sign-in</g:link></li>
				</blockquote>
			</sec:ifNotLoggedIn>
        
        </div>    
        <div class="cleaner"></div>	
    </div> <!-- end of templatemo_main -->
	</body>
</html>