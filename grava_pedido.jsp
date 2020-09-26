<%@ page language="java" import="java.sql.*" %>

<%

String 	vnomeresp 	= request.getParameter("txtnameresp");
String 	vnomeemp	= request.getParameter("txtnameemp");
int 	vcidadeent	= Integer.parseInt(request.getParameter("cidadeent"));
int	vcidaderet	= Integer.parseInt(request.getParameter("cidaderet"));
String 	vruaretirada	= request.getParameter("txtruaretirada");
String	vnumretirada	= request.getParameter("txtnumeroretirada");
String 	vbairetirada	= request.getParameter("txtbairroretirada");
String	vruaentrega	= request.getParameter("txtruaentrega");
String 	vnumentrega	= request.getParameter("txtnumeroentrega");
String	vbaientrega	= request.getParameter("txtbairroentrega");
String	vtipoentrega	= request.getParameter("tentrega");
String	vfragil		= request.getParameter("fragil");
String	vtelefone	= request.getParameter("txtcontato");
String	vcelular	= request.getParameter("txtcelular");
int	vhora		= Integer.parseInt(request.getParameter("Hora"));
int	vminutos	= Integer.parseInt(request.getParameter("Minutos"));

String driver  = "net.sourceforge.jtds.jdbc.Driver" ;
String url     = "jdbc:jtds:sqlserver://10.4.0.90:1433/bd233102015" ;
String usuario = "bd233102015"   ;
String senha   = "123456" ;


Class.forName( driver ) ;

Connection conexao = DriverManager.getConnection(url,usuario,senha) ;

String sql = "insert into pedido (CadUsuario,pedNomeresp,pedNomeemp,PedCidretirada,pedCidentrega,pedRuaretirada,pedNumretirada,pedBarretirada,pedRuaentrega,pedNumentrega,pedBarentrega,pedTipo,pedFragil,pedTelcontato,pedCelular,pedHora,pedMinuto,pedStatus) values ('"+ session.getAttribute("usuario") +"','" + vnomeresp + "','" + vnomeemp + "'," + vcidadeent + "," + vcidaderet + ",'" + vruaretirada + "', '" + vnumretirada + "','" + vbairetirada + "','" + vruaentrega + "', '" + vnumentrega + "','" + vbaientrega + "','" + vtipoentrega + "', '" + vfragil + "','" + vtelefone + "','" + vcelular + "', " + vhora + ", " + vminutos + ",'Pendente')" ;

Statement stm = conexao.createStatement() ;

stm.executeUpdate( sql ) ;


out.print("<script>alert('Dados Gravados com sucesso!!!');location.href='pedidos.jsp';</script>") ;


%>



