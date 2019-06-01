<%@page import="entidades.Cliente"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.ClienteDAO"%>
<%
	String id = request.getParameter("id");
	
	ClienteDAO cliDAO = new ClienteDAO();
	ResultSet rs = cliDAO.selecionarClientes("cliID = '" + id + "'");
	
	while(rs.next()){
		
		Cliente cli = new Cliente(rs.getString("cliID"),
								  rs.getString("cliNome"),
								  rs.getString("cliCPF"),
								  rs.getString("cliRG"),
								  rs.getString("cliEmail"),
								  rs.getString("cliTelefone"),
								  rs.getString("cliSexo"),
								  rs.getString("cliAtivo")
								  );
		
		String json = new Gson().toJson(cli);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		out.println(json);
	}
	
%>