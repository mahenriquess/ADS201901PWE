<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
	String sessao = (String)session.getAttribute("idUser");
	if(sessao == null)
		response.sendRedirect("login.jsp");
	
	String status = (String)session.getAttribute("statusUser");
	String link = (status.equals("A") ? "" : "link-disabled");
	
	SimpleDateFormat dataFormatada = new SimpleDateFormat("dd/MM/yyyy - HH:mm:ss");
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light menuBarraCor">
	<a class="navbar-brand" href="dashboard.jsp">MarThiRent</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="dashboard.jsp"><i class="fas fa-columns"></i> Dashboard <span class="sr-only">(current)</span>
			</a></li>
			
			<li class="nav-item active <%=link %>"><a class="nav-link"
				href="veiculos.jsp"><i class="fas fa-car"></i> Veículos <span class="sr-only">(current)</span>
			</a></li>
			
			<li class="nav-item active <%=link %>"><a class="nav-link"
				href="clientes.jsp"><i class="fas fa-users"></i> Clientes <span class="sr-only">(current)</span>
			</a></li>
			
			<li class="nav-item active <%=link %>"><a class="nav-link"
				href="dashboard.jsp"><i class="fas fa-id-card"></i>  Funcionários <span class="sr-only">(current)</span>
			</a></li>
			
			<li class="nav-item active"><a class="nav-link"
				href="dashboard.jsp"><i class="fas fa-money-check-alt"></i>  Locações <span class="sr-only">(current)</span>
			</a></li>
				
			<li class="nav-item active"><a class="nav-link"
				href="sobre.jsp"><i class="fas fa-info-circle"></i> Sobre <span class="sr-only">(current)</span>
			</a></li>
		</ul>
		<div class="info">
			<p class="text-center">
				Usuário:
				<strong><%=(String) session.getAttribute("userUser")%></strong> <a
					class="btn btn-danger" role="button" href="operacoes/logout.jsp"><i
					class="fas fa-sign-out-alt"></i> Sair </a>
				<h6 class="h6 sessaoHorario">Você entrou em: <strong><%=dataFormatada.format(new Date(session.getCreationTime())) %></strong></h6>
			</p>
		</div>
	</div>
</nav>