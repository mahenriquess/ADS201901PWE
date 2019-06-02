$('#btn-realizar-devolucao').click(function(){
	$('#modal-reg-devolucao').modal('show');
});

$('.btn-grid-veiculo').click(function(){
	carregaDadosModalLocacao($(this).attr('rel'));
});

$('#btn-reg-locacao').click(function(){
	if(validaFormLocacao()){
		var confirmar = confirm("Você está alugando " + $('#form-reg-locacao-modelo').val() + " por " + $('#form-reg-locacao-total').val() + ". Para prosseguir, confirme a operação.");
		
		if(confirmar){
			$.ajax({
				datatype: "JSON",
				method: "POST",
				url: "operacoes"
			});
		}
	}
});

$('#btn-cancela-locacao').click(function(){
	$('#form-reg-locacao-cli').val("").attr('selected', true);
});

$('#form-reg-locacao-dias').keyup(function(){
	calculaLocacao($(this).val());
});

function calculaLocacao(dias){
	if(dias < 1)
		$('#form-reg-locacao-dias').val("");
	if(dias > 60)
		$('#form-reg-locacao-dias').val("60");
	
	var total = parseFloat($('#form-reg-locacao-valor').val()) * $('#form-reg-locacao-dias').val();
	$('#form-reg-locacao-total').val(total.toFixed(2));
}

function carregaDadosModalLocacao(id){
	$.ajax({
		datatype: "JSON",
		method: "GET",
		url: "operacoes/veiculos/getVeiculoID.jsp?id=" + id,
		
		success: function(veiculo){
			$('#form-reg-locacao-id').val(veiculo.veiID);
			$('#form-reg-locacao-marca').val(veiculo.veiMarca);
			$('#form-reg-locacao-modelo').val(veiculo.veiModelo);
			$('#form-reg-locacao-ano').val(veiculo.veiAno);
			$('#form-reg-locacao-combustivel').val(veiculo.veiCombustivel);
			$('#form-reg-locacao-valor').val(veiculo.veiValorLocacao);
		}
	});
	
	$('#modal-reg-locacao').modal('show');
}

function validaFormLocacao(){
	var qtdErros = 0;
	if($('#form-reg-locacao-cli').val() == ""){
		addMsgLoader("loader-cli", "Por favor, selecione o cliente.");
		qtdErros++;
	} else {
		limpaLoader("loader-cli");
	}
	if($('#form-reg-locacao-dias').val() <= 0){
		addMsgLoader("loader-dias", "Por favor, selecione a quantidade de dias.");
		qtdErros++;
	} else {
		limpaLoader("loader-dias");
	}
	if($('#form-reg-locacao-total').val() <= 0){
		addMsgLoader("loader-total", "Valor total não pode ser menor ou igual a zero.");
		qtdErros++;
	} else {
		limpaLoader("loader-total");
	}
	if(qtdErros > 0) {
		return false;
	} else {
		return true;
	}
}

function addMsgLoader(loader, mensagem){
	$('#' + loader).addClass("bg-danger text-white");
	$('#' + loader).html(mensagem);
}

function limpaLoader(loader){
	$('#' + loader).empty();
	$('#' + loader).removeClass("bg-danger text-white");
}
