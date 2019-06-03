<%@page import="dao.VeiculoDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entidades.Locacao"%>
<%@page import="dao.LocacaoDAO"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.SQLException"%>
<%
	/*
			id: $('#modal-locacao-id').val(),
			cliente: $('#modal-locacao-cliente').val(),
			veiculo: $('#modal-locacao-veiculo').val(),
			datahora: $('#modal-locacao-datahora').val(),
			dias: $('#modal-locacao-dias').val(),
			valor: $('#modal-locacao-valor').val(),
			devolucao: $('#modal-locacao-devolucao').val(),
			status: $('#modal-locacao-status').val()
	*/
	String id = request.getParameter("id");
	String cliente = request.getParameter("cliente");
	String veiculo = request.getParameter("veiculo");
	String datahora = request.getParameter("datahora");
	String dias = request.getParameter("dias");
	String valor = request.getParameter("valor");
	String devolucao = request.getParameter("devolucao");
	String status = request.getParameter("status");
	
    
	Locacao locacao = new Locacao(id, cliente, veiculo, datahora, dias, valor, devolucao, status);
	LocacaoDAO locDAO = new LocacaoDAO();
	
	boolean resultado = locDAO.atualizarLocacao(locacao.toArray());
	
	if(status.equals("Finalizada")){
		VeiculoDAO veiDao = new VeiculoDAO();
		boolean atualizaVeiculoStatus = veiDao.atualizarVeiculoStatus("Disponível", "veiSituacao", veiculo);
	}
	
	
	String json = new Gson().toJson(resultado);
	response.setContentType("application/json");
	response.setCharacterEncoding("UTF-8");
	out.println(json);
	
%>