<%@page import="java.sql.ResultSet"%>
<%@page import="dao.ClienteDAO"%>
<%@page import="dao.VeiculoDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entidades.Locacao"%>
<%@page import="dao.LocacaoDAO"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.SQLException"%>
<%
	
	String veiID = request.getParameter("veiID");
	String cliID = request.getParameter("cliID");
	String qtdDias = request.getParameter("qtdDias");
	String total = request.getParameter("total");
	
	boolean resultado = false;
	
	Date date = new Date();
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    
    Calendar cal = Calendar.getInstance(); 
    cal.setTime(date); 
    cal.add(Calendar.DATE, Integer.parseInt(qtdDias));
  
    String dataLocacao = dateFormat.format(date);
    String dataDevolucao = dateFormat.format(cal.getTime());
    
    
    ClienteDAO cliDAO = new ClienteDAO();
    ResultSet rsCli = cliDAO.selecionarClientes("cliID = '" + cliID + "' AND cliAtivo = 'S'");
    
    if(rsCli.next()){
    	Locacao locacao = new Locacao("", cliID, veiID, dataLocacao, qtdDias, total, dataDevolucao, "Pendente");
    	LocacaoDAO locDAO = new LocacaoDAO();
    	resultado = locDAO.inserirLocacao(locacao.toArray());
   
   		VeiculoDAO veiDao = new VeiculoDAO();
       	boolean atualizaVeiculoStatus = veiDao.atualizarVeiculoStatus("Indisponível", "veiSituacao", veiID);
    }
	
	String json = new Gson().toJson(resultado);
	response.setContentType("application/json");
	response.setCharacterEncoding("UTF-8");
	out.println(json);
	
%>