<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dao.VeiculoDAO"%>
<%@page import="entidades.Veiculo"%>
<%
	String id = request.getParameter("id");
	String situacao = request.getParameter("situacao");
	boolean resultado = false;
	
	Veiculo vei = new Veiculo(id, "", "", "", "", "", "", "", "", situacao, "");
	VeiculoDAO veiDAO = new VeiculoDAO();
	
	if(situacao.equals("Disponível")){
		resultado = veiDAO.removerVeiculo(vei.getVeiID());
	}
	
	String json = new Gson().toJson(resultado);
	response.setContentType("application/json");
	response.setCharacterEncoding("UTF-8");
	out.println(json);
	
%>