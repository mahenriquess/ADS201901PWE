<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<%@include file="config/includes.html" %>
<link rel="stylesheet" type="text/css" href="resources/css/cssLogin.css" />
<meta charset="UTF-8">
<title>Login | MarThiRent</title>
</head>
<body>
	<%
		String sessao = (String)session.getAttribute("idUser");
		try {
			if(sessao != null){
				response.sendRedirect("dashboard.jsp");
			}
		} catch(NullPointerException e) {
			response.sendRedirect("login.jsp");
		}

	%>
	<div class="container border loginTela">
		<h1 class="h1"><strong>MarThiRent</strong></h1>
		<hr />
		<h2>Login</h2>
		<fieldset>
		<form class="form-group">
			<input class="form-control" type="text" id="formLoginUsuario" size="30" maxlength="30" placeholder="Usuário" required/> 
			<input class="form-control"type="password" id="formLoginSenha" size="30" maxlength="30" placeholder="Senha" required/>
			<button class="btn btn-info" type="button" id="btn_login">ENTRAR</button>
		</form>
		</fieldset>
		<p id="loader"></p>
	</div>
	<script src="resources/js/scriptLogin.js"></script>
</body>
</html>