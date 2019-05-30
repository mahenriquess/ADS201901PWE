$('#btn_login').click(function(){
	$.ajax({
		method:"POST",
		datatype:"HTML",
		data: {
			usuario: $('#formLoginUsuario').val(),
			senha: $('#formLoginSenha').val()
		},
		url: "operacoes/checkLogin.jsp",
		
		beforeSend: function(){
			$('#loader').removeClass("bg-danger text-white");
			//$('#loader').addClass("bg-info text-white");
			$('#loader').html("<img src='resources/img/loading.gif' width='10%'/>");
		},
		
		timeout: 10000,
		
		success: function(resultado) {
			//alert(resultado);
			//alert(resultado > 0);
			if(parseInt(resultado) > 0){
				window.location.href = "dashboard.jsp";
			} else{
				$('#loader').removeClass("bg-info text-white");
				$('#loader').addClass("bg-danger text-white");
				$('#loader').html("Usuário e/ou senha incorretos.");
			}
		},
		
		error: function(){
			console.log("Erro ao processar solicitação.");
		}
	});
});