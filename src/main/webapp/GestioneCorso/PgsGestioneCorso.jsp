<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="model.session.Corso"%>
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
<TITLE>pgsGestioneCorso.jsp</TITLE>
</HEAD>
<BODY>

<div class="p-5 bg-dark text-white text-center">
  <h1>Lista corsi</h1>
  <FORM method="post" action="/WebProjectMavenized/CtrlGestioneCorso">
   <INPUT type="submit" name="cmdAzione" value="Torna alla Home" button type="button" class="btn btn-dark"></button>
  </form>
</div>


<div class="container mt-3">
<div class = "row justify-content-center">
<div class="col-md-5">
<FORM method="post" action="/WebProjectMavenized/CtrlGestioneCorso" name="GestioneCorso">
<%

List Elenco= (List) request.getAttribute("elencoCorsi");
     int numeroRighe = Elenco.size();
     if(numeroRighe > 0){
     		int i = 1;




%>
 <table class="table table-dark table-hover">
    <div class="col-5">
    <thead>
          <tr>
           <th></th>
            <th>NomeCorso</th>
            <th>Durata</th>
            <th>Cognome Docente</th>
            <th>Nome Docente</th>
            <th>Nome Discente</th>
          </tr>
        </thead>
     <TBODY>
	<TR>
	<TD>
	<input type="radio" name="rdoidCorso" value="<%=((Corso)Elenco.get(0)).getChiave() %>" checked="checked"> </TD>
	<TD> <%= ((Corso)Elenco.get(0)).getNomeCorso() %></TD>
	<TD> <%= ((Corso)Elenco.get(0)).getDurata() %></TD>
	<TD> <%= ((Corso)Elenco.get(0)).getoDocente().getNome() %></TD>
	<TD> <%= ((Corso)Elenco.get(0)).getoDocente().getCognome() %></TD>
	</TR>

<%while(i< numeroRighe){
	%>
	<TR>
	<TD>
	<input type="radio" name="rdoidCorso" value="<%= ((Corso)Elenco.get(i)).getChiave() %>" >
	</TD>
	<TD> <%= ((Corso)Elenco.get(i)).getNomeCorso() %></TD>
	<TD> <%= ((Corso)Elenco.get(i)).getDurata() %></TD>
	<TD> <%= ((Corso)Elenco.get(i)).getoDocente().getNome() %></TD>
    <TD> <%= ((Corso)Elenco.get(i)).getoDocente().getCognome() %></TD>
	</TR>
	<% i++;
	} %>
</TBODY>
</TABLE>
<% } else{%> Non ci sono Corsi<% } %>


<input type="submit" name="cmdAzione" value="Nuovo" button type="button" class="btn btn-dark"></button>
&nbsp;&nbsp;&nbsp;<input type="submit" name="cmdAzione" value="Modifica" button type="button" class="btn btn-dark"></button>
&nbsp;&nbsp;&nbsp;<input type="submit" name="cmdAzione" value="Elimina" button type="button" class="btn btn-dark"></button>
 </div>
  </form>
  </div>
  </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</BODY>
</HTML>