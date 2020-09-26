<%@ page language="java" import="java.sql.*" %>

<%

String driver  = "net.sourceforge.jtds.jdbc.Driver" ;
String url     = "jdbc:jtds:sqlserver://10.4.0.90:1433/bdRA" ;
String usuario = "bdRA"   ;
String senha   = "123456" ;

Class.forName( driver ) ;

Connection conexao = DriverManager.getConnection(url,usuario,senha) ;

String sql = "select * from cadastro_n1" ;

Statement stm = conexao.createStatement() ;

ResultSet rs = stm.executeQuery( sql ) ;

out.print("<table border=1>");
out.print("<tr><td>Código</td><td>Nome</td><td>Idade</td><td>e-mail</td></tr>");


while  ( rs.next() ) {

  out.print("<tr>");

  out.print("<td>");
    out.print( rs.getString("codigo") ) ;
  out.print("</td>");

  out.print("<td>");
    out.print( rs.getString("nome") ) ;
  out.print("</td>");

  out.print("<td>");
    out.print( rs.getString("idade") ) ;
  out.print("</td>");

  out.print("<td>");
    out.print( rs.getString("email") ) ;
  out.print("</td>");

  out.print("</tr>");

}

out.print("</table>");


%>





