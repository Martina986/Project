package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.AulaService;
import model.session.Aula;
import model.session.Corso;
import model.session.Discente;
import model.session.Docente;

/**
 * Servlet implementation class CtrlArchivioAula
 */
@WebServlet("/CtrlArchivioAula")
public class CtrlArchivioAula extends HttpServlet {
    private static final long serialVersionUID = 2L;


    private AulaService oAulaService = new AulaService();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CtrlArchivioAula() {
        super();
        // TODO Auto-generated constructor stub
    }


    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String azione = request.getParameter("cmdAzione");
        if (azione == null) {
            visualizzaElenco(request, response);
        } else if (azione.equals("Torna alla Home")) {
            getServletContext().getRequestDispatcher("/CtrlMain").forward(request, response);
        } else if (azione.equals("Nuovo")) {
            nuovaAula(request, response);
        } else if (azione.equals("Annulla")) {
            visualizzaElenco(request, response);
        } else if (azione.equals("Registra")) {
            salvaAula(request, response);
            visualizzaElenco(request, response);
        } else if (azione.equals("Modifica")) {
            modificaAula(request, response);
        } else if (azione.equals("Elimina")) {
            eliminaAula(request, response);
        } else if (azione.equals("Conferma")) {
            cancellaAula(request, response);
            visualizzaElenco(request, response);
        }
    }

    private void cancellaAula(HttpServletRequest request, HttpServletResponse response) {
        // TODO Auto-generated method stub
        oAulaService.delete(((Aula) request.getSession().getAttribute("beanAula")));
    }

    private void eliminaAula(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.getSession().setAttribute("beanAula", oAulaService.findById(Integer.parseInt(request.getParameter("rdoidAula"))));
        getServletContext().getRequestDispatcher("/ArchivioAula/PgsArchivioAulaElimina.jsp").forward(request, response);
    }

    private void modificaAula(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.getSession().setAttribute("beanAula", oAulaService.findById(Integer.parseInt(request.getParameter("rdoidAula"))));
        getServletContext().getRequestDispatcher("/ArchivioAula/PgsArchivioAulaNuovoModifica.jsp").forward(request, response);
    }

    private void salvaAula(HttpServletRequest request, HttpServletResponse response) {
        // TODO Auto-generated method stub
        Docente oDocente = new Docente();
        Corso oCorso = new Corso();
        Discente oDiscente = new Discente();
        ((Aula) request.getSession().getAttribute("beanAula")).setNomeoAula(request.getParameter("txtNomeAula"));
        oDocente.setChiavedoc(Integer.parseInt(request.getParameter("intchiave")));
        oDiscente.setChiavedis(Integer.parseInt(request.getParameter("intchiave")));
        oCorso.setChiave(Integer.parseInt(request.getParameter("intchiave")));
        ((Aula) request.getSession().getAttribute("beanAula")).setoDocente(oDocente);
        if (((Aula) request.getSession().getAttribute("beanAula")).getChiave() == 0)
            oAulaService.persist(((Aula) request.getSession().getAttribute("beanAula")));
        else
            oAulaService.update(((Aula) request.getSession().getAttribute("beanAula")));
    }

    private void nuovaAula(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        Aula oAula = new Aula();
        HttpSession oSessione = request.getSession();
        oSessione.setAttribute("beanAula", oAula);
        getServletContext().getRequestDispatcher("/GestioneCorso/PgsGestioneCorsoNuovoModifica.jsp").forward(request, response);
    }

    private void visualizzaElenco(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        List<Aula> elenco = oAulaService.findAll();

        request.setAttribute("elencoAula", elenco);
        //Definizione di un oggetto della classeServletContext
        ServletContext oContesto = getServletContext();
        //Definizione di un oggetto per la pubblicazione della PGS
        RequestDispatcher oDispatcher = oContesto.getRequestDispatcher("" +
                "/ArchivioAula/PgsArchivioAula.jsp");
        oDispatcher.forward(request, response);
    }
}