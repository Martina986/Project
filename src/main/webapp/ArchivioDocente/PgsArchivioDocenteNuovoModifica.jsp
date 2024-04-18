<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
%>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<TITLE>pgsArchivioDocenteNuovoModifica.jsp</TITLE>
</HEAD>
<BODY>

<jsp:useBean id="beanDocente" scope="session"
	class="model.session.Docente">
	<jsp:setProperty name="beanDocente" property="*" />
</jsp:useBean>

<div class="p-5 bg-dark text-white text-center">
  <h1>Nuovo Docente</h1>
  <FORM method="post" action="/WebProjectMavenized/CtrlArchivioDocente">
   <INPUT type="submit" name="cmdAzione" value="Torna alla Home" button type="button" class="btn btn-dark"></button>
  </form>
</div>

<div class="container mt-3">
<div class = "row justify-content-center">
<div class="col-md-3">
<FORM method="post" action="/WebProjectMavenized/CtrlArchivioDocente">
    <div class="mb-3 mt-3">

	<label for="surname">Cognome</label>
	<INPUT type="text" name="txtCognome" value="<%= beanDocente.getCognome()%>" size="20" maxlength="50" class="form-control">
	 </div>

	 <div class="mb-3 mt-3">
	 <label for="name">Nome</label>
	 <INPUT type="text" name="txtNome" value="<%= beanDocente.getNome()%>" size="20" maxlength="50" class="form-control">
	 </div>

<INPUT type="submit" name="cmdAzione" value="Registra" button type="button" class="btn btn-dark"></button>
<INPUT type="submit" name="cmdAzione" value="Annulla" button type="button" class="btn btn-dark"></button>

  </form>
  </div>
  </div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</BODY>
</HTML>
