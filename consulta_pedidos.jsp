<%@ page language="java" import="java.sql.*" %>

<%

if(session.getAttribute("usuario")==null){

	out.print("Você deve fazer o Login<br>");
	out.print("<a href='conteudo.html'>Página de Login</a>");
}else{

String driver  = "net.sourceforge.jtds.jdbc.Driver" ;
String url     = "jdbc:jtds:sqlserver://10.4.0.90:1433/bd233102015" ;
String usuario = "bd233102015"   ;
String senha   = "123456" ;

Class.forName( driver);

Connection conexao = DriverManager.getConnection(url,usuario,senha) ;

//String sql = "select * from pedido";



String sql = "select pedCodigo,pedNomeresp ,pedNomeemp ,pedCidretirada,pedRuaretirada, pedBarretirada, pedNumretirada ,pedCidentrega,pedRuaentrega, pedNumentrega, pedBarentrega,pedTipo, pedFragil, pedTelcontato,pedCelular, pedHora, pedMinuto from pedido where cadUsuario = '"+ session.getAttribute("usuario") +"'";
Statement stm = conexao.createStatement();


ResultSet rs = stm.executeQuery( sql ) ;


out.print("<table border=1 align='center'>");
out.print("<tr><td>Codigo Produto</td><td>Nome do responsavel</td><td>Nome da empresa</td><td>Tipo da entrega</td></tr>");


while  (rs.next()) {

  out.print("<tr>");

  out.print("<td align='center'>");
	String pedcodigo = rs.getString("pedCodigo");
	
    out.print("<a href='dados_pedidos.jsp?vcodigo="+ rs.getString("pedcodigo") + "'target='_blank'>"+pedcodigo+"</a>") ;
  out.print("</td>");

  out.print("<td>");
    out.print( rs.getString("pedNomeresp") ) ;
  out.print("</td>");

  out.print("<td>");
    out.print( rs.getString("pedNomeemp") ) ;
  out.print("</td>");

  out.print("<td>");
    out.print( rs.getString("pedTipo") ) ;
  out.print("</td>");

  out.print("</td>");

  out.print("</tr>");

}

out.print("</table>");


//out.print(rs);
}
%>
