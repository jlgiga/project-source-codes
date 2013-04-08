<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css2', file: 'admin.css')}" type="text/css">
		<table>
			<tr><td colspan="2"><img src="../images/air_logo2.jpg" />&nbsp;&nbsp;&nbsp;<strong>Itinerary Receipt</strong></td></tr>
			<tr><td colspan="2"><b>Flight Details</b></td></tr>
			<tr>
			<g:if test="${routeInstance?.origin}">
					<td><b>Origin:</b> 
						<g:fieldValue bean="${routeInstance}" field="origin"/><br/>
						<g:if test="${routeInstance?.origin}">
						<b>Destination: </b><g:fieldValue bean="${routeInstance}" field="destination"/>
						</g:if>
					</td>
			</g:if>
			<g:if test="${flightInstance?.departureTime}">
					<td><b>Departs On: </b><g:fieldValue bean="${flightInstance}" field="departureTime"/><br/>
					<g:if test="${flightInstance?.arrivalTime}">
						<b>Arrives On: </b><g:fieldValue bean="${flightInstance}" field="arrivalTime"/>
					</g:if>
					</td>
			</g:if>
			</tr>
			<tr><td colspan="2"><b>Passenger Details</b></td></tr>
			<tr>
			<g:if test="${passengerInstance?.givenName}">
					<td><b>Passenger Name:</b> 
						<g:fieldValue bean="${passengerInstance}" field="givenName"/>
						<g:if test="${passengerInstance?.email}">
							<g:fieldValue bean="${passengerInstance}" field="surname"/>
						</g:if>
					</td>
			</g:if>
			<g:if test="${passengerInstance?.email}">
				
					<td><b>Email: </b><g:fieldValue bean="${passengerInstance}" field="email"/></td>
				
			</g:if>
			</tr>
			<tr><td><b>Payment Status</b></td><td><b>Total Amount Paid</b></td></tr>
			<g:if test="${flightBookingInstance?.paymentStatus}">
				<tr>
					<td><g:fieldValue bean="${flightBookingInstance}" field="paymentStatus"/></td>
					<g:if test="${flightBookingPaymentInstance?.paymentAmount}">
						<td><g:fieldValue bean="${flightBookingPaymentInstance}" field="paymentAmount"/></td>
					</g:if>
				</tr>
			</g:if>
		</table>
		---------------------------------------------------------------------------------------------------------
		<br/><br/>
<style type="text/css">
	table {
		background: #e7e7e7;
		border-top: 1px solid #DFDFDF;
		border-collapse: collapse;
		width: 100%;
		margin-bottom: 1em;
	}

	tr {
		border: 0;
	}

	tr>td:first-child, tr>th:first-child {
		padding-left: 1.25em;
	}

	tr>td:last-child, tr>th:last-child {
		padding-right: 1.25em;
	}

	td, th {
		line-height: 1.5em;
		padding: 0.5em 0.6em;
		text-align: left;
		vertical-align: top;
	}

	th {
		background-color: #efefef;
		background-image: -moz-linear-gradient(top, #ffffff, #eaeaea);
		background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #ffffff), color-stop(1, #eaeaea));
			filter: progid:DXImageTransform.Microsoft.gradient(startColorStr = '#ffffff', EndColorStr = '#eaeaea');
		-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorStr='#ffffff', EndColorStr='#eaeaea')";
		color: #666666;
		font-weight: bold;
		line-height: 1.7em;
		padding: 0.2em 0.6em;
	}

	thead th {
		white-space: nowrap;
	}

	th a {
		display: block;
		text-decoration: none;
	}

	th a:link, th a:visited {
		color: #666666;
	}

	th a:hover, th a:focus {
		color: #333333;
	}

	th.sortable a {
		background-position: right;
		background-repeat: no-repeat;
		padding-right: 1.1em;
	}

	th.asc a {
		background-image: url(../images/skin/sorted_asc.gif);
	}

	th.desc a {
		background-image: url(../images/skin/sorted_desc.gif);
	}

	.odd {
		background: #f7f7f7;
	}

	.even {
		background: #ffffff;
	}

	th:hover, tr:hover {
		background: #E1F2B6;
	}
</style>
		
<style type="text/css" media="print">
	div {
		display:none;
	}
	
	.printable {
		display:block;
	}
</style>
		
	</head>
	<body>
		<div class="center"></div>
		<div>
				<form>			
					<input type="button"  class="buttons" value="Print OR" onClick="window.print()"/>
				</form>
				<a class="home" href="${createLink(uri: '/')}" class="more">Back</a>
		</div>	
	</body>
</html>

