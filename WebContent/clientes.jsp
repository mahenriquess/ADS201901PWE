<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="config/includes.html" %>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/cssClientes.css" />
<title>Clientes | MarThiRent</title>
</head>
<body>
	<%@include file="config/menu.jsp" %>
	
	<%
		if(!status.equals("A")){
			response.sendRedirect("dashboard.jsp");
		}
		
		if(sessao == null){
			response.sendRedirect("login.jsp");
		}
	%>
	
	<div class="container pagina text-center">
		<h1 class="h1"><i class="fas fa-users"></i> Clientes</h1>
		<br />
		<p>Escolha abaixo o que deseja fazer: </p>
		<p>
		  <button class="btn btn-primary btn-collapse" type="button" data-toggle="collapse" data-target="#collapseFormCadCliente" aria-expanded="false" aria-controls="collapseFormCadCliente">
		    Cadastrar Cliente
		  </button>
		</p>
		<div class="collapse" id="collapseFormCadCliente">
		  <div class="card card-body pagina">
		    <h3>Formulário de Cadastro de Clientes</h3>
		    <br />
		    <form class="form-group" id="formCadCli">
		    	<div class="row">
			    	<div class="col">
			    		<label for="formCadCli-nome">
			    			<p>Nome:
			    				<input class="form-control" type="text" id="formCadCli-nome" placeholder=" ex.: Fulano da Silva" size="35" maxlength="35" required />
			   				</p>
			   			</label>
			   			<label for="formCadCli-cpf">
			    			<p>CPF:
			    				<input class="form-control" type="text" id="formCadCli-cpf" placeholder=" ex.: 123.456.789-01" size="15" maxlength="15" required />
			   				</p>
			   			</label>
			   			<label for="formCadCli-rg">
			    			<p>RG:
			    				<input class="form-control" type="text" id="formCadCli-rg" placeholder=" ex.: 12.345.678-9" size="15" maxlength="15" required />
			   				</p>
			   			</label>
		   			</div>
		   		</div>
		   		<div class="row">
		   			<div class="col">
			   			<label for="formCadCli-email">
			    			<p>E-mail:
			    				<input class="form-control" type="email" id="formCadCli-email" placeholder="ex.: seunome@algumacoisa.com.br" size="50" maxlength="50" required />
			   				</p>
			   			</label>
			   			<label for="formCadCli-telefone">
			    			<p>Telefone:
			    				<input class="form-control" type="text" id="formCadCli-telefone" placeholder=" ex.: (11) 999999-9999" size="15" maxlength="15" required />
			   				</p>
			   			</label>
			   		</div>
			   	</div>
			   	<div class="row">
			   		<div class="col">
			   			<label for="formCadCli-sexo">
			    			<p>Sexo:
			    				<select class="form-control" id="formCadCli-sexo" required >
			    					<option value="M">Masculino</option>
			    					<option value="F">Feminino</option>
			    				</select>
			   				</p>
			   			</label>
			   			<label for="formCadCli-ativo">
			    			<p>Ativo:
			    				<select class="form-control" id="formCadCli-ativo" required >
			    					<option value="S">Sim</option>
			    					<option value="N">Não</option>
			    				</select>
			   				</p>
			   			</label>
		   			</div>
		   		</div>
		   		<div class="row">
		   			<div class="col">
			   			<button type="button" class="btn btn-success" id="btn-cad-cli">Cadastrar Cliente</button>
		   			</div>
		   		</div>
		   		<br />
		   		<p id="loader"></p>
		   		<div class="cad-cli-status"></div>
		    </form>
		  </div>
		</div>
		<p>
		  <button class="btn btn-primary btn-collapse" type="button" data-toggle="collapse" data-target="#collapseGridClientes" aria-expanded="false" aria-controls="collapseGridClientes">
		    Ver Clientes Cadastrados
		  </button>
		</p>
		<div class="collapse" id="collapseGridClientes">
		  <div class="card card-body text-center">
		    <h3><strong>Clientes Cadastrados</strong></h3>
		    <div class="cad-cli-status"></div>
		    <hr />
		    <p>Para alterar os dados de um cliente ou excluí-lo, clique sobre seu ID à esquerda.</p>
		    <p id="loader"></p>
		  <div id="listaClientes"></div>
		</div>
	</div>
	</div>
	<script src="resources/js/scriptClientes.js"></script>
</body>
</html>