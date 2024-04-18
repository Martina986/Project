package model.session;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="Docente")
public class Docente {

	
	@Column(name="idDocente")
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int chiavedoc;
	
	@Column(name="cognome")
	private String cognome;
	
	@Column(name="nome")
	private String nome;

	@OneToMany(mappedBy = "oDocente")
	private List<Corso> elencoCorsi;

	
	public Docente() {
		this.nome = "";
		this.cognome = "";
	}

	public int getChiavedoc() {
		return chiavedoc;
	}

	public void setChiavedoc(int chiavedoc) {
		this.chiavedoc = chiavedoc;
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
