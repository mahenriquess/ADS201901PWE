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
<link rel="stylesheet" href="resources/css/cssLocacoes.css" />
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
					<p class="loaderlocacao"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="btn-cancela-locacao">Cancelar</button>
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
				data-toggle="collapse" data-target="#collapseLocacoes"
				aria-expanded="false" aria-controls="collapseLocacoes">
				Gerenciar Locações</button>
		</p>
		<div class="collapse" id="collapseLocacoes">
			<div class="card card-body text-center">
				<h3>
					<strong>Veículos Disponíveis para Locação</strong>
				</h3>
				<h4>Você pode refinar sua busca através destes filtros:</h4>
				<br />
				
				<form action="" method="post" class="form-group">
					<div class="row">
						<div class="col">
							<label>
								<h5 class="h5">de R$:</h5>
								<input class="form-control" type="number" id="valMin"
								name="valMin" min="0" placeholder="R$ 0,00" />
							</label>	 
							<label>
								<h5 class="h5">até R$:</h5>
								<input class="form-control" type="number" id="valMax"
								name="valMax" min="0" placeholder="R$ 0,00" />
							</label> 
							<label>
								<h5 class="h5">Marca</h5>
								<input type="text" class="form-control" name="marcaBusca"
								size="20" placeholder="Ex.: Chevrolet" />
							</label> 
							<label> 
								<button type="submit" class="btn btn-success"><i class="fas fa-search"></i> Buscar</button>
							</label>
						</div>						
					</div>
				</form>
				
				<%
					String min = null, max = null, marcaBusca = null;

					if (request.getParameter("valMin") != null) {
						min = request.getParameter("valMin");
					}
					if (request.getParameter("valMax") != null) {
						max = request.getParameter("valMax");
					}
					if (request.getParameter("marcaBusca") != null) {
						marcaBusca = request.getParameter("marcaBusca");
					}

					String restricoes = "";

					if ((min != null || max != null) && (!min.equals("") || !max.equals(""))) {
						if (!min.equals("") && max.equals("")) {
							restricoes += " AND veiValorLocacao > '" + min + "'";
						} else if (min.equals("") && !max.equals("")) {
							restricoes += " AND veiValorLocacao < '" + max + "'";
						} else {
							restricoes += " AND veiValorLocacao BETWEEN '" + min + "' AND '" + max + "'";
						}
					}

					if (marcaBusca != null && !marcaBusca.equals("")) {
						restricoes += " AND veiMarca LIKE '%" + marcaBusca + "%'";
					}
				%>
				<div class="container">
					<p>Abaixo, os carros disponíveis para locação:</p>
					<%
						VeiculoDAO veiDAOlocacao = new VeiculoDAO();
						ResultSet rsVeiculos = veiDAOlocacao.selecionarVeiculo("veiSituacao <> 'Indisponível'" + restricoes);

						out.println("<div class='row'>");
						int colunas = 0;

						while (rsVeiculos.next()) {
							if (colunas == 3) {
								out.println("</div>");
								out.println("<div class='row'>");
							}

							out.println("<div class='col-sm-4 bg-light border grid-veiculo'>");
							out.println("<br /><img class='img-responsive' width='128px' src='resources/img/car-photo.png'>");
							out.println("<h3 class='h3'><strong>" + rsVeiculos.getString("veiModelo") + "</strong></h3>");
							out.println("<h5 class='h5'>" + rsVeiculos.getString("veiAno") + " | "
									+ rsVeiculos.getString("veiCombustivel") + " | " + rsVeiculos.getString("veiMarca") + "</h5>");
							out.println("<h2 class='h2'>R$ " + rsVeiculos.getString("veiValorLocacao") + "</h2>");
							out.println("<button class='btn btn-success btn-grid-veiculo' type='button' rel='"
									+ rsVeiculos.getString("veiID") + "'>Alugar</button><br /><br />");
							out.println("</div>");

							colunas++;

							if (colunas == 3) {
								out.println("</div>");
								colunas = 0;
							}
						}
					%>
				</div>
				
			</div>
		</div>
		<p>
			<button class="btn btn-primary btn-collapse" type="button"
				data-toggle="collapse" data-target="#collapseDevolucoes"
				aria-expanded="false" aria-controls="collapseDevolucoes">
				Gerenciar Devoluções</button>
		</p>
		<div class="collapse" id="collapseDevolucoes">
			<div class="card card-body text-center">
				<h3>
					<strong>Veículos pendentes para Devolução</strong>
				</h3>
				<h4>Você pode refinar sua busca através destes filtros:</h4>
			
			</div>
		</div>
	</div>
	
	<script src="resources/js/scriptLocacoes.js"></script>
</body>
</html>