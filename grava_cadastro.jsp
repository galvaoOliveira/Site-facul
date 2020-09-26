<%@ page language="java" import="java.sql.*" %>

<%

String vusuario = request.getParameter("txtusuario");
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

String sql = "insert into cadastro (cadUsuario,cadNome,cadSenha,cadTelefone,cadCelular,cadEmail,cadRg, cadCpf,cadEndRua,cadEndNumero,cadEndBairro) values ('" +vusuario + "','" + vname + "','" + vsenha + "','" + vtelefone + "','" + vcelular + "','" + vemail + "','" +  vrg + "','" + vcpf + "','" + vrua + "'," + vnumero + ",'" + vbairro + "')" ;

try{


Statement stm = conexao.createStatement() ;
stm.executeUpdate( sql ) ;
out.print("<script> alert('Dados Gravados com sucesso!!!');location.href='conteudo.html'; </script>") ;


} catch(SQLException erro) {

out.print("<script> alert('Login ou Email já exista sendo usado!!'); location.href='cadastro.html';</script>") ;

}
%>



