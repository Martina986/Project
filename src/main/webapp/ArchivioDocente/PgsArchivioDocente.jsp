<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="model.session.Docente"%>
<HTML>
<HEAD>
<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
import="java.util.*"
%>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<TITLE>pgsArchivioDocente.jsp</TITLE>
</HEAD>
<BODY>

<FORM method="post" action="/WebProjectMavenized/CtrlArchivioDocente" name="ArchivioDocente">
<div class="p-5 bg-dark text-white text-center">
  <h1>Archivio Docenti</h1>
  <INPUT type="submit" name="cmdAzione" value="Torna alla Home" button type="button" class="btn btn-dark"></button>
</div>
<% 
	List pgsElenco= (List) request.getAttribute("elencoDocenti");
   int numeroRighe = pgsElenco.size();
   if(numeroRighe > 0){
   		int i = 1;
   		
%>

<div class="container mt-3">
    <div class = "row justify-content-center">
        <div class="col-md-3">
<table class="table table-dark table-hover">
<thead>
      <tr>
        <th></th>
        <th>Cognome </th>
        <th>Nome</th>
      </tr>
    </thead>
<TBODY>
	<TR>
	<TD>
	<input type="radio" name="rdoIDDocente" value="<%=((Docente)pgsElenco.get(0)).getChiavedoc() %>" checked="checked"> </TD>
	<TD> <%= ((Docente)pgsElenco.get(0)).getCognome() %></TD>
	<TD> <%= ((Docente)pgsElenco.get(0)).getNome() %></TD>
	</TR>

<%while(i< numeroRighe){
	%>
	<TR>
	<TD>
	<input type="radio" name="rdoIDDocente" value="<%= ((Docente)pgsElenco.get(i)).getChiavedoc() %>" >
	</TD>
	<TD> <%= ((Docente)pgsElenco.get(i)).getCognome() %></TD>
	<TD> <%= ((Docente)pgsElenco.get(i)).getNome() %></TD>
	</TR>
	<% i++;
	} %>	
</TBODY>
</TABLE>
<P> </P>
<% } else{%> Non ci sono Docenti<% } %> <BR>


<input type="submit" name="cmdAzione" value="Nuovo" button type="button" class="btn btn-dark"></button>
&nbsp;&nbsp;&nbsp;<input type="submit" name="cmdAzione" value="Modifica" button type="button" class="btn btn-dark"></button>
&nbsp;&nbsp;&nbsp;<input type="submit" name="cmdAzione" value="Elimina" button type="button" class="btn btn-dark"></button>

  </form>
  </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</BODY>
</HTML>
