<%@ page language="java" import="java.sql.*" %>

<%

String vuser = request.getParameter("txtusuario");
String vname  = request.getParameter("txtname");
String vsenha = request.getParameter("txtsenha");
String vtelefone = request.getParameter("txttelefone");
String vcelular = request.getParameter("txtcelular");
String vemail = request.getParameter("txtemail") ;
String vrg = request.getParameter("txtrg");
String vcpf = request.getParameter("txtcpf");
String vrua = request.getParameter("txtrua");
int vnumero = Integer.parseInt(request.getParameter("txtnumero"));
String vbairro = request.getParameter("txtbairro");



String driver  = "net.sourceforge.jtds.jdbc.Driver" ;
String url     = "jdbc:jtds:sqlserver://10.4.0.90:1433/bd233102015" ;
String usuario = "bd233102015"   ;
String senha   = "123456" ;


Class.forName( driver ) ;

Connection conexao = DriverManager.getConnection(url,usuario,senha) ;

String sql = "update cadastro set cadNome = '" + vname +"',cadSenha ='"+vsenha+"',cadTelefone='" + vtelefone + "' ,cadCelular='" + vcelular + "',cadEmail='" + vemail + "',cadRg='" +  vrg + "', cadCpf='" + vcpf + "' ,cadEndRua='" + vrua + "',cadEndNumero="+ vnumero +",cadEndBairro='" + vbairro + "' where cadUsuario='"+ session.getAttribute("usuario") +"'" ;

try{
Statement stm = conexao.createStatement() ;
stm.executeUpdate( sql ) ;
out.print("<script> alert('dados gravados'); location.href='Alterar_dados.jsp'; </script>");
} catch(SQLException erro) {
out.print("<script> alert('Email já utilizado'); location.href='Alterar_dados.jsp'; </script>");
}
%>



