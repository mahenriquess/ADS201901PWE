<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dao.FuncionarioDAO"%>
<%@page import="entidades.Funcionario"%>
<%
	String id = request.getParameter("id");
	String nome = request.getParameter("nome");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String status = request.getParameter("status");
	String ativo = request.getParameter("ativo");

	boolean resultado = false;
	
	Funcionario func = new Funcionario(id, nome, username, password, email, status, ativo);
	FuncionarioDAO funcDAO = new FuncionarioDAO();

	resultado = funcDAO.atualizarFuncionario(func.toArray());	
	
	String json = new Gson().toJson(resultado);
	response.setContentType("application/json");
	response.setCharacterEncoding("UTF-8");
	out.println(json);
	
%>