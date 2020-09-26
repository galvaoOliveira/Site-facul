<%@ page language="java" import="java.sql.*" %>

<%
int vcodigo = Integer.parseInt(request.getParameter("vcodigo"));
//out.print(request.getParameter("vcodigo"));

if(session.getAttribute("usuario")== null){

	out.print("Você deve fazer o Login<br>");
	out.print("<a href='conteudo.html'> Página de Login</a>");

}else{

String driver  = "net.sourceforge.jtds.jdbc.Driver" ;
String url     = "jdbc:jtds:sqlserver://10.4.0.90:1433/bd233102015" ;
String usuario = "bd233102015"   ;
String senha   = "123456" ;

Class.forName( driver);

Connection conexao = DriverManager.getConnection(url,usuario,senha) ;

//String sql = "select * from pedido where pedCodigo= '"+ vcodigo +"'";

String sql = "select cadUsuario,pedNomeresp ,pedNomeemp , a.locNome as CidRetirada, pedRuaretirada, pedBarretirada, pedNumretirada, ";
       sql = sql + "b.locNome as CidEntrega, pedRuaentrega, pedNumentrega, pedBarentrega,pedTipo, pedFragil, pedTelcontato,pedCelular, pedHora, pedMinuto, pedStatus,valor= ( select MAX(valor) from Locais where locCodigo = pedCidretirada or locCodigo= pedcidentrega)  " ;  
        sql = sql + "from pedido " ;
		
sql = sql + "inner join locais as a on a.locCodigo=Pedido.pedCidretirada  " ;
sql = sql + "inner join locais as b on b.locCodigo=Pedido.pedCidentrega " ;    
sql = sql + "where pedCodigo = '"+ vcodigo +"'";

Statement stm = conexao.createStatement();


ResultSet rs = stm.executeQuery( sql ) ;

if(!rs.next()){
	out.print("erro");
}else{

%>


<html>
	<head>
		<title>Faça seu pedido!</title>
	</head>

	<body>

	<table border=1 align="center" cellspacing="5" cellpadding="5">

	<tr><td> <% out.print(session.getAttribute("usuario"));%></td><td><% out.print(vcodigo);%></td></tr>

	<tr><td>Status do Pedido</td><td><% out.print(rs.getString("pedStatus")); %></td></tr>

	<tr><td>Valor do pedido</td><td><% out.print(rs.getString("valor")); %></td></tr>

	<form name="pedidos" method="" >

	<table border=1 align="center" cellspacing="5" cellpadding="5">

		<tr><td>Nome do responsável:</td>
		<td><% out.print(rs.getString("pedNomeresp")); %></td></tr> 

		<tr><td>Nome da empresa:</td>
		<td><% out.print(rs.getString("pedNomeemp")); %></td></tr> 

		<tr><td>Cidade de retirada:</td>




		<td><% out.print(rs.getString("Cidretirada")); %></td></tr>
			

		<tr><td>Cidade de entrega:</td>
		<td><% out.print(rs.getString("Cidentrega")); %></td></tr>


		<tr><td>Endereço de retirada:</td>
		<td>Rua: <% out.print(rs.getString("pedRuaretirada")); %> </td>
		<tr><td>Número: </td><td><% out.print(rs.getString("pedNumretirada")); %></tr></td>
		</tr><td>Bairro:</td><td> <% out.print(rs.getString("pedBarretirada")); %></td></tr>

		<tr><td>Endereço de entrega:</td>
		<td>Rua:<% out.print(rs.getString("pedRuaentrega")); %></td></tr>
		<tr><td>Número:</td><td><% out.print(rs.getString("pedNumentrega")); %> </td></tr>
		<tr><td>Bairro:</td><td><% out.print(rs.getString("pedBarentrega")); %> </td></tr> 

		<tr><td>Tipo de entrega:</td>
		<td><% out.print(rs.getString("pedTipo")); %></td></tr>

		<tr><td>Frágil:</td>
		<td><% out.print(rs.getString("pedFragil"));%></td></tr>
		
		<br>

		<tr><td>Peso: </td>
		<td>Máximo 20kg</td></tr> <br>

		<tr><td>Tamanho:</td>
		<td>Máximo 1 metro³</td></tr> <br>

		<tr><td>Telefone de contato:</td>
		<td><% out.print(rs.getString("pedTelcontato")); %><br>

		<tr><td>Celular:</td>
		<td><% out.print(rs.getString("pedCelular")); %> </td></tr> <br>

		<tr><td>Hora de retirada:</td>
		<td><%out.print( rs.getString("pedHora") + ":" + rs.getString("pedMinuto"));%></td></tr>

		</select>



	</table>

	</form>

	</body>
</html>

<%
}
}
%>
