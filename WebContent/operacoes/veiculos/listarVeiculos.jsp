<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="dao.CategoriaVeiculosDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Veiculo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.VeiculoDAO"%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/jquery/jquery.dataTables.min.css" />
<%
	VeiculoDAO veiDao = new VeiculoDAO();
	ResultSet rs = veiDao.selecionarVeiculo("");
%>

<div class="modal" tabindex="-1" role="dialog" id="modalSelecionaVeiculo">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">DADOS DO VEÍCULO SELECIONADO</h5>
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
        		<div class="col">
        			<label for="modal-situacao">
			    			<p>Situação:
			    				<select class="form-control" id="modal-situacao" required >
			    					<option value="Disponível">Disponível</option>
			    					<option value="Indisponível">Indisponível</option>
			    				</select>
			   				</p>
			   			</label>
        		</div>
        	</div>
        	<div class="row">
		    	<div class="col"> 
		    		<label for="modal-placa">
		    			<p>Placa:
		    				<input class="form-control" type="text" id="modal-placa" placeholder=" ex.:AAA0000" size="12" maxlength="7" readonly="true" />
		   				</p>
		   			</label>
		   			<label for="modelo-marca">
		    			<p>Marca:
		    				<input class="form-control" type="text" id="modal-marca" placeholder=" ex.: Toyota" size="25" maxlength="25" required />
		   				</p>
		   			</label>
		   			<label for="modal-modelo">
		    			<p>Modelo:
		    				<input class="form-control" type="text" id="modal-modelo" placeholder=" ex.: Corolla" size="25" maxlength="25" required />
		   				</p>
		   			</label>
		   			<label for="modal-km">
		    			<p>KM rodados:
		    				<input class="form-control" type="text" id="modal-km" required />
		   				</p>
		   			</label>
	   			</div>
	   		</div>
	   		<div class="row">
		   			<div class="col">
			   			<label for="modal-ano">
			    			<p>Ano:
			    				<%
			    					GregorianCalendar cal = new GregorianCalendar();
			    				%>
			    				<input class="form-control" type="number" id="modal-ano" placeholder="ex.: 1991" min="1930" max="<%=cal.get(Calendar.YEAR) %>" required />
			   				</p>
			   			</label>
			   			<label for="modal-categoria">
			    			<p>Categoria:
			    				<select class="form-control" id="modal-categoria">
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
			   			<label for="modal-cor">
			    			<p>Cor:
			    				<select class="form-control" id="modal-cor" required >
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
			   			<label for="modal-valor">
			    			<p>Valor da locação (R$):
			    				<input class="form-control" type="text" id="modal-valor" size="15" maxlength="14" required />
			   				</p>
			   			</label>
		   			</div>
		   		</div>
		   		<div class="row">
		   			<div class="col">
			   			<label for="modal-combustivel">
			    			<p>Tipo de combustível:</p>
			    				<span class="radio-buttons">
			    					<ul>
			    						<li><label for="gasolina"><input type="radio" name="modal-combustivel" id="Gasolina" value="Gasolina"/>Gasolina</label></li>
					    				<li><label for="etanol"><input type="radio" name="modal-combustivel" id="Etanol" value="Etanol"/>Etanol</label></li>
					    				<li><label for="gas"><input type="radio" name="modal-combustivel" id="Gás" value="Gás"/>Gás</label></li>
					    				<li><label for="flex"><input type="radio" name="modal-combustivel" id="Flex" value="Flex"/>Flex</label></li>
			    					</ul>
			    				</span>
			   			</label>
		   			</div>
		   		</div>
		   		<div class="row">
		   			<div class="col">
			   			<label for="modal-observacao">
			    			<p>Observação:
			    				<br />
			    				<textarea class="form-control" id="modal-observacao" rows="5" cols="50"></textarea>
			   				</p>
			   			</label>
		   			</div>
		   		</div>
        </form>
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" id="btn-remove-veiculo">Excluir Veículo</button>
        <button type="button" class="btn btn-primary" id="btn-atualiza-veiculo">Salvar Alterações</button>
      </div>
    </div>
  </div>
</div>
	<p id="modal-loader"></p>
	<table class="table table-responsive border" id="tabListaVeiculos">
		<thead>
			<tr>
				<th>ID</th>
				<th>SITUAÇÃO</th>
				<th>PLACA</th>
				<th>MARCA</th>
				<th>MODELO</th>
				<th>COR</th>
				<th>CATEGORIA</th>
				<th>ANO</th>
				<th>VALOR (R$)</th>
				<th>TIPO COMB</th>
				<th>OBSERVAÇÃO</th>
				<th>KM RODADOS</th>
			</tr>
		</thead>
		<tbody>
<%
	try{
		
		CategoriaVeiculosDAO catVeiDao = new CategoriaVeiculosDAO();
		ResultSet rsCat = catVeiDao.selecionarCategorias();
		
		ArrayList<String> veiCategoriaNome = new ArrayList<>();
		while(rsCat.next()){
			veiCategoriaNome.add(rsCat.getString("catNome"));
		}
		
		while(rs.next()){
			String veiID = rs.getString("veiID");
			String veiPlaca = rs.getString("veiPlaca");
			String veiMarca = rs.getString("veiMarca");
			String veiModelo = rs.getString("veiModelo");
			String veiCor = rs.getString("veiCor");
			String veiCategoria = veiCategoriaNome.get(Integer.parseInt(rs.getString("veiCategoria"))-1);
			String veiAno = rs.getString("veiAno");
			String veiValorLocacao = rs.getString("veiValorLocacao");
			String veiCombustivel = rs.getString("veiCombustivel");
			String veiSituacao = rs.getString("veiSituacao");
			String veiObservacao = rs.getString("veiObservacao");
			String veiKm = rs.getString("veiKM");
			
			String classeLink = "btn "; 
			classeLink += veiSituacao.equals("Disponível") ? "btn-success" : "btn-danger";
			classeLink += " btn-seleciona";
			
			out.println("<tr>");
				out.println("<td><a class='"+ classeLink + "' role='button' rel='" + veiID + "' href='#'>" + veiID + "</a></td>");
				out.println("<td>" + veiSituacao + "</td>");
				out.println("<td>" + veiPlaca + "</td>");
				out.println("<td>" + veiMarca + "</td>");
				out.println("<td>" + veiModelo + "</td>");
				out.println("<td>" + veiCor + "</td>");
				out.println("<td>" + veiCategoria + "</td>");
				out.println("<td>" + veiAno + "</td>");
				out.println("<td>" + veiValorLocacao + "</td>");
				out.println("<td>" + veiCombustivel + "</td>");
				out.println("<td>" + veiObservacao + "</td>");
				out.println("<td>" + veiKm + "</td>");
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
	<script src="<%=request.getContextPath() %>/resources/js/scriptVeiculosSelecao.js"></script>