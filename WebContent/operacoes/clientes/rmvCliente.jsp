<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dao.ClienteDAO"%>
<%@page import="entidades.Cliente"%>
<%
	String id = request.getParameter("id");
	boolean resultado = false;
	
	Cliente cli = new Cliente(id, "", "", "", "", "", "", "");
	ClienteDAO cliDAO = new ClienteDAO();
	

	resultado = cliDAO.removerCliente(cli.getCliID());

	String json = new Gson().toJson(resultado);
	response.setContentType("application/json");
	response.setCharacterEncoding("UTF-8");
	out.println(json);
	
%>