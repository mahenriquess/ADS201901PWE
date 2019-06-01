<%@page import="entidades.Funcionario"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.FuncionarioDAO"%>
<%
	String id = request.getParameter("id");
	
	FuncionarioDAO funcDAO = new FuncionarioDAO();
	ResultSet rs = funcDAO.selecionarFuncionarios("funcID = '" + id + "'");
	
	while(rs.next()){
		
		Funcionario func = new Funcionario(rs.getString("funcID"),
										  rs.getString("funcNome"),
										  rs.getString("funcUsername"),
										  rs.getString("funcPassword"),
										  rs.getString("funcEmail"),
										  rs.getString("funcStatus"),
										  rs.getString("funcAtivo")
										  );
		
		String json = new Gson().toJson(func);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		out.println(json);
	}
	
%>