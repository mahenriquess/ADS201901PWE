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
			$('#modal-locacao-devolucao').val(locacao.locacaoDevolucao);
			$('#modal-locacao-status').val(locacao.locacaoStatus);
			$('#modal-reg-devolucao').modal('show');
		},
		
		error: function() {
			$('#loader-locacao').empty();
			$('#loader-locacao').addClass('bg-info text-center text-white');
			$('#loader-locacao').html("Temporariamente indisponível. Tente novamente mais tarde.");
		}
	});
}