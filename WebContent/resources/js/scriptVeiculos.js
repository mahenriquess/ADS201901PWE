$(document).ready(function(){
	listarVeiculos();
});

function listarVeiculos(){
	$.ajax({
		datatype: "HTML",
		method: "GET",
		url: "operacoes/veiculos/listarVeiculos.jsp",
		
		beforeSend: function(){
			$('#listaVeiculos').html("<img src='resources/img/loading.gif' width='20%'/>");
		},
		
		timeout: 10000,
		
		success: function(lista){		
			$('#listaVeiculos').html(lista);
		},
		
		error: function(){
			console.log("Ocorreu um erro ao processar sua solicitação de busca.");
		}
	});
}

$('#btn-cad-vei').click(function(){
	limpaMsgErro();
	if(validaCampos()){
		$.ajax({
			datatype: "JSON",
			method: "POST",
			data: {
				placa: $('#formCadVei-placa').val(),
				marca: $('#formCadVei-marca').val(),
				modelo: $('#formCadVei-modelo').val(),
				cor: $('#formCadVei-cor').val(),
				categoria: $('#formCadVei-categoria').val(),
				ano: $('#formCadVei-ano').val(),
				valor: parseFloat($('#formCadVei-valor').val()),
				combustivel: $("input[name='combustivel']:checked").val(),
				observacao: $('#formCadVei-observacao').val(),
				km: $('#formCadVei-km').val() 
			},
			url: "operacoes/veiculos/cadVeiculo.jsp",
			
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
					$('#loader').html("Veículo cadastrado com sucesso!");
					$('#formCadVei input').val("");
					$('#formCadVei textarea').val("");
					listarVeiculos();
				} else {
					$('#loader').removeClass('bg-info text-center text-white');
					$('#loader').addClass('bg-danger text-center text-white');
					$('#loader').html("Ocorreu um erro ao cadastrar o veículo.");
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

$('#formCadVei-placa').mask("SSS#AA#"); //3 letras, 1 número, 2 números ou letras e 1 número
$('#formCadVei-km').mask("#######");
$('#formCadVei-placa').keyup(function(){
	return $(this).val($(this).val().toUpperCase());
});

$('#formCadVei-valor').mask("#.###.##0,00", {reverse: true});

function validaCampos(){
	var qtdErros= 0;
	
	if(!validaPlaca($('#formCadVei-placa').val())){
		criaMsgErro("Por favor, digite a placa em um formato válido.");
		qtdErros++;
	}
	
	if(!validaAno($('#formCadVei-ano').val())){
		criaMsgErro("Por favor, digite um ano entre 1930 e o ano atual.");
		qtdErros++;
	}
	
	if(!validaTamanhoCampos($('#formCadVei-marca').val())){
		criaMsgErro("Campo 'Marca' não pode estar vazio!");
		qtdErros++;
	}
	
	if(!validaTamanhoCampos($('#formCadVei-modelo').val())){
		criaMsgErro("Campo 'Modelo' não pode estar vazio!");
		qtdErros++;
	}
	
	if(!validaTamanhoCampos($('#formCadVei-valor').val())){
		criaMsgErro("Por favor, digite o valor de locação para este veículo.");
		qtdErros++;
	}
	
	if(!validaKM($('#formCadVei-km').val())){
		criaMsgErro("Por favor, digite uma quilometragem válida.");
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
	$('.cad-vei-status').append(erro);
}

function limpaMsgErro(){
	$('.cad-vei-status').empty();
}

function validaPlaca(placa){
	const regex = new RegExp('[A-Z]{3}[0-9][A-Z0-9]{2}[0-9]');
	return regex.test(placa);
}

function validaAno(ano){
	var year = new Date();
	return (ano > 1930 && ano < year.getFullYear());
}

function validaTamanhoCampos(campo){
	return (campo.length > 1);
}

function validaKM(km){
	return (km > 0 && km < 1000000);
}