package modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Estoque {
    @Id
    @GeneratedValue
    private int id_estoque;

    private int quantidade_atual;
    private int quantidade_minima;
    private int quantidade_maxima;

    @ManyToOne
    private Produto produto;

    @ManyToOne
    private Loja loja;

    // Getters and Setters

    public int getId_estoque() {
        return id_estoque;
    }

    public void setId_estoque(int id_estoque) {
        this.id_estoque = id_estoque;
    }

    public int getQuantidade_atual() {
        return quantidade_atual;
    }

    public void setQuantidade_atual(int quantidade_atual) {
        this.quantidade_atual = quantidade_atual;
    }

    public int getQuantidade_minima() {
        return quantidade_minima;
    }

    public void setQuantidade_minima(int quantidade_minima) {
        this.quantidade_minima = quantidade_minima;
    }

    public int getQuantidade_maxima() {
        return quantidade_maxima;
    }

    public void setQuantidade_maxima(int quantidade_maxima) {
        this.quantidade_maxima = quantidade_maxima;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public Loja getLoja() {
        return loja;
    }

    public void setLoja(Loja loja) {
        this.loja = loja;
    }
    
    
}
