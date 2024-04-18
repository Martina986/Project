package model.session;

import javax.persistence.*;

@Entity
@Table(name="Aula")
public class Aula {


    @Column(name="idAula")
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int chiave;

    @Column(name = "nomeAula")
    private String nomeAula;

    @ManyToMany
    @JoinColumn(name = "fkIdDocente")
    private Docente oDocente;
    @ManyToMany
    @JoinColumn(name = "fkIdDiscente")
    private Discente oDiscente;

    public Aula() {
        this.nomeAula = "" ;
    }

    public Docente getoDocente() {
        return oDocente;
    }

    public void setoDocente(Docente oDocente) {
        this.oDocente = oDocente;
    }

    public Discente getoDiscente() {
        return oDiscente;
    }

    public void setoDiscente(Discente oDiscente) {
        this.oDiscente = oDiscente;
    }

    public int getChiave() {
        return chiave;
    }

    public void setChiave(int chiave) {
        this.chiave = chiave;
    }

    public String getNomeAula() {
        return nomeAula;
    }

    public void setNomeoAula(String nomeAula) {
        this.nomeAula = nomeAula;
    }

}
