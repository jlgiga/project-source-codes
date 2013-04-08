<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<!--<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">-->
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'templatemo_style.css')}" type="text/css">

		<script language="javascript" type="text/javascript">
		function clearText(field)
		{
			if (field.defaultValue == field.value) field.value = '';
			else if (field.value == '') field.value = field.defaultValue;
		}
		</script>

		<link rel="stylesheet" href="${resource(dir: 'css', file: 'contentslider.css')}" type="text/css">
		<script type="text/javascript" src="scripts/contentslider.js">

		/***********************************************
		* Featured Content Slider- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
		* This notice MUST stay intact for legal use
		* Visit Dynamic Drive at http://www.dynamicdrive.com/ for this script and 100s more
		***********************************************/

		</script>
		<g:layoutHead/>
        <r:layoutResources />
	</head>
	<body id="sub">
		<div id="templatemo_wrapper">
		<g:layoutBody/>
		</div>
		<div id="templatemo_footer_wrapper">
			<div id="templatemo_footer">

				<div class="col_allw300">
					<h4>Our Pages</h4>
					<ul class="footer_list">
						<li><a class="home" href="${createLink(uri: '/')}">Home</a></li>
						<li><g:link controller="flight" action="aboutFlights">Flights</g:link></li>
						<li><a href="about.html">About FRS</a></li>
						<li><a href="blog.html">Contact Us</a></li>
					</ul>
				</div>
				<div class="col_allw300">
					<h4>Our Partners</h4>
					<ul class="footer_list">
						<li><a href="http://www.koflash.com/" target="_parent">Philipine Airlines</a></li>            
						<li><a href="http://www.flashmo.com/" target="_parent">American Airlines</a></li>
					</ul>
				</div>
				<!--<div class="col_allw300 col_last">
					<h4>About Us</h4>
					<p>Blue Smoothie is a <a href="http://www.templatemo.com/" target="_blank">free CSS template</a> brought to you by <a href="http://www.templatemo.com/" target="_blank">templatemo.com</a>. Feel free to download, modify and apply this template for your websites. Credit goes to <a href="http://www.photovaco.com/" target="_blank">Free Photos</a>. Lorem ipsum dolor sit amet. Nullam faucibus ipsum ac sapien tincidunt auctor. Nunc risus tortor. Validate <a href="http://validator.w3.org/check?uri=referer" rel="nofollow"><strong>XHTML</strong></a> &amp; <a href="http://jigsaw.w3.org/css-validator/check/referer" rel="nofollow"><strong>CSS</strong></a>.</p>
				</div>-->              
			
				<div class="cleaner"></div>
			
			</div> <!-- end of templatemo_footer -->
			<div class="cleaner"></div>
		</div>
		</div>


		<div id="templatemo_copyright_wrapper">
			<div id="templatemo_copyright">
				
					Copyright © 2012 | <a class="home" href="${createLink(uri: '/')}">FRS</a>
				
			</div> <!-- end of templatemo_footer -->
		</div>
		<g:javascript library="application"/>
        <r:layoutResources />
	</body>
</html>