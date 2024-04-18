package model.session;
import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="Corso")
public class Corso {


        @Column(name="idCorso")
        @Id
        @GeneratedValue(strategy=GenerationType.IDENTITY)
        private int chiave;

        @Column(name="nomecorso")
        private String nomeCorso;

        @Column(name="durata")
        private int durata;
        @ManyToOne
        @JoinColumn(name="fkIdDocente")
        private Docente oDocente;



        @ManyToMany(cascade = {CascadeType.ALL})
            @JoinTable(name = "discenti_corso",
            joinColumns = {@JoinColumn(name = "corso_id" , referencedColumnName = "idCorso") },
            inverseJoinColumns = {@JoinColumn(name = "discente_id", referencedColumnName = "iddiscente")})
         private List<Discente> elencoDiscenti;

    public List<Discente> getElencoDiscenti() {
        return elencoDiscenti;
    }

    public void setElencoDiscenti(List<Discente> elencoDiscenti) {
        this.elencoDiscenti = elencoDiscenti;
    }

    public Docente getoDocente() {
         return oDocente;
    }

        public void setoDocente(Docente oDocente) {
        this.oDocente = oDocente;
    }

        public Corso() {
            this.nomeCorso = "";
            this.durata = 0 ;
        }

        public int getChiave() {
            return chiave;
        }

        public void setChiave(int chiave) {
            this.chiave = chiave;
        }

        public String getNomeCorso() {
            return nomeCorso;
        }

        public void setNomeCorso(String nomeCorso) {
            this.nomeCorso = nomeCorso;
        }

        public int getDurata() {
            return durata;
        }

        public void setDurata (int durata) {
            this.durata = durata;
        }


}

