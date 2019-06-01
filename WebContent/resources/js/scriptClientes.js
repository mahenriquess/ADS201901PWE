$(document).ready(function(){
	listarClientes();
});

function listarClientes(){
	$.ajax({
		datatype: "HTML",
		method: "GET",
		url: "operacoes/clientes/listarClientes.jsp",
		
		beforeSend: function(){
			$('#listaClientes').html("<img src='resources/img/loading.gif' width='20%'/>");
		},
		
		timeout: 10000,
		
		success: function(lista){		
			$('#listaClientes').html(lista);
		},
		
		error: function(){
			console.log("Ocorreu um erro ao processar sua solicitação de busca.");
		}
	});
}

$('#btn-cad-cli').click(function(){
	limpaMsgErro();
	if(validaCampos()){
		$.ajax({
			datatype: "JSON",
			method: "POST",
			data: {
				nome: $('#formCadCli-nome').val(),
				cpf: $('#formCadCli-cpf').val(),
				rg: $('#formCadCli-rg').val(),
				email: $('#formCadCli-email').val(),
				telefone: $('#formCadCli-telefone').val(),
				sexo: $('#formCadCli-sexo').val(),
				ativo: $('#formCadCli-ativo').val()
			},
			url: "operacoes/clientes/cadClientes.jsp",
			
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
					$('#loader').html("Cliente cadastrado com sucesso!");
					$('#formCadCli input').val("");
					$('#formCadCli textarea').val("");
					listarClientes();
				} else {
					$('#loader').removeClass('bg-info text-center text-white');
					$('#loader').addClass('bg-danger text-center text-white');
					$('#loader').html("Ocorreu um erro ao cadastrar o cliente.");
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

$('#formCadCli-cpf').mask('000.000.000-00', {reverse: false});
$('#formCadCli-rg').mask('00.000.000-0', {reverse: false});
$('#formCadCli-telefone').mask('(00)00000-0000', {reverse: false});


function validaCampos(){

	var qtdErros= 0;
	
	if(!validaTamanhoCampos($('#formCadCli-nome').val())){
		criaMsgErro("Campo 'Nome' não pode estar vazio!");
		qtdErros++;
	}
	
	if(!validaTamanhoCampos($('#formCadCli-cpf').val())){
		criaMsgErro("Campo 'CPF' não pode estar vazio!");
		qtdErros++;
	}
	
	if(!validaTamanhoCampos($('#formCadCli-rg').val())){
		criaMsgErro("Campo 'RG' não pode estar vazio!");
		qtdErros++;
	}
	
	if(!validaTamanhoCampos($('#formCadCli-email').val())){
		criaMsgErro("Campo 'Email' não pode estar vazio!");
		qtdErros++;
	}
	
	if(!validaTamanhoCampos($('#formCadCli-telefone').val())){
		criaMsgErro("Campo 'Telefone' não pode estar vazio!");
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
	$('.cad-cli-status').append(erro);
}

function limpaMsgErro(){
	$('.cad-cli-status').empty();
}
function validaTamanhoCampos(campo){
	return (campo.length > 1);
}