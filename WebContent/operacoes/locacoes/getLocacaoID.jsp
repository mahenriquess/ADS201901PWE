<%@page import="entidades.Locacao"%>
<%@page import="dao.LocacaoDAO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.ResultSet"%>
<%
	String id = request.getParameter("id");
	
	LocacaoDAO locDAO = new LocacaoDAO();
	ResultSet rs = locDAO.selecionarLocacoes("locacaoID = '" + id + "'");
	
	while(rs.next()){
		
		Locacao loc = new Locacao(rs.getString("locacaoID"),
								  rs.getString("locacaoCli"),
								  rs.getString("locacaoVeiculo"),
								  rs.getString("locacaoDataHora"),
								  rs.getString("locacaoDias"),
								  rs.getString("locacaoValor"),
								  rs.getString("locacaoDevolucao"),
								  rs.getString("locacaoStatus"));
		
		String json = new Gson().toJson(loc);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		out.println(json);
	}
	
%>