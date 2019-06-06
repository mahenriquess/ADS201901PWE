<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dao.VeiculoDAO"%>
<%@page import="entidades.Veiculo"%>
<%
	String id = request.getParameter("id");
	String placa = request.getParameter("placa");
	String marca = request.getParameter("marca");
	String modelo = request.getParameter("modelo");
	String cor = request.getParameter("cor");
	String categoria = request.getParameter("categoria");
	String ano = request.getParameter("ano");
	String valor = request.getParameter("valor");
	String combustivel = request.getParameter("combustivel");
	String situacao = request.getParameter("situacao");
	String observacao = request.getParameter("observacao");
	String km = request.getParameter("km");
	
	boolean resultado = false;
	
	Veiculo vei = new Veiculo(id, placa, marca, modelo, cor, categoria, ano, valor, combustivel, situacao, observacao, km);
	VeiculoDAO veiDAO = new VeiculoDAO();
	
	if(situacao.equals("Disponível"))
		resultado = veiDAO.atualizarVeiculo(vei.toArray());	
	
	String json = new Gson().toJson(resultado);
	response.setContentType("application/json");
	response.setCharacterEncoding("UTF-8");
	out.println(json);
	
%>