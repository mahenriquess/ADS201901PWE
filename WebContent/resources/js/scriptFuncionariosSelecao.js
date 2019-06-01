$('#btn-atualiza-funcionario').click(function(){
	if(validaCamposModal()){
		$.ajax({
			datatype: "JSON",
			method: "POST",
			data: {
				id: $('#modal-id').val(),
				nome: $('#modal-nome').val(),
				username: $('#modal-username').val(),
				password: $('#modal-password').val(),
				email: $('#modal-email').val(),
				status: $('#modal-status').val(),
				ativo: $('#modal-ativo').val(),
			},
			
			url: "operacoes/funcionarios/attFuncionario.jsp",
			
			beforeSend: function(){
				$('#modal-loader').empty();
				$('#modal-loader').removeClass('bg-info text-center text-white');
				$('#modal-loader').html("<img src='resources/img/loading.gif' width='10%'/>");
			},
			
			timeout: 10000,
			
			success: function(resultado){
				if(resultado == true){
					alert("Funcionario atualizado com sucesso!");
					$('#form-modal input').val("");
					$('#form-modal textarea').val("");
					listarFuncionarios();
				} else {
					alert("Não foi possivel atualizar este funcionário, contate o administrador do sistema");
				}
			},
			
			error: function(){
				$('#modal-loader').empty();
				$('#modal-loader').addClass('bg-info text-center text-white');
				$('#modal-loader').html("Temporariamente indisponível. Tente novamente mais tarde.");
			},
		});
	}
	
	
	$('#modalSelecionaFuncionario').modal('hide');
});

$(".btn-seleciona").click(function(){
	carregaModal($(this).attr('rel'));
});

function carregaModal(id){
	console.log(id);
	$.ajax({
		datatype: "JSON",
		method: "GET",
		url: "operacoes/funcionarios/getFuncionarioID.jsp?id=" + id,
		
		success: function(funcionario) {
			$('#modal-id').val(funcionario.funcID);
			$('#modal-nome').val(funcionario.funcNome);
			$('#modal-username').val(funcionario.funcUsername);
			$('#modal-password').val(funcionario.funcPassword);
			$('#modal-email').val(funcionario.funcEmail);
			$('#modal-status').val(funcionario.funcStatus);
			$('#modal-ativo').val(funcionario.funcAtivo);
		},
		
		error: function(){
			console.log("Ocorreu um erro ao processar a solicitação.");
		},
		
		complete: function(){
			$('#modalSelecionaFuncionario').modal('show');
		}
		
	});
}

function validaCamposModal(){

	var qtdErros= 0;
	
	if(!validaTamanhoCampos($('#modal-nome').val())){
		criaMsgErro("Campo 'Nome' não pode estar vazio!");
		qtdErros++;
	}
	
	if(!validaTamanhoCampos($('#modal-username').val())){
		criaMsgErro("Campo 'Usuario' não pode estar vazio!");
		qtdErros++;
	}
	
	if(!validaTamanhoCampos($('#modal-email').val())){
		criaMsgErro("Campo 'Email' não pode estar vazio!");
		qtdErros++;
	}
		
	if(qtdErros > 0) {
		return false;
	}

	return true;
}

