<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dao.ClienteDAO"%>
<%@page import="entidades.Cliente"%>
<%
	String id = request.getParameter("id");
	String nome = request.getParameter("nome");
	String cpf = request.getParameter("cpf");
	String rg = request.getParameter("rg");
	String email = request.getParameter("email");
	String telefone = request.getParameter("telefone");
	String sexo = request.getParameter("sexo");
	String ativo = request.getParameter("ativo");

	
	boolean resultado = false;
	
	Cliente cli = new Cliente(id, nome, cpf, rg, email, telefone, sexo, ativo);
	ClienteDAO cliDAO = new ClienteDAO();

	resultado = cliDAO.atualizarCliente(cli.toArray());	
	
	String json = new Gson().toJson(resultado);
	response.setContentType("application/json");
	response.setCharacterEncoding("UTF-8");
	out.println(json);
	
%>