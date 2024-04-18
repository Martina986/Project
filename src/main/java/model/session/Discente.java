package model.session;
import org.hibernate.annotations.Immutable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.*;
import java.util.List;

@Entity
    @Table(name="Discente")
    public class Discente {


        @Column(name="iddiscente")
        @Id
        @GeneratedValue(strategy=GenerationType.IDENTITY)
        private int chiavedis;

        @Column(name="cognome")
        private String cognome;

        @Column(name="nome")
        private String nome;

        @ManyToMany (mappedBy = "elencoDiscenti")
        private List<Corso> elencoCorsi;


        public Discente() {
            this.nome = "";
            this.cognome = "";
        }

        public int getChiavedis() {
            return chiavedis;
        }

        public void setChiavedis(int chiavedis) {
            this.chiavedis = chiavedis;
        }

        public String getCognome() {
            return cognome;
        }

        public void setCognome(String cognome) {
            this.cognome = cognome;
        }

        public String getNome() {
            return nome;
        }

        public void setNome(String nome) {
            this.nome = nome;
        }
    }

