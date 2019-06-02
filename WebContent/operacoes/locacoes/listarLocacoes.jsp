<%@page import="dao.LocacaoDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/jquery/jquery.dataTables.min.css" />

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
				
				<!--  
				
					$('#modal-locacao-id').val(locacao.locacaoID);
					$('#modal-locacao-cliente').val(locacao.locacaoCli);
					$('#modal-locacao-veiculo').val(locacao.locacaoVeiculo);
					$('#modal-locacao-datahora').val(locacao.locacaoDataHora);
					$('#modal-locacao-dias').val(locacao.locacaoDias);
					$('#modal-locacao-valor').val(locacao.locacaoValor);
					$('#modal-locacao-devolucao').val(locacao.locacaoDevolucao);
					$('#modal-locacao-status').val(locacao.locacaoStatus);
					$('#modal-reg-locacao').modal('show');
				 -->
				<div class="modal-body">
					<form class="form-group" id="form-reg-devolucao">
					
					</form>
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
	<p id="modal-loader"></p>

	<table class="table table-responsive border" id="tabListaLocacoes">
		<thead>
			<tr>
				<th>ID</th>
				<th>CÓD. CLIENTE</th>
				<th>CÓD. VEÍCULO</th>
				<th>DATA LOCAÇÃO</th>
				<th>DIAS ALUGADOS</th>
				<th>VALOR TOTAL (R$)</th>
				<th>DATA DEVOLUÇÃO</th>
				<th>STATUS</th>
			</tr>
		</thead>
		<tbody>
<%
	try{
		
		LocacaoDAO locDao = new LocacaoDAO();
		ResultSet rsLoc = locDao.selecionarLocacoes("");
	
		while(rsLoc.next()){
			String locacaoID = rsLoc.getString("locacaoID");
			String locacaoCli = rsLoc.getString("locacaoCli");
			String locacaoVeiculo = rsLoc.getString("locacaoVeiculo");
			String locacaoDataHora = rsLoc.getString("locacaoDataHora");
			String locacaoDias = rsLoc.getString("locacaoDias");
			String locacaoValor = rsLoc.getString("locacaoValor");
			String locacaoDevolucao = rsLoc.getString("locacaoDevolucao");
			String locacaoStatus = rsLoc.getString("locacaoStatus");
			
			String classeLink = "btn "; 
			classeLink += locacaoStatus.equals("Pendente") ? "btn-success" : "btn-danger";
			classeLink += " btn-seleciona";
			
			out.println("<tr>");
				out.println("<td><a class='"+ classeLink + "' role='button' rel='" + locacaoID + "' href='#'>" + locacaoID + "</a></td>");
				out.println("<td>" + locacaoCli + "</td>");
				out.println("<td>" + locacaoVeiculo + "</td>");
				out.println("<td>" + locacaoDataHora + "</td>");
				out.println("<td>" + locacaoDias + "</td>");
				out.println("<td>" + locacaoValor + "</td>");
				out.println("<td>" + locacaoDevolucao + "</td>");
				out.println("<td>" + locacaoStatus + "</td>");
			out.println("</tr>");
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
%>
	</tbody>
	</table>
	<script>
	$(document).ready( function () {
	    $('#tabListaLocacoes').DataTable({
	    	responsive: true,
	    	"aoColumnDefs": [
                { 
                  "bSortable": true, "aTargets": [ 0 ],
                }
            ],
            "aaSorting": [[0, 'desc']],
            "bFilter": true,
            "bPaginate": true,
            "oLanguage": {
                  "sEmptyTable": "Nenhum registro encontrado",
                  "sInfo": "Veículos cadastrados no sistema",
                  "sInfoEmpty": "Mostrando 0 até de 0 registros",
				"sInfoFiltered": "(Filtrados de _MAX_ registros)", 
                  "sInfoPostFix": "",
                  "sInfoThousands": ".",
                  "sLengthMenu": "_MENU_ ",
                  "sLoadingRecords": "Carregando...",
                  "sProcessing": "Processando...",
                  "sZeroRecords": "Nenhum registro encontrado",
                  "sSearch": "Pesquisar",
                  "oPaginate": {
                      "sNext": "Próximo",
                      "sPrevious": "Anterior",
                      "sFirst": "Primeiro",
                      "sLast": "Último"
                  },
                  "oAria": {
                      "sSortAscending": ": Ordenar colunas de forma ascendente",
                      "sSortDescending": ": Ordenar colunas de forma descendente"
                  }
                }
  	    	});
		} );
	</script>
	<script src="<%=request.getContextPath() %>/assets/jquery/jquery.dataTables.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/scriptLocacoesSelecao.js"></script>