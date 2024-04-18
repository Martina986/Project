<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="model.session.Discente"%>
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
<TITLE>pgsArchivioDiscente.jsp</TITLE>
</HEAD>
<BODY>
<div class="p-5 bg-dark text-white text-center">
  <h1>Archivio Discenti</h1>
  <FORM method="post" action="/WebProjectMavenized/CtrlMain">
   <INPUT type="submit" name="cmdAzione" value="Torna alla Home" button type="button" class="btn btn-dark"></button>
  </form>
</div>

<FORM method="post" action="/WebProjectMavenized/CtrlArchivioDiscente" name="ArchivioDiscente">

<div class="container mt-3">
<div class = "row justify-content-center">
<div class="col-md-4">
<%
	List pgsElenco= (List) request.getAttribute("elencoDiscenti");
   int numeroRighe = pgsElenco.size();
   if(numeroRighe > 0){
   		int i = 1;

%>
<table class="table table-dark table-hover">
<TBODY>
<thead>
          <tr>
           <th></th>
            <th>Cognome Discente</th>
            <th>Nome Discente</th>
          </tr>
        </thead>
 <TBODY>
	<TR>
	<TD>
	<input type="radio" name="rdoIDDiscente" value="<%=((Discente)pgsElenco.get(0)).getChiavedis() %>" checked="checked"> </TD>
	<TD> <%= ((Discente)pgsElenco.get(0)).getCognome() %></TD>
	<TD> <%= ((Discente)pgsElenco.get(0)).getNome() %></TD>
	</TR>

<%while(i< numeroRighe){
	%>
	<TR>
	<TD>
	<input type="radio" name="rdoIDDiscente" value="<%= ((Discente)pgsElenco.get(i)).getChiavedis() %>" >
	</TD>
	<TD> <%= ((Discente)pgsElenco.get(i)).getCognome() %></TD>
	<TD> <%= ((Discente)pgsElenco.get(i)).getNome() %></TD>
	</TR>
	<% i++;
	} %>
</TBODY>
</TABLE>
<P> </P>
<% } else{%> Non ci sono Discenti<% } %>


<input type="submit" name="cmdAzione" value="Nuovo" button type="button" class="btn btn-dark"></button>
&nbsp;&nbsp;&nbsp;<input type="submit" name="cmdAzione" value="Modifica" button type="button" class="btn btn-dark"></button>
&nbsp;&nbsp;&nbsp;<input type="submit" name="cmdAzione" value="Elimina" button type="button" class="btn btn-dark"></button>

 </div>
  </form>
  </div>
  </div>
  </div>
<br>
</Form>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</BODY>
</HTML>