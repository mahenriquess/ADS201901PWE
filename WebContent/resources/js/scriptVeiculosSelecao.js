$('#modal-km').mask("#######");
$('#btn-atualiza-veiculo').click(function(){
	if(validaCamposModal()){
		$.ajax({
			datatype: "JSON",
			method: "POST",
			data: {
				id: $('#modal-id').val(),
				placa: $('#modal-placa').val(),
				marca: $('#modal-marca').val(),
				modelo: $('#modal-modelo').val(),
				cor: $('#modal-cor').val(),
				categoria: $('#modal-categoria').val(),
				ano: $('#modal-ano').val(),
				valor: parseFloat($('#modal-valor').val()),
				combustivel: $("input[name='modal-combustivel']:checked").val(),
				situacao: $('#modal-situacao').val(),
				observacao: $('#modal-observacao').val(),
				km: $('#modal-km').val()
			},
			
			url: "operacoes/veiculos/attVeiculo.jsp",
			
			beforeSend: function(){
				$('#modal-loader').empty();
				$('#modal-loader').removeClass('bg-info text-center text-white');
				$('#modal-loader').html("<img src='resources/img/loading.gif' width='10%'/>");
			},
			
			timeout: 10000,
			
			success: function(resultado){
				if(resultado == true){
					alert("Veículo atualizado com sucesso!");
					$('#form-modal input').val("");
					$('#form-modal textarea').val("");
					listarVeiculos();
				} else {
					alert("Você não pode atualizar um veículo que esteja INDISPONÍVEL.");
				}
			},
			
			error: function(){
				$('#modal-loader').empty();
				$('#modal-loader').addClass('bg-info text-center text-white');
				$('#modal-loader').html("Temporariamente indisponível. Tente novamente mais tarde.");
			},
		});
	}
	
	
	$('#modalSelecionaVeiculo').modal('hide');
});

$('#btn-remove-veiculo').click(function(){
	var res = confirm("Você está prestes a excluir este veículo.");
	if(res){
		$.ajax({
			datatype: "JSON",
			method: "GET",
		
			url: "operacoes/veiculos/rmvVeiculo.jsp?id=" + $('#modal-id').val() + "&situacao=" + $('#modal-situacao').val(),
			
			beforeSend: function(){
				$('#modal-loader').empty();
				$('#modal-loader').removeClass('bg-info text-center text-white');
				$('#modal-loader-img').html("<img src='resources/img/loading.gif' width='10%'/>");
			},
			
			timeout: 10000,
			
			success: function(resultado){
				if(resultado == true){
					alert("Veículo removido com sucesso.");
					$('#form-modal input').val("");
					$('#form-modal textarea').val("");
					listarVeiculos();
				} else {
					alert("Você não pode remover um veículo que esteja INDISPONÍVEL.");
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
	
	$('#modalSelecionaVeiculo').modal('hide');
});

$(".btn-seleciona").click(function(){
	carregaModal($(this).attr('rel'));
});

function carregaModal(id){
	//console.log(id);
	
	$.ajax({
		datatype: "JSON",
		method: "GET",
		url: "operacoes/veiculos/getVeiculoID.jsp?id=" + id,
		
		success: function(veiculo) {
			$('#modal-id').val(veiculo.veiID);
			$('#modal-placa').val(veiculo.veiPlaca);
			$('#modal-marca').val(veiculo.veiMarca);
			$('#modal-modelo').val(veiculo.veiModelo);
			$('#modal-cor').val(veiculo.veiCor);
			$('#modal-categoria').val(veiculo.veiCategoria);
			$('#modal-ano').val(veiculo.veiAno);
			$('#modal-valor').val(veiculo.veiValorLocacao).mask("#.###.##0,00", {reverse: true});
			$('input[name="modal-combustivel"]').filter('#' + veiculo.veiCombustivel).attr('checked', true),
			$('#modal-situacao').val(veiculo.veiSituacao).attr('selected', true);
			$('#modal-observacao').val(veiculo.veiObservacao);
			$('#modal-km').val(veiculo.veiKM);
		},
		
		error: function(){
			console.log("Ocorreu um erro ao processar a solicitação.");
		},
		
		complete: function(){
			$('#modalSelecionaVeiculo').modal('show');
		}
		
	});
}

function validaCamposModal(){
	var qtdErros= 0;
	
	if(!validaAno($('#modal-ano').val())){
		criaMsgErro("Por favor, digite um ano entre 1930 e o ano atual.");
		qtdErros++;
	}
	
	if(!validaTamanhoCampos($('#modal-marca').val())){
		criaMsgErro("Campo 'Marca' não pode estar vazio!");
		qtdErros++;
	}
	
	if(!validaTamanhoCampos($('#modal-modelo').val())){
		criaMsgErro("Campo 'Modelo' não pode estar vazio!");
		qtdErros++;
	}
	
	if(!validaTamanhoCampos($('#modal-valor').val())){
		criaMsgErro("Por favor, digite o valor de locação para este veículo.");
		qtdErros++;
	}
	
	if(qtdErros > 0) {
		return false;
	}
	
	return true;
}
