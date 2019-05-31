<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="dao.CategoriaVeiculosDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Cliente."%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.ClienteDAO"%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/jquery/jquery.dataTables.min.css" />
<%
	ClienteDAO cliDAO = new ClienteDAO();
	ResultSet rs = cliDAO.selecionarClientes("");
%>

<div class="modal" tabindex="-1" role="dialog" id="modalSelecionaCliente">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">DADOS DO CLIENTE SELECIONADO</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="modal-form">
        	<div class="row">
        		<div class="col">
        			<label for="modal-id">
		    			<p>ID:
		    				<input class="form-control" type="text" id="modal-id" size="4" placeholder="ID" readonly="true" /> 
		   				</p>
		   			</label>
        		</div>
        	</div>
        	<div class="row">
		    	<div class="col"> 
		    		<label for="modal-nome">
		    			<p>Nome:
		    				<input class="form-control" type="text" id="modal-nome" placeholder=" ex.: Fulano dos Santos" size="50" maxlength="50"/>
		   				</p>
		   			</label>
		   			<label for="modelo-cpf">
		    			<p>CPF:
		    				<input class="form-control" type="text" id="modal-cpf" placeholder=" ex.: 123.456.789-01" size="15" maxlength="15" readonly="true" />
		   				</p>
		   			</label>
		   			<label for="modal-rg">
		    			<p>RG:
		    				<input class="form-control" type="text" id="modal-rg" placeholder=" ex.: 12.345.678-3" size="15" maxlength="15" required />
		   				</p>
		   			</label>
	   			</div>
	   		</div>
	   		<div class="row">
		   			<div class="col">
			   			<label for="modal-email">
			    			<p>E-mail:
			    				<input class="form-control" type="text" id="modal-email" placeholder="ex.: seunome@algumacoisa.com.br" required />
			   				</p>
			   			</label>
			   			<label for="modal-telefone">
			    			<p>Telefone:
			    				<input class="form-control" type="text" id="modal-email" placeholder="ex.: seunome@algumacoisa.com.br" required />
			    			</p>
			   			</label>
			   			<label for="modal-sexo">
			    			<p>Sexo:
			    				<select class="form-control" id="modal-sexo" required >
			    					<option value="M">Masculino</option>
			    					<option value="F">Feminino</option>
			    				</select>
			   				</p>
			   			</label>
			   			<label for="modal-ativo">
			    			<p>Ativo:
			    				<select class="form-control" id="modal-ativo" required >
			    					<option value="S">Sim</option>
			    					<option value="N">Não</option>
			    				</select>
			   				</p>
			   			</label>
		   			</div>
		   		</div>
        </form>
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" id="btn-remove-cliente">Excluir Veículo</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
        <button type="button" class="btn btn-primary" id="btn-atualiza-cliente">Salvar Alterações</button>
      </div>
    </div>
  </div>
</div>
	<p id="modal-loader"></p>
	<table class="table table-responsive border" id="tabListaClientes">
		<thead>
			<tr>
				<th>ID</th>
				<th>NOME</th>
				<th>CPF</th>
				<th>RG</th>
				<th>EMAIL</th>
				<th>TELEFONE</th>
				<th>SEXO</th>
				<th>ATIVO</th>
			</tr>
		</thead>
		<tbody>
<%
	try{
		
		
		while(rs.next()){
			String cliID = rs.getString("cliID");
			String cliNome = rs.getString("cliNome");
			String cliCPF = rs.getString("cliCPF");
			String cliRG = rs.getString("cliRG");
			String cliEmail = rs.getString("cliEmail");
			String cliTelefone = rs.getcliing("cliTelefone");
			String cliSexo = rs.getString("cliSexo");
			String cliAtivo = rs.getString("cliAtivo");
			
			String classeLink = "btn "; 
			classeLink += cliSituacao.equals("Disponível") ? "btn-success" : "btn-danger";
			classeLink += " btn-seleciona";
			
			out.println("<tr>");
				out.println("<td><a class='"+ classeLink + "' role='button' rel='" + cliID + "' href='#'>" + cliID + "</a></td>");
				out.println("<td>" + cliSituacao + "</td>");
				out.println("<td>" + cliPlaca + "</td>");
				out.println("<td>" + cliMarca + "</td>");
				out.println("<td>" + cliModelo + "</td>");
				out.println("<td>" + cliCor + "</td>");
				out.println("<td>" + cliCategoria + "</td>");
				out.println("<td>" + cliAno + "</td>");
				out.println("<td>" + cliValorLocacao + "</td>");
				out.println("<td>" + cliCombustivel + "</td>");
				out.println("<td>" + cliObservacao + "</td>");
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
	    $('#tabListaVeiculos').DataTable({
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
	<script src="<%=request.getContextPath() %>/resources/js/scriptClientesSelecao.js"></script>