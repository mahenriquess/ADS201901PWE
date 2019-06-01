<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Funcionario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.FuncionarioDAO"%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/jquery/jquery.dataTables.min.css" />
<%
	FuncionarioDAO funcDAO = new FuncionarioDAO();
	ResultSet rs = funcDAO.selecionarFuncionarios("");
%>

<div class="modal" tabindex="-1" role="dialog" id="modalSelecionaFuncionario">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">DADOS DO FUNCIONARIO SELECIONADO</h5>
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
		   			<label for="modal-nome">
		    			<p>Nome:
		    				<input class="form-control" type="text" id="modal-nome" placeholder=" ex.: Fulano dos Santos" size="30" maxlength="50"/>
		   				</p>
		   			</label>
        		</div>
        	</div>
        	<div class="row">
		    	<div class="col">
		   			<label for="modal-username">
		    			<p>Nome de Usuário:
		    				<input class="form-control" type="text" id="modal-username" placeholder=" ex.: username" size="15" maxlength="15" />
		   				</p>
		   			</label>
		   			<label for="modal-password">
		    			<p>Senha:
		    				<input class="form-control" type="text" id="modal-password" placeholder="-----------" size="15" maxlength="15" required />
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
				</div>
			</div>   			
			<div class="row">
		   			<div class="col">
			   			<label for="modal-status">
			    			<p>Status:
			    				<select class="form-control" id="modal-status" required >
			    					<option value="A">Admin</option>
			    					<option value="B">Padrão</option>
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
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
        <button type="button" class="btn btn-primary" id="btn-atualiza-funcionario">Salvar Alterações</button>
      </div>
    </div>
  </div>
</div>
	<p id="modal-loader"></p>
	<table class="table table-responsive border" id="tabListaFuncionarios">
		<thead>
			<tr>
				<th>ID</th>
				<th>NOME</th>
				<th>USUARIO</th>
				<th>PASSWORD</th>
				<th>EMAIL</th>
				<th>STATUS</th>
				<th>ATIVO</th>
			</tr>
		</thead>
		<tbody>
<%
	try{
		
		
		while(rs.next()){
			String funcID = rs.getString("funcID");
			String funcNome = rs.getString("funcNome");
			String funcUsername = rs.getString("funcUsername");
			String funcPassword = rs.getString("funcPassword");
			String funcEmail = rs.getString("funcEmail");
			String funcStatus = rs.getString("funcStatus");
			String funcAtivo = rs.getString("funcAtivo");
			
			String classeLink = "btn "; 
			classeLink += funcAtivo.equals("S") ? "btn-success" : "btn-danger";
			classeLink += " btn-seleciona";
			
			out.println("<tr>");
				out.println("<td><a class='"+ classeLink + "' role='button' rel='" + funcID + "' href='#'>" + funcID + "</a></td>");
				out.println("<td>" + funcNome + "</td>");
				out.println("<td>" + funcUsername + "</td>");
				out.println("<td>" + funcPassword + "</td>");
				out.println("<td>" + funcEmail + "</td>");
				out.println("<td>" + funcStatus + "</td>");
				out.println("<td>" + funcAtivo + "</td>");
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
	    $('#tabListaFuncionarios').DataTable({
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
                  "sInfo": "Funcionários cadastrados no sistema",
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
	<script src="<%=request.getContextPath() %>/resources/js/scriptFuncionariosSelecao.js"></script>