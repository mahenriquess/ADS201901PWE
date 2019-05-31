<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="config/includes.html" %>
<meta charset="UTF-8">
<title>Dashboard | MarThiRent</title>
</head>
<body>
	<%@include file="config/menu.jsp" %>
	<%
		if(sessao == null){
			response.sendRedirect("login.jsp");
		}
	%>
	
	<div class="container pagina text-center">
	<h1 class="h1"><i class="fas fa-columns"></i> DASHBOARD </h1>
	<p><strong><%=(String) session.getAttribute("nomeUser")%></strong>, estas são as tarefas que você pode fazer:</p>
		<hr />
		<h1 class="h1">TESTE DASHBOARD</h1>
		<div class="row">
			<div class="col-sm-4 <%=link %>">
				<a href="veiculos.jsp"><h2 class="h2"><i class="fas fa-car"></i> VEÍCULOS </h2>
				<h5 class="h5">Gerencie os veículos alugados e disponíveis</h5></a>
			</div>
			<div class="col-sm-4 <%=link %>">
				<a href="clientes.jsp"><h2 class="h2"><i class="fas fa-users"></i> CLIENTES </h2>
				<h5 class="h5">Verificar cadastro de clientes no sistema</h5></a>
			</div>
			<div class="col <% out.print(link.equals("") ? "" : "-sm-4"); %>">
				<a href="#"><h2 class="h2"><i class="fas fa-money-check-alt"></i> LOCAÇÃO </h2>
				<h5 class="h5">Faça a locação de um veículo disponível</h5></a>
			</div>
		</div>
		<hr />
	</div>
</body>
</html>