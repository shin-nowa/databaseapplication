package modelo;

import java.time.LocalDateTime;

import javax.persistence.*;

@Entity
public class HistoricoPreco {

    @Id
    @GeneratedValue
    private int id_historico_preco;

    private double precoAnterior;
    private double precoAtual;

    @ManyToOne
    private Produto produto;

    private LocalDateTime dataAlteracao;

    // Getters e Setters
    public int getId_historico_preco() {
        return id_historico_preco;
    }

    public void setId_historico_preco(int id_historico_preco) {
        this.id_historico_preco = id_historico_preco;
    }

    public double getPrecoAnterior() {
        return precoAnterior;
    }

    public void setPrecoAnterior(double precoAnterior) {
        this.precoAnterior = precoAnterior;
    }

    public double getPrecoAtual() {
        return precoAtual;
    }

    public void setPrecoAtual(double precoAtual) {
        this.precoAtual = precoAtual;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public LocalDateTime getDataAlteracao() {
        return dataAlteracao;
    }

    public void setDataAlteracao(LocalDateTime dataAlteracao) {
        this.dataAlteracao = dataAlteracao;
    }
}