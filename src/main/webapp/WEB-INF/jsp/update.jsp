<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Airline - Group ONE</title>
</head>
<body>
<div>
<form action="" method="post">
	<input name="AirlineID" type="hidden" value="${airline.airlineId}">
	airlineName:<input name="Airline Name" type="text" value="${airline.name}">
	airlineAlias:<input name="Alias" type="text" value="${airline.alias}">
	IATA: <input name="IATA" type="text" value="${airline.iata}">
	ICAO: <input name="ICAO" type="text" value="${airline.icao}">
	Callsign: <input name="CallSign" type="text" value="${airline.callSign}">
	Country: <input name="Country" type="text" value="${airline.country}">
	Active:<input name="Active" type="text" value="${airline.active}">
	<input type="submit" value="submit">
</form>
</div>
</body>
</html>