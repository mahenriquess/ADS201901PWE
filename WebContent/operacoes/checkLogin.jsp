<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.FuncionarioDAO"%>
<% 
	String usuario = request.getParameter("usuario");
	String senha = request.getParameter("senha");
	boolean logado = false;
	String id = null, status = null, nome = null, username = null, situacao = null;
	ResultSet rs = new FuncionarioDAO().login(usuario, senha);
	int registros = 0;
	
	try {
		
		while(rs.next()){
			registros++;
			id = rs.getString("funcID");
			status = rs.getString("funcStatus");
			nome = rs.getString("funcNome");
			username = rs.getString("funcUsername");
			situacao = rs.getString("funcAtivo");
		}
		
		if(registros > 0){
			
			//if(situacao.equals("S")){
			
			logado = true;
			session.setAttribute("idUser", id);
			session.setAttribute("statusUser", status);
			session.setAttribute("nomeUser", nome);
			session.setAttribute("userUser", username);
			session.setAttribute("situacaoUser", situacao);
			
			//}
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	out.println(id);
	
%>