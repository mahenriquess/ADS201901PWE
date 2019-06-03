<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="config/includes.html" %>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/cssFuncionarios.css" />
<title>Funcionários | MarThiRent</title>
</head>
<body>
	<%@include file="config/menu.jsp" %>
	
	<%
		try {
			if(!status.equals("A")){
				response.sendRedirect("dashboard.jsp");
			}
			
			if(sessao == null){
				response.sendRedirect("login.jsp");
			}
		} catch(NullPointerException e) {
			response.sendRedirect("login.jsp");
		}
	%>
	
	<div class="container pagina text-center">
		<h1 class="h1"><i class="fas fa-id-card"></i> Funcionários</h1>
		<br />
		<p>Escolha abaixo o que deseja fazer: </p>
		<p>
		  <button class="btn btn-primary btn-collapse" type="button" data-toggle="collapse" data-target="#collapseFormCadFuncionario" aria-expanded="false" aria-controls="collapseFormCadCliente">
		    Cadastrar Funcionários
		  </button>
		</p>
		<div class="collapse" id="collapseFormCadFuncionario">
		  <div class="card card-body pagina">
		    <h3>Formulário de Cadastro de Funcionarios</h3>
		    <br />
		    <form class="form-group" id="formCadFunc">
		    	<div class="row">
			    	<div class="col">
			    		<label for="formCadFunc-nome">
			    			<p>Nome:
			    				<input class="form-control" type="text" id="formCadFunc-nome" placeholder=" ex.: Fulano da Silva" size="35" maxlength="35" required />
			   				</p>
			   			</label>
			   			<label for="formCadFunc-username">
			    			<p>Nome de Usuário:
			    				<input class="form-control" type="text" id="formCadFunc-username" placeholder=" ex.: 123.456.789-01" size="15" maxlength="15" required />
			   				</p>
			   			</label>
			   			<label for="formCadFunc-password">
			    			<p>Senha:
			    				<input class="form-control" type="password" id="formCadFunc-password" placeholder="---------" size="15" maxlength="15" required />
			   				</p>
			   			</label>
		   			</div>
		   		</div>
		   		<div class="row">
		   			<div class="col">
			   			<label for="formCadFunc-email">
			    			<p>E-mail:
			    				<input class="form-control" type="email" id="formCadFunc-email" placeholder="ex.: seunome@algumacoisa.com.br" size="50" maxlength="50" required />
			   				</p>
			   			</label>
			   		</div>
			   	</div>
			   	<div class="row">
			   		<div class="col">
			   			<label for="formCadFunc-status">
			    			<p>Status:
			    				<select class="form-control" id="formCadFunc-status" required >
			    					<option value="A">Admin</option>
			    					<option value="B" selected>Padrão</option>
			    				</select>
			   				</p>
			   			</label>
			   			<label for="formCadFunc-ativo">
			    			<p>Ativo:
			    				<select class="form-control" id="formCadFunc-ativo" required >
			    					<option value="S">Sim</option>
			    					<option value="N">Não</option>
			    				</select>
			   				</p>
			   			</label>
		   			</div>
		   		</div>
		   		<div class="row">
		   			<div class="col">
			   			<button type="button" class="btn btn-success" id="btn-cad-func">Cadastrar Funcionario</button>
		   			</div>
		   		</div>
		   		<br />
		   		<p id="loader"></p>
		   		<div class="cad-func-status"></div>
		    </form>
		  </div>
		</div>
		<p>
		  <button class="btn btn-primary btn-collapse" type="button" data-toggle="collapse" data-target="#collapseGridFuncionarios" aria-expanded="false" aria-controls="collapseGridFuncionarios">
		    Ver Funcionarios Cadastrados
		  </button>
		</p>
		<div class="collapse" id="collapseGridFuncionarios">
		  <div class="card card-body text-center">
		    <h3><strong>Funcionarios Cadastrados</strong></h3>
		    <div class="cad-func-status"></div>
		    <hr />
		    <p>Para alterar os dados de um funcionário ou excluí-lo, clique sobre seu ID à esquerda.</p>
		    <p id="loader"></p>
		  <div id="listaFuncionarios"></div>
		</div>
	</div>
	</div>
	<script src="resources/js/scriptFuncionarios.js"></script>
</body>
</html>