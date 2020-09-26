<%@ page language="java" import="java.sql.*"  %>


<%


if (session.getAttribute("usuario")==null){

	out.print("Você deve fazer o Login<br>");
	out.print("<a href='conteudo.html'>Página de Login</a>");
}else{

%>
<html>
	<head>
		<title> </title>

			<script> 
			
			function onclicksair()
			{
			Login.submit();
			return true;
			
			}</script>
	</head>

	<body>
	<table align="right">
	<tr><td>
	<form  name="Login" method="post" action="login_sair.jsp">

	Login: <% out.print(session.getAttribute("usuario")); %>
	<input type="button" value="sair" onclick="onclicksair()" > <b>
	</form>
	</td></tr>
	</table><br>

	<font>
	<br>
	<p align="center">
	<div align="center"><a href="pedidos.jsp" ><img src="Novopedido.png"></div></a><b>

	</font>

	</p>

	</a>

	<br>

	<font>

	<p align="center">
	<div align="center"><a href="Alterar_dados.jsp"><img src="alterar.png"></div></a><b>

	</font>

	</p>

	</a>

	<br>

	<font>

	<p align="center">
	<div align="center"><a href="consulta_pedidos.jsp" ><img src="pedidoos.png"></div></a><b>

	</font>

	</p>

	</a>

	<br>


	</body>
</html>
<%
}

%>