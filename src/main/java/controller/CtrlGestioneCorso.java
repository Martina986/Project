package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.CorsoService;
import model.dao.DiscenteService;
import model.dao.DocenteService;
import model.session.Corso;
import model.session.Discente;
import model.session.Docente;

import static javax.xml.bind.DatatypeConverter.parseInt;


/**
 * Servlet implementation class CtrlGestioneCorso
 */
@WebServlet("/CtrlGestioneCorso")
public class CtrlGestioneCorso extends HttpServlet {
    private static final long serialVersionUID = 1L;


    private CorsoService oCorsoService = new CorsoService();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CtrlGestioneCorso() {
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
            nuovoCorso(request, response);
        } else if (azione.equals("Annulla")) {
            visualizzaElenco(request, response);
        } else if (azione.equals("Registra")) {
            salvaCorso(request, response);
            visualizzaElenco(request, response);
        } else if (azione.equals("Modifica")) {
            modificaCorso(request, response);
        } else if (azione.equals("Elimina")) {
            eliminaCorso(request, response);
        } else if (azione.equals("Conferma")) {
            cancellaCorso(request, response);
            visualizzaElenco(request, response);
        }
    }

    private void cancellaCorso(HttpServletRequest request, HttpServletResponse response) {
        // TODO Auto-generated method stub
        oCorsoService.delete(((Corso) request.getSession().getAttribute("beanCorso")));
    }

    private void eliminaCorso(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.getSession().setAttribute("beanCorso", oCorsoService.findById(parseInt(request.getParameter("rdoidCorso"))));
        getServletContext().getRequestDispatcher("/GestioneCorso/PgsGestioneCorsoElimina.jsp").forward(request, response);
    }

    private void modificaCorso(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.getSession().setAttribute("beanCorso", oCorsoService.findById(parseInt(request.getParameter("rdoidCorso"))));
        getServletContext().getRequestDispatcher("/GestioneCorso/PgsGestioneCorsoNuovoModifica.jsp").forward(request, response);
    }

    private void salvaCorso(HttpServletRequest request, HttpServletResponse response) {
        // TODO Auto-generated method stub
        Docente oDocente = new Docente();
        ((Corso) request.getSession().getAttribute("beanCorso")).setNomeCorso(request.getParameter("txtNomeCorso"));
        ((Corso) request.getSession().getAttribute("beanCorso")).setDurata(parseInt(request.getParameter("intDurata")));
        oDocente.setChiavedoc(Integer.parseInt(request.getParameter("conferma")));
        DiscenteService oDiscenteService = new DiscenteService();
        Discente oDiscente = oDiscenteService.findById(parseInt(request.getParameter("chiavedis")));
        List<Discente> elencoDiscenti = new ArrayList<>();
        elencoDiscenti.add(oDiscente);
        ((Corso) request.getSession().getAttribute("beanCorso")).setElencoDiscenti(elencoDiscenti);
        ((Corso) request.getSession().getAttribute("beanCorso")).setoDocente(oDocente);
        if (((Corso) request.getSession().getAttribute("beanCorso")).getChiave() == 0)
            oCorsoService.persist(((Corso) request.getSession().getAttribute("beanCorso")));
        else
            oCorsoService.update(((Corso) request.getSession().getAttribute("beanCorso")));
    }


    private void nuovoCorso(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        Corso oCorso = new Corso();
        HttpSession oSessione = request.getSession();
        oSessione.setAttribute("beanCorso", oCorso);
        getServletContext().getRequestDispatcher("/GestioneCorso/PgsGestioneCorsoNuovoModifica.jsp").forward(request, response);
    }

    private void visualizzaElenco(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        List<Corso> elenco = oCorsoService.findAll();

        request.setAttribute("elencoCorsi", elenco);
        //Definizione di un oggetto della classeServletContext
        ServletContext oContesto = getServletContext();
        //Definizione di un oggetto per la pubblicazione della PGS
        RequestDispatcher oDispatcher = oContesto.getRequestDispatcher("" +
                "/GestioneCorso/PgsGestioneCorso.jsp");
        oDispatcher.forward(request, response);
    }
}