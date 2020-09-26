<%@ page language="java" import="java.sql.*"  %>

<%

String vlogin = request.getParameter("txtlogin");
String vsenha = request.getParameter("txtsenha");

String driver  = "net.sourceforge.jtds.jdbc.Driver" ;
String url     ="jdbc:jtds:sqlserver://10.4.0.90:1433/bd233102015" ;
String usuario = "bd233102015"   ;
String senha   = "123456" ;


Class.forName( driver ) ;

Connection conexao = DriverManager.getConnection(url,usuario,senha) ;

Statement stm = conexao.createStatement() ;

String sql = "select * from cadastro where cadUsuario ='"+ vlogin  +"' and cadSenha='"+ vsenha +"'";

ResultSet rs = stm.executeQuery(sql); 

if(!rs.next()){
		out.println("<script> alert('login invalido'); location.href='conteudo.html'; </script>");
	}else{
		session.setAttribute("usuario", rs.getString("cadUsuario"));
		response.sendRedirect("meu_perfil.jsp");
	}


rs.close();
stm.close();
conexao.close();
%>

