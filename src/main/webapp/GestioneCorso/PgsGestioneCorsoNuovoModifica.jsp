<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="model.session.Docente"%>
<%@page import="model.session.Discente"%>
<%@page import="model.dao.DocenteService"%>
<%@page import="model.dao.DiscenteService"%>
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
<TITLE>pgsGestioneCorsoNuovoModifica.jsp</TITLE>
</HEAD>
<BODY>


    <jsp:useBean id="beanCorso" scope="session"
        class="model.session.Corso">
        <jsp:setProperty name="beanCorso" property="*" />
    </jsp:useBean>

    <div class="p-5 bg-dark text-white text-center">
      <h1>Nuovo Corso</h1>
      <FORM method="post" action="/WebProjectMavenized/CtrlGestioneCorso">
       <INPUT type="submit" name="cmdAzione" value="Torna alla Home" button type="button" class="btn btn-dark"></button>
      </form>
    </div>
    <%
      DocenteService oDocenteService = new DocenteService();
      List<Docente> Elenco = oDocenteService.findAll();
       int numeroRighe = Elenco.size();
       if(numeroRighe > 0){
            int i = 1;

    %>

 <div class="container mt-3">
  <div class = "row justify-content-center">
   <div class="col-md-3">
     <FORM method="post" action="/WebProjectMavenized/CtrlGestioneCorso">
        <div class="mb-3 mt-3">
        <label for="surname">NomeCorso</label>
            <INPUT type="text" name="txtNomeCorso" value="<%= beanCorso.getNomeCorso()%>" size="20" maxlength="50" class="form-control">
        </div>

         <div class="mb-3 mt-3">
         <label for="durata">Durata</label>
        <INPUT type="number" name="intDurata" value="<%= beanCorso.getDurata()%>" size="20" maxlength="50" class="form-control">
        </div>


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
        	<input type="radio" name="conferma" value="<%=((Docente)Elenco.get(0)).getChiavedoc() %>" checked="checked"> </TD>
        	<TD> <%= ((Docente)Elenco.get(0)).getCognome() %></TD>
        	<TD> <%= ((Docente)Elenco.get(0)).getNome() %></TD>
        	</TR>

        <%while(i< numeroRighe){
        	%>
        	<TR>
        	<TD>
        	<input type="radio" name="conferma" value="<%= ((Docente)Elenco.get(i)).getChiavedoc() %>" >
        	</TD>
        	<TD> <%= ((Docente)Elenco.get(i)).getCognome() %></TD>
        	<TD> <%= ((Docente)Elenco.get(i)).getNome() %></TD>
        	</TR>
        	<% i++;
        	} %>
        </TBODY>
        </TABLE>
        <P> </P>
        <% } else{%> Non ci sono Docenti<% } %>

            <%
              DiscenteService oDiscenteService = new DiscenteService();
              List<Discente> Elencodis = oDiscenteService.findAll();
               int numerorighe = Elencodis.size();
               if(numerorighe > 0){
                    int i = 1;

            %>

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
                <INPUT type="checkbox" name="chiavedis" value="<%= ((Discente)Elencodis.get(0)).getChiavedis()%>"></TD>
                <TD> <%= ((Discente)Elencodis.get(0)).getCognome() %></TD>
                <TD> <%= ((Discente)Elencodis.get(0)).getNome() %></TD>
                </TR>

           <%while(i< numerorighe){
                %>
                <TR>
                <TD>
                <input type="checkbox" name="chiavedis" value="<%= ((Discente)Elencodis.get(i)).getChiavedis()%>"></TD>
                <TD> <%= ((Discente)Elencodis.get(i)).getCognome() %></TD>
                <TD> <%= ((Discente)Elencodis.get(i)).getNome() %></TD>
                </TR>
                <% i++;
                } %>
                </TBODY>
                   </TABLE>
                   <% } else{%> Non ci sono Discenti<% } %>


               <INPUT type="submit" name="cmdAzione" value="Registra" button type="button" class="btn btn-dark"></button>
                <INPUT type="submit" name="cmdAzione" value="Annulla" button type="button" class="btn btn-dark"></button>
</div>
    </form>
     </div>
   </div>
 </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</BODY>
</HTML>