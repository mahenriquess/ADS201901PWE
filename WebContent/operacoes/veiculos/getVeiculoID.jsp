<%@page import="entidades.Veiculo"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.VeiculoDAO"%>
<%
	String id = request.getParameter("id");
	
	VeiculoDAO veiDAO = new VeiculoDAO();
	ResultSet rs = veiDAO.selecionarVeiculo("veiID = '" + id + "'");
	
	while(rs.next()){
		
		Veiculo vei = new Veiculo(rs.getString("veiID"),
								  rs.getString("veiPlaca"),
								  rs.getString("veiMarca"),
								  rs.getString("veiModelo"),
								  rs.getString("veiCor"),
								  rs.getString("veiCategoria"),
								  rs.getString("veiAno"),
								  rs.getString("veiValorLocacao"),
								  rs.getString("veiCombustivel"),
								  rs.getString("veiSituacao"),
								  rs.getString("veiObservacao"),
								  rs.getString("veiKM"));
		
		String json = new Gson().toJson(vei);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		out.println(json);
	}
	
%>