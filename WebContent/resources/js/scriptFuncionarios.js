$(document).ready(function(){
	listarFuncionarios();
});

function listarFuncionarios(){
	$.ajax({
		datatype: "HTML",
		method: "GET",
		url: "operacoes/funcionarios/listarFuncionarios.jsp",
		
		beforeSend: function(){
			$('#listaFuncionarios').html("<img src='resources/img/loading.gif' width='20%'/>");
		},
		
		timeout: 10000,
		
		success: function(lista){		
			$('#listaFuncionarios').html(lista);
		},
		
		error: function(){
			console.log("Ocorreu um erro ao processar sua solicitação de busca.");
		}
	});
}

$('#btn-cad-func').click(function(){
	limpaMsgErro();
	if(validaCampos()){
		$.ajax({
			datatype: "JSON",
			method: "POST",
			data: {
				nome: $('#formCadFunc-nome').val(),
				username: $('#formCadFunc-username').val(),
				password: $('#formCadFunc-password').val(),
				email: $('#formCadFunc-email').val(),
				status: $('#formCadFunc-status').val(),
				ativo: $('#formCadFunc-ativo').val()
			},
			url: "operacoes/funcionarios/cadFuncionarios.jsp",
			
			beforeSend: function(){
				$('#loader').empty();
				$('#loader').removeClass('bg-info text-center text-white');
				$('#loader').html("<img src='resources/img/loading.gif' width='10%'/>");
			},
			
			timeout: 10000,
			
			success: function(resultado){
				if(resultado == true){
					$('#loader').removeClass('bg-info text-center text-white');
					$('#loader').removeClass('bg-danger text-center text-white');
					$('#loader').addClass('bg-success text-center text-white');
					$('#loader').html("Funcionario cadastrado com sucesso!");
					$('#formCadFunc input').val("");
					$('#formCadFunc textarea').val("");
					listarFuncionarios();
				} else {
					$('#loader').removeClass('bg-info text-center text-white');
					$('#loader').addClass('bg-danger text-center text-white');
					$('#loader').html("Ocorreu um erro ao cadastrar o funcionario.");
				}
			},
			
			error: function(){
				$('#loader').empty();
				$('#loader').addClass('bg-info text-center text-white');
				$('#loader').html("Temporariamente indisponível. Tente novamente mais tarde.");
			}
		});
		
		return true;
	} else {
		return false;
	}
	
});

function validaCampos(){

	var qtdErros= 0;
	
	if(!validaTamanhoCampos($('#formCadFunc-nome').val())){
		criaMsgErro("Campo 'Nome' não pode estar vazio!");
		qtdErros++;
	}
	
	if(!validaTamanhoCampos($('#formCadFunc-username').val())){
		criaMsgErro("Campo 'CPF' não pode estar vazio!");
		qtdErros++;
	}
	
	if(!validaTamanhoCampos($('#formCadFunc-password').val())){
		criaMsgErro("Campo 'RG' não pode estar vazio!");
		qtdErros++;
	}
	
	if(!validaTamanhoCampos($('#formCadFunc-email').val())){
		criaMsgErro("Campo 'Email' não pode estar vazio!");
		qtdErros++;
	}
	
	if(qtdErros > 0) {
		return false;
	}

	return true;
}


function criaMsgErro(mensagem){
	var erro = document.createElement('p');
	erro.className = 'bg-danger text-center text-white';
	erro.append(mensagem);
	$('.cad-func-status').append(erro);
}

function limpaMsgErro(){
	$('.cad-func-status').empty();
}
function validaTamanhoCampos(campo){
	return (campo.length > 1);
}