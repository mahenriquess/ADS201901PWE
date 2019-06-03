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
		<h1 class="h1"><i class="fas fa-car"></i> VEÍCULOS</h1>
		<br />
		<p>Escolha abaixo o que deseja fazer: </p>
		<p>
		  <button class="btn btn-primary btn-collapse" type="button" data-toggle="collapse" data-target="#collapseFormCadVeiculo" aria-expanded="false" aria-controls="collapseFormCadVeiculo">
		    Cadastrar Veículo
		  </button>
		</p>
		<div class="collapse" id="collapseFormCadVeiculo">
		  <div class="card card-body pagina">
		    <h3>Formulário de Cadastro de Veículo</h3>
		    <br />
		    <form class="form-group" id="formCadVei">
		    	<div class="row">
			    	<div class="col">
			    		<label for="formCadVei-placa">
			    			<p>Placa:
			    				<input class="form-control" type="text" id="formCadVei-placa" placeholder=" ex.:AAA0000" size="12" maxlength="7" required />
			   				</p>
			   			</label>
			   			<label for="formCadVei-marca">
			    			<p>Marca:
			    				<input class="form-control" type="text" id="formCadVei-marca" placeholder=" ex.: Toyota" size="25" maxlength="25" required />
			   				</p>
			   			</label>
			   			<label for="formCadVei-modelo">
			    			<p>Modelo:
			    				<input class="form-control" type="text" id="formCadVei-modelo" placeholder=" ex.: Corolla" size="25" maxlength="25" required />
			   				</p>
			   			</label>
			   			<label for="formCadVei-ano">
			    			<p>Ano:
			    				<%
			    					GregorianCalendar cal = new GregorianCalendar();
			    				%>
			    				<input class="form-control" type="number" id="formCadVei-ano" placeholder="ex.: 1991" min="1930" max="<%=cal.get(Calendar.YEAR) %>" required />
			   				</p>
			   			</label>
		   			</div>
		   		</div>
		   		<div class="row">
		   			<div class="col">
			   			<label for="formCadVei-categoria">
			    			<p>Categoria:
			    				<select class="form-control" id="formCadVei-categoria">
			    					<%
				    					ResultSet catVei = new CategoriaVeiculosDAO().selecionarCategorias();
						    			
						    			try {
						    				while(catVei.next()) {
						    					String id = catVei.getString("catID");
						    					String nome = catVei.getString("catNome");
						    					out.println("<option value='" + id + "'>" + nome + "</option>");
						    				}
						    			} catch (SQLException e) {
						    				e.printStackTrace();
						    			}
			
			    					%>
			    				</select>
			   				</p>
			   			</label>
			   			<label for="formCadVei-cor">
			    			<p>Cor:
			    				<select class="form-control" id="formCadVei-cor" required >
			    					<option value="Amarelo">Amarelo</option>
			    					<option value="Azul">Azul</option>
			    					<option value="Bege">Bege</option>
			    					<option value="Branca">Branca</option>
			    					<option value="Cinza">Cinza</option>
			    					<option value="Dourada">Dourada</option>
			    					<option value="Grená">Grená</option>
			    					<option value="Laranja">Laranja</option>
			    					<option value="Marrom">Marrom</option>
			    					<option value="Prata">Prata</option>
			    					<option value="Preta">Preta</option>
			    					<option value="Rosa">Rosa</option>
			    					<option value="Roxa">Roxa</option>
			    					<option value="Verde">Verde</option>
			    					<option value="Vermelha">Vermelha</option>
			    					<option value="Fantasia">Fantasia</option>
			    				</select>
			   				</p>
			   			</label>
			   			<label for="formCadVei-valor">
			    			<p>Valor da locação (R$):
			    				<input class="form-control" type="text" id="formCadVei-valor" size="15" maxlength="14" required />
			   				</p>
			   			</label>
			   			<label for="formCadVei-km">
			    			<p>KM rodados:
			    				<input class="form-control" type="text" id="formCadVei-km" required />
			   				</p>
			   			</label>
		   			</div>
		   		</div>
		   		<div class="row">
		   			<div class="col">
			   			<label for="formCadVei-combustivel">
			    			<p>Tipo de combustível:</p>
			    				<span class="radio-buttons">
			    					<ul>
			    						<li><label for="gasolina"><input type="radio" name="combustivel" id="gasolina" value="Gasolina" checked/>Gasolina</label></li>
					    				<li><label for="etanol"><input type="radio" name="combustivel" id="etanol" value="Etanol"/>Etanol</label></li>
					    				<li><label for="gas"><input type="radio" name="combustivel" id="gas" value="Gás"/>Gás</label></li>
					    				<li><label for="flex"><input type="radio" name="combustivel" id="flex" value="Flex"/>Flex</label></li>
			    					</ul>
			    				</span>
			   			</label>
		   			</div>
		   		</div>
		   		<div class="row">
		   			<div class="col">
			   			<label for="formCadVei-observacao">
			    			<p>Observação:
			    				<br />
			    				<textarea class="form-control" id="formCadVei-observacao" rows="5" cols="50"></textarea>
			   				</p>
			   			</label>
		   			</div>
		   		</div>
		   		<div class="row">
		   			<div class="col">
			   			<button type="button" class="btn btn-success" id="btn-cad-vei">Cadastrar Veículo</button>
		   			</div>
		   		</div>
		   		<br />
		   		<p id="loader"></p>
		   		<div class="cad-vei-status"></div>
		    </form>
		  </div>
		</div>
		<p>
		  <button class="btn btn-primary btn-collapse" type="button" data-toggle="collapse" data-target="#collapseGridVeiculos" aria-expanded="false" aria-controls="collapseGridVeiculos">
		    Visualizar Veículos
		  </button>
		</p>
		<div class="collapse" id="collapseGridVeiculos">
		  <div class="card card-body text-center">
		    <h3><strong>Veículos Cadastrados</strong></h3>
		    <div class="cad-vei-status"></div>
		    <hr />
		    <p>Para alterar os dados de um veículo ou excluí-lo, clique sobre seu ID à esquerda.</p>
		    <p id="loader"></p>
		  <div id="listaVeiculos"></div>
		</div>
	</div>
	<script src="resources/js/scriptVeiculos.js"></script>
</body>
</html>