$('#btn-atualiza-cliente').click(function(){
	if(validaCamposModal()){
		$.ajax({
			datatype: "JSON",
			method: "POST",
			data: {
				id: $('#modal-id').val(),
				nome: $('#modal-nome').val(),
				cpf: $('#modal-cpf').val(),
				rg: $('#modal-rg').val(),
				email: $('#modal-email').val(),
				telefone: $('#modal-telefone').val(),
				sexo: $('#modal-sexo').val(),
				ativo: $('#modal-ativo').val(),
			},
			
			url: "operacoes/clientes/attCliente.jsp",
			
			beforeSend: function(){
				$('#modal-loader').empty();
				$('#modal-loader').removeClass('bg-info text-center text-white');
				$('#modal-loader').html("<img src='resources/img/loading.gif' width='10%'/>");
			},
			
			timeout: 10000,
			
			success: function(resultado){
				if(resultado == true){
					alert("Cliente atualizado com sucesso!");
					$('#form-modal input').val("");
					$('#form-modal textarea').val("");
					listarClientes();
				} else {
					alert("Não foi possivel atualizar este cliente, contate o administrador do sistema");
				}
			},
			
			error: function(){
				$('#modal-loader').empty();
				$('#modal-loader').addClass('bg-info text-center text-white');
				$('#modal-loader').html("Temporariamente indisponível. Tente novamente mais tarde.");
			},
		});
	}
	
	
	$('#modalSelecionaCliente').modal('hide');
});

$('#btn-remove-cliente').click(function(){
	var res = confirm("Você está prestes a excluir este cliente.");
	if(res){
		$.ajax({
			datatype: "JSON",
			method: "GET",
		
			url: "operacoes/clientes/rmvCliente.jsp?id=" + $('#modal-id').val(),
			
			beforeSend: function(){
				$('#modal-loader').empty();
				$('#modal-loader').removeClass('bg-info text-center text-white');
				$('#modal-loader-img').html("<img src='resources/img/loading.gif' width='10%'/>");
			},
			
			timeout: 10000,
			
			success: function(resultado){
				if(resultado == true){
					alert("Cliente removido com sucesso.");
					$('#form-modal input').val("");
					$('#form-modal textarea').val("");
					listarClientes();
				} else {
					alert("Você não pode remover um veículo que esteja INATIVO.");
				}
				$('#modal-loader-img').empty();
			},
			
			error: function(){
				$('#modal-loader').empty();
				$('#modal-loader').addClass('bg-info text-center text-white');
				$('#modal-loader').html("Temporariamente indisponível. Tente novamente mais tarde.");
			},
		});
	}
	
	$('#modalSelecionaCliente').modal('hide');
});

$(".btn-seleciona").click(function(){
	carregaModal($(this).attr('rel'));
});

function carregaModal(id){
	console.log(id);
	$.ajax({
		datatype: "JSON",
		method: "GET",
		url: "operacoes/clientes/getClienteID.jsp?id=" + id,
		
		success: function(cliente) {
			$('#modal-id').val(cliente.cliID);
			$('#modal-nome').val(cliente.cliNome);
			$('#modal-cpf').val(cliente.cliCPF);
			$('#modal-rg').val(cliente.cliRG);
			$('#modal-email').val(cliente.cliEmail);
			$('#modal-telefone').val(cliente.cliTelefone);
			$('#modal-sexo').val(cliente.cliSexo);
			$('#modal-ativo').val(cliente.cliAtivo);
		},
		
		error: function(){
			console.log("Ocorreu um erro ao processar a solicitação.");
		},
		
		complete: function(){
			$('#modalSelecionaCliente').modal('show');
		}
		
	});
}

$('#modal-cpf').mask('000.000.000-00', {reverse: false});
$('#modal-rg').mask('00.000.000-0', {reverse: false});
$('#modal-telefone').mask('(00)00000-0000', {reverse: false});


function validaCamposModal(){

	var qtdErros= 0;
	
	if(!validaTamanhoCampos($('#modal-nome').val())){
		criaMsgErro("Campo 'Nome' não pode estar vazio!");
		qtdErros++;
	}
	
	if(!validaTamanhoCampos($('#modal-cpf').val())){
		criaMsgErro("Campo 'CPF' não pode estar vazio!");
		qtdErros++;
	}
	
	if(!validaTamanhoCampos($('#modal-rg').val())){
		criaMsgErro("Campo 'RG' não pode estar vazio!");
		qtdErros++;
	}
	
	if(!validaTamanhoCampos($('#modal-email').val())){
		criaMsgErro("Campo 'Email' não pode estar vazio!");
		qtdErros++;
	}
	
	if(!validaTamanhoCampos($('#modal-telefone').val())){
		criaMsgErro("Campo 'Telefone' não pode estar vazio!");
		qtdErros++;
	}
	
	if(qtdErros > 0) {
		return false;
	}

	return true;
}

