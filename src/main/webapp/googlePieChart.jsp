<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<title>Visualisation Google</title>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script type="text/javascript">
		google.load("visualization", "1", {packages: ["corechart"]});
		google.setOnLoadCallback(drawChart);
		function drawChart() {
			// ON récupère les données au moment du chargement de la page
			var dataArray = <jsp:include page="jdbc2json/SalesByCustomer?template=AllRecordsAsArray" />;
			// On met le descriptif des données
			dataArray.unshift(["Client", "Sales"]);

			var data = google.visualization.arrayToDataTable(dataArray);

			var options = {
				title: 'Sales by customer',
				is3D: true,
			};

			var chart = new google.visualization.PieChart(document.getElementById('piechart'));

			chart.draw(data, options);
		}
	</script>
</head>
<body>
	<h1>Exemple d'utilisation des <a href="https://google-developers.appspot.com/chart/interactive/docs/gallery/piechart#3D" target="_blank">visualisations Google</a></h1>
	<a href='jdbc2json/SalesByCustomer?template=AllRecordsAsArray' target="_blank">Voir les données brutes</a><br>
	<em>note : la technique d'inclusion des JSP se prête mal à la gestion des erreurs. 
		Que se passe-t'il en cas d'erreur d'accès à la base ? 
		L'utilisation en mode AJAX permet de récupérer les erreurs correctement</em>
	<div id="piechart" style="width: 900px; height: 500px;"></div>
</body>