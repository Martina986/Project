<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>pgsArchivioDocenteElimina</title>
</head>
<body>
	<jsp:useBean id="beanDocente" scope="session"
		class="model.session.Docente">
		<jsp:setProperty name="beanDocente" property="*" />
	</jsp:useBean>


	<FORM method="post" action="/WebProjectMavenized/CtrlArchivioDocente">
		<TABLE>
			<tr>
				<td>Vuoi eliminare il Docente?</td>

				<td><INPUT type="submit" name="cmdAzione" value="Conferma">
				</td>
				
				<td><INPUT type="submit" name="cmdAzione" value="Annulla">
				</td>
			</tr>
		</TABLE>
	</FORM>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>