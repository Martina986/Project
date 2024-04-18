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
<TITLE>pgsMain.jsp</TITLE>
</HEAD>
<BODY>
<div class="p-5 bg-dark text-white text-center">
  <h1>Menu Generale</h1>
</div>

<div class="container mt-3">
<div class = "row justify-content-center">
<div class="col-md-3">
  <FORM method="post" action="/WebProjectMavenized/CtrlMain">
  <table class="table table-dark table-hover">
    <tbody>
      <tr>
        <TD><INPUT type="radio" name="rdoScelta" value="0" checked="checked"></TD>
        			<TD>Archivio&nbsp;Docente</TD>
      </tr>
      <tr>
        <TD><INPUT type="radio" name="rdoScelta" value="1" ></TD>
        			<TD>Archivio&nbsp;Discente</TD>
      </tr>
      <tr>
        <TD><INPUT type="radio" name="rdoScelta" value="2" ></TD>
        			<TD>Archivio&nbsp;Aula</TD>
      </tr>
      <tr>
      <TD><INPUT type="radio" name="rdoScelta" value="3" ></TD>
      			<TD>Gestione&nbsp;Corso</TD>
      </tr>
      <tr>
             <TD><INPUT type="radio" name="rdoScelta" value="4" ></TD>
             			<TD>Ricerca&nbsp;Corso&nbsp;Per&nbsp;Discente</TD>
      </tr>
      <tr>
                 <TD><INPUT type="radio" name="rdoScelta" value="5" ></TD>
                 			<TD>Ricerca&nbsp;Corso&nbsp;Per&nbsp;Docente</TD>
       </tr>
    </tbody>
  </table>
  <INPUT type ="submit" name="cmdInvio" value="Invio" button type="button" class="btn btn-dark"></button>
  </form>
  </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</BODY>
</HTML>
