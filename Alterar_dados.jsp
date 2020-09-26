<%@ page language="java" import="java.sql.*"  %>


<%


if (session.getAttribute("usuario")==null){

	out.print("Você deve fazer o Login<br>");
	out.print("<a href='conteudo.html'>Página de Login</a>");
}else{

String driver  = "net.sourceforge.jtds.jdbc.Driver" ;
String url     = "jdbc:jtds:sqlserver://10.4.0.90:1433/bd233102015" ;
String usuario = "bd233102015"   ;
String senha   = "123456" ;

Class.forName( driver ) ;

Connection conexao = DriverManager.getConnection(url,usuario,senha) ;

String sql = "select * from cadastro where cadUsuario = '" + session.getAttribute("usuario") + "' " ;

Statement stm = conexao.createStatement() ;

ResultSet rs = stm.executeQuery( sql ) ;

if(!rs.next()) {
  out.print("Erro no login- logar novamente") ;
}else{


%>

<html>
	<head>
		<title>Altere o seu cadastro!</title>
		
			<script type="text/javascript">
				function verificar()
				{
				   
				   var nome, usuario, senha, telefone, celular, email, rg, cpf, rua, numero, bairro;

				   nome = alterar.txtname.value;

				   if ( nome.length < 1)  
				   {
					  alert("Preencha o campo nome corretamente!");
					  alterar.txtname.style.background="yellow";
					  alterar.txtname.focus();
					  return false;
				   }else{
						alterar.txtname.style.background="white";
						}
				   	
				   senha = alterar.txtsenha.value;
				   
				   if (senha.length < 1)
				   {
					  alert("Preencha a senha corretamente!");
					  alterar.txtsenha.style.background="yellow";
					  alterar.txtsenha.focus();
					  return false;
				   }else{
						alterar.txtsenha.style.background="white"
						}

				   telefone = alterar.txttelefone.value;
				   
				   if (telefone.length < 1)
				   {
					  alert("Preencha o campo telefone corretamente!");
					  alterar.txttelefone.style.background="yellow";
					  alterar.txttelefone.focus();
					  return false;
				   }else{
						alterar.txttelefone.style.background="white"
						}

				   celular = alterar.txtcelular.value;
				   
				   if (celular.length < 1)
				   {
					  alert("Preencha o campo celular corretamente!");
					  alterar.txtcelular.style.background="yellow";
					  alterar.txtcelular.focus();
					  return false;
				   }else{
						alterar.txtcelular.style.background="white"
						}
					
				   email = alterar.txtemail.value;
				   
				   if  (email.indexOf("@")< 1 )
				   {
					  alert("Preencha o campo E-mail corretamente!");
					  alterar.txtemail.style.background="yellow";
					  alterar.txtemail.focus();
					  return false;
				   }else{
						alterar.txtemail.style.background="white"
						}

				   rg = alterar.txtrg.value;
				   
				   if (rg.length < 1 ) 
				   {
					  alert("Preencha o campo RG corretamente!");
					  alterar.txtrg.style.background="yellow";
					  alterar.txtrg.focus();
					  return false;
				   }else{
						alterar.txtrg.style.background="white"
						}

				   cpf = alterar.txtcpf.value;
				   
				   if (cpf.length < 1)
				   {
					  alert("Preencha o campo CPF corretamente!");
					  alterar.txtcpf.style.background="yellow";
					  alterar.txtcpf.focus();
					  return false;
				   }else{
						alterar.txtcpf.style.background="white"
						}

					
				   rua = alterar.txtrua.value;
				   
				   if (rua.length < 1)
				   {
					  alert("Preencha o campo Rua corretamente!");
					  alterar.txtrua.style.background="yellow";
					  alterar.txtrua.focus();
					  return false;
				   }else{
						alterar.txtrua.style.background="white"
						}

				   numero = alterar.txtnumero.value;
				   
				   if (isNaN(numero) || numero.length < 2)
				   {
					  alert("Preencha o campo Número corretamente!");
					  alterar.txtnumero.style.background="yellow";
					  alterar.txtnumero.focus();
					  return false;
				   }else{
						alterar.txtnumero.style.background="white"
						}

				   bairro = alterar.txtbairro.value;
				   
				   if (bairro.length < 1)
				   {
					  alert("Preencha o campo Bairro corretamente!");
					  alterar.txtbairro.style.background="yellow";
					  alterar.txtbairro.focus();
					  return false;
				   }else{
						alterar.txtbairro.style.background="white"
						}
					
				   
				   alterar.submit(); 
				   return true;

				}
			</script>
	</head>

	<body>

	<form name="alterar" action="alterar_cadastro.jsp" method="post">

	<table>

		<tr><td>Nome:</td>
		<td><input type="text" name="txtname" size="30" value="<% out.print(rs.getString("cadNome"));%>"></td></tr> 

		<tr><td>Usuário:</td>
		<td><% out.print(rs.getString("cadUsuario")); %>
</td></tr> 

		<tr><td>Senha:</td>
		<td><input type="txt" name="txtsenha" size="30" value="<% out.print(rs.getString("cadSenha"));%>"></td></tr> 

		<tr><td>Telefone:</td>
		<td><input type="text" name="txttelefone" size="30" value="<% out.print(rs.getString("cadtelefone"));%>" ></td></tr> 

		<tr><td>Celular:</td>
		<td><input type="text" name="txtcelular" size="30" value="<% out.print(rs.getString("cadCelular"));%>" ></td></tr> 

		<tr><td>E-mail:</td>
		<td><input type="text" name="txtemail" size="30" value="<% out.print(rs.getString("cadEmail"));%>" ></td></tr> 

		<tr><td>RG:</td>
		<td><input type="text" name="txtrg" size="30" value="<% out.print(rs.getString("cadRg"));%>"></td></tr> 

		<tr><td>CPF:</td>
		<td><input type="text" name="txtcpf" size="30" value="<% out.print(rs.getString("cadCpf"));%>"></td></tr> 
	

		<tr><td>Endereço:</td></tr>	

		<tr><td>Rua:</td>
		<td><input type="text" name="txtrua" size="30" value="<% out.print(rs.getString("cadEndRua"));%>"></td></tr>
		<tr><td>Número:</td>
		<td><input type="text" name="txtnumero" size="10" value="<% out.print(rs.getString("cadEndNumero"));%>"></td></tr>
		<tr><td>Bairro:</td>
		<td><input type="text" name="txtbairro" size="20" value="<% out.print(rs.getString("cadEndBairro"));%>"></td></tr>

		<tr><td><input type="button" value="Alterar" onClick="verificar()"></td>

		<tr><td><input type="button" value="voltar" onClick="location.href='meu_perfil.jsp'" ></tr></td>

	</table>

	</form>
		
	</body>
</html>
<%
}
}
%>

