<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>pgsGestioneCorsoElimina</title>
</head>
<body>
	<jsp:useBean id="beanCorso" scope="session"
		class="model.session.Corso">
		<jsp:setProperty name="beanCorso" property="*" />
	</jsp:useBean>


	<FORM method="post" action="/WebProjectMavenized/CtrlGestioneCorso">
		<TABLE>
			<tr>
				<td>Vuoi eliminare il Corso?</td>

				<td><INPUT type="submit" name="cmdAzione" value="Conferma">
				</td>

				<td><INPUT type="submit" name="cmdAzione" value="Annulla">
				</td>
			</tr>
		</TABLE>
	</FORM>
</body>
</html>