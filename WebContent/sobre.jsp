<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="config/includes.html" %>
<meta charset="UTF-8">
<title>Sobre | MarThiRent</title>
</head>
<body>
	<%@include file="config/menu.jsp" %>
	<%
		try {
			if(sessao == null){
				response.sendRedirect("login.jsp");
			}
		} catch(NullPointerException e) {
			response.sendRedirect("login.jsp");
		}
	%>
	
	<div class="container pagina text-center">
		<h1 class="h1"><i class="fas fa-info-circle"></i> SOBRE</h1>
		<br />
		<h2 class="h2">PROJETO DE PWE</h2>
		
		<p class="bg-info text-white">por <strong>Thiago Santos Menezes (GU3000265)</strong> e 
		<strong>Marcelo Henrique da Silva (GU3000249)</strong></p>
		
		<p>Este é o projeto final da disciplina de Projeto Web, do Módulo IV do curso de Análise
		e Desenvolvimento de Sistemas do IFSP - Campus Guarulhos. Foram utilizados conhecimentos
		gerais de outras disciplinas e também conhecimentos específicos ensinados durante as 
		aulas de PWE.</p>
		
		<p>O objetivo proposto é de criar um sistema fictício de locadora de veículos que pudesse 
		ter gerenciamento de acesso e de operações de várias entidades, tais como: funcionários,
		veículos, locações e devoluções.</p>
		
		<p>Abaixo, alguns recursos e tecnologias utilizadas neste projeto:</p>
		
		<dl>
			<dt>HTML, CSS e JS</dt>
			<dd>Front-End com implementação do Framework Bootstrap 4 e do pacote de ícones
			Font-Awesome 5, além da biblioteca JQuery 3 e de uma de suas biblilotecas adaptadas
			conhecida como JQuery Mask.</dd>
			
			<dt>AJAX</dt>
			<dd>Técnica para requsições HTTP através da implementação de métodos e eventos associados
			na linguagem JavaScript com framework JQuery.</dd>
			
			<dt>Banco de Dados com SGBD MySQL</dt>
			<dd>Utilização do Banco de Dados MySQL para armazenamento e recuperação dos dados utilizados
			no sistema.</dd>
			
			<dt>Controle de Sessão</dt>
			<dd>Controle de acesso através dos recursos de sessão da linguagem Java EE que permitem
			navegação restrita às páginas reservadas.</dd>
			
			<dt>Rotina de Testes</dt>
			<dd>Criação de classes responsáveis por testar o motor do sistema e suas funcionalidades
			internas para garantir a correta implementação.</dd>
		</dl>
	</div>
</body>
</html>