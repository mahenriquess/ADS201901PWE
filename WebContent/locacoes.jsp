<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.CategoriaVeiculosDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="config/includes.html" %>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/cssVeiculos.css" />
<title>Veículos | MarThiRent</title>
</head>
<body>
	<%@include file="config/menu.jsp" %>
	
	<%
		if(sessao == null){
			response.sendRedirect("login.jsp");
		}
	%>
	<!-- CRIAR MODAIS PARA LOCAÇÃO E DEVOLUÇÃO -->
	<div class="container pagina text-center">
		<h1 class="h1"><i class="fas fa-money-check-alt"></i> LOCAÇÕES</h1>
		<br />
		<p>Escolha abaixo o que deseja fazer: </p>
		<p>
		  <button class="btn btn-primary btn-collapse" type="button" id="btn-realizar-locacao">
		    Realizar Locação
		  </button>
		</p>
		<p>
		  <button class="btn btn-primary btn-collapse" type="button" id="btn-realizar-devolucao">
		    Realizar Devolução
		  </button>
		</p>
	</div>
	<script src="resources/js/scriptLocacoes.js"></script>
</body>
</html>