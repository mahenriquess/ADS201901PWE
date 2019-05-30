<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dao.VeiculoDAO"%>
<%@page import="entidades.Veiculo"%>
<%
	
	String placa = request.getParameter("placa");
	String marca = request.getParameter("marca");
	String modelo = request.getParameter("modelo");
	String cor = request.getParameter("cor");
	String categoria = request.getParameter("categoria");
	String ano = request.getParameter("ano");
	String valor = request.getParameter("valor");
	String combustivel = request.getParameter("combustivel");
	String observacao = request.getParameter("observacao");
	
	
	Veiculo vei = new Veiculo("", placa, marca, modelo, cor, categoria, ano, valor, combustivel, "Disponível", observacao);
	VeiculoDAO veiDAO = new VeiculoDAO();
	
	boolean resultado = veiDAO.inserirVeiculo(vei.toArray());
	
	String json = new Gson().toJson(resultado);
	response.setContentType("application/json");
	response.setCharacterEncoding("UTF-8");
	out.println(json);
	
%>