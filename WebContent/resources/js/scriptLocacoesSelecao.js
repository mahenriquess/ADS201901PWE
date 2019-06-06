$('.btn-seleciona').click(function(){
	carregaDadosModalLocacao($(this).attr('rel'));
});

//BUSCA REGISTROS DE LOCAÇÃO SELECIONADA
function carregaDadosModalLocacao(id){
	$.ajax({
		datatype: "JSON",
		method: "GET",
		url: "operacoes/locacoes/getLocacaoID.jsp?id=" + id,
		
		success: function(locacao){
			$('#modal-locacao-id').val(locacao.locacaoID);
			$('#modal-locacao-cliente').val(locacao.locacaoCli);
			$('#modal-locacao-veiculo').val(locacao.locacaoVeiculo);
			$('#modal-locacao-datahora').val(locacao.locacaoDataHora);
			$('#modal-locacao-dias').val(locacao.locacaoDias);
			$('#modal-locacao-valor').val(locacao.locacaoValor);
			$('#modal-locacao-devolucao').val(locacao.locacaoDevolucao).attr('min', locacao.locacaoDataHora);
			$('#modal-locacao-status').val(locacao.locacaoStatus).attr('selected', true);
			
			if($('#modal-locacao-status').val() == "Finalizada"){
				$('#btn-devolve-veiculo').addClass("options-admin");
			} else {
				$('#btn-devolve-veiculo').removeClass("options-admin");	
			}
			
			$('#modal-reg-devolucao').modal('show');
		},
		
		error: function() {
			$('#loader-locacao').empty();
			$('#loader-locacao').addClass('bg-info text-center text-white');
			$('#loader-locacao').html("Temporariamente indisponível. Tente novamente mais tarde.");
		}
	});
}

$('#btn-devolve-veiculo').click(function(){
	var msg = "";
	
	if($('#modal-locacao-status').val() == "Finalizada"){
		msg = "Ao finalizar esta locação, o veículo será devolvido. ";
	}
	
	if(validaAtualizacao())
		if(confirm(msg + "Você deseja atualizar esta locação?"))
			atualizaLocacao();
});

function validaAtualizacao(){
	var locacaoCampo = ($('#modal-locacao-datahora').val()).split("-");
	var locacao = new Date(locacaoCampo[0], locacaoCampo[1]-1, locacaoCampo[2]);
	
	var devolucaoCampo = ($('#modal-locacao-devolucao').val()).split("-");
	var devolucao = new Date(devolucaoCampo[0], devolucaoCampo[1]-1, devolucaoCampo[2]);
	
	return(devolucao >= locacao);
}

//ATUALIZA DADOS DA LOCAÇÃO
function atualizaLocacao(){
	$.ajax({
		datatype: "JSON",
		method: "POST",
		data: {
			id: $('#modal-locacao-id').val(),
			cliente: $('#modal-locacao-cliente').val(),
			veiculo: $('#modal-locacao-veiculo').val(),
			datahora: $('#modal-locacao-datahora').val(),
			dias: $('#modal-locacao-dias').val(),
			valor: $('#modal-locacao-valor').val(),
			devolucao: $('#modal-locacao-devolucao').val(),
			status: $('#modal-locacao-status').val()
		},
		url: "operacoes/locacoes/attLocacao.jsp",
		
		success: function(resultado){
			if(resultado == true){
				alert("Locação atualizada com sucesso!");
			} else {
				alert("Erro ao atualizar a locação.");
			}
			document.location.reload();
			$('#modal-reg-devolucao').modal('hide');
		},
		
		error: function() {
			$('#loader-locacao').empty();
			$('#loader-locacao').addClass('bg-info text-center text-white');
			$('#loader-locacao').html("Temporariamente indisponível. Tente novamente mais tarde.");
		}
	});
}