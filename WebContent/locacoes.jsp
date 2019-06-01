<%@page import="dao.VeiculoDAO"%>
<%@page import="dao.ClienteDAO"%>
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
<%@include file="config/includes.html"%>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/cssVeiculos.css" />
<title>Locações | MarThiRent</title>
</head>
<body>
	<%@include file="config/menu.jsp"%>

	<%
		if(sessao == null){
			response.sendRedirect("login.jsp");
		}
	%>
	<div class="modal" id="modal-reg-locacao" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">ALUGAR VEÍCULO</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Fechar">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Formulário de registro de locações</p>
					<form class="form-group" id="form-reg-locacao">
						<p>Cliente: 
							<select id="form-reg-locacao-cli" class="form-control" required>
								<option value="">Selecione um cliente...</option>
							<%
								ClienteDAO cliDAOselect = new ClienteDAO();
								ResultSet rsClientes = cliDAOselect.selecionarClientes("");
								
								while(rsClientes.next()){
									out.println("<option value='" +rsClientes.getString("cliID") + "'>" + rsClientes.getString("cliNome") + " - " + rsClientes.getString("cliCPF") + "</option>");	
								}
									
							%>
							</select>
						</p> 
							<p id="loader-cli"></p>
							<br />
							<input type="hidden" class="form-control" id="form-reg-locacao-id" />
							<p> Marca
							<input type="text" class="form-control" id="form-reg-locacao-marca" readonly="true"/>
							</p>
							<p> Modelo
							<input type="text" class="form-control" id="form-reg-locacao-modelo" readonly="true"/>
							</p>
							<p> Ano
							<input type="text" class="form-control" id="form-reg-locacao-ano" size="5" readonly="true"/>
							</p>
							<p> Combustível
							<input type="text" class="form-control" id="form-reg-locacao-combustivel" readonly="true"/>
							</p>
							<p> Valor (R$):
							<input type="text" class="form-control" id="form-reg-locacao-valor" readonly="true" />
							</p>
							<p> Qtd. de Dias:
							<input type="number" class="form-control" id="form-reg-locacao-dias" min="1" max="60"/>
							</p>
							<p id="loader-dias"></p>
							<p> Total a pagar (R$):
							<input type="text" class="form-control" id="form-reg-locacao-total" readonly="true"/>
							</p>
							<p id="loader-total"></p>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cancelar</button>
					<button type="button" class="btn btn-success" id="btn-reg-locacao">Alugar
						Veículo</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal" id="modal-reg-devolucao" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">DEVOLVER VEÍCULO</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Fechar">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Formulário de registro de devoluções</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cancelar</button>
					<button type="button" class="btn btn-success">Devolver
						Veículo</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container pagina text-center">
		<h1 class="h1">
			<i class="fas fa-money-check-alt"></i> LOCAÇÕES
		</h1>
		<br />
		<p>Escolha abaixo o que deseja fazer:</p>
		<p>
			<button class="btn btn-primary btn-collapse" type="button"
				id="btn-realizar-devolucao">Realizar Devolução</button>
		</p>
		<hr />
		<div class="container">
			<p>Abaixo, os carros disponíveis para locação: </p>
			<%
				VeiculoDAO veiDAOlocacao = new VeiculoDAO();
				ResultSet rsVeiculos = veiDAOlocacao.selecionarVeiculo("veiSituacao <> 'Indisponível'");
				
				out.println("<div class='row'>");
				int linhas = 0, colunas = 0;
				
				while(rsVeiculos.next()) {
					if(colunas == 3){
						colunas = 0;
						out.println("</div>");
						out.println("<div class='row'>");
					}
					
					out.println("<div class='col-sm-4'>");
						out.println("<h3 class='h3'>" + rsVeiculos.getString("veiModelo") + "</h3>");
						out.println("<h5 class='h5'>" + rsVeiculos.getString("veiAno") + " | " + rsVeiculos.getString("veiCombustivel") + "</h5>");
						out.println("<button class='btn btn-success btn-grid-veiculo' type='button' rel='" +rsVeiculos.getString("veiID") + "'>Alugar</button>");					
					out.println("</div>");
					
					colunas++;
					
					if(colunas == 3){
						out.println("</div>");
					}
				}
				
			%>
		</div>
	</div>
	<script src="resources/js/scriptLocacoes.js"></script>
</body>
</html>