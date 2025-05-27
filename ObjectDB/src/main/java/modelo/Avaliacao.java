package modelo;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Avaliacao {
    @Id
    @GeneratedValue
    private int id_avaliacao;
    
    private int nota;
    
    private String comentario;
    
    @ManyToOne
    private Produto produto;
    
    @ManyToOne
    private Cliente cleinte;
    
    private LocalDateTime data_avaliacao;
    
    // Getters and Setters

    public int getId_avaliacao() {
        return id_avaliacao;
    }

    public void setId_avaliacao(int id_avaliacao) {
        this.id_avaliacao = id_avaliacao;
    }

    public int getNota() {
        return nota;
    }

    public void setNota(int nota) {
        this.nota = nota;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public Cliente getCleinte() {
        return cleinte;
    }

    public void setCleinte(Cliente cleinte) {
        this.cleinte = cleinte;
    }

    public LocalDateTime getData_avaliacao() {
        return data_avaliacao;
    }

    public void setData_avaliacao(LocalDateTime data_avaliacao) {
        this.data_avaliacao = data_avaliacao;
    }

    
}