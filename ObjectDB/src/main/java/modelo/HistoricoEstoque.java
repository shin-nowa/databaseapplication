package modelo;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
public class HistoricoEstoque {

    @Id
    @GeneratedValue
    private int id_historico_estoque;

    private int quantidadeAnterior;
    private int quantidadeAtual;

    @ManyToOne
    private Produto produto;

    @ManyToOne
    private Loja loja;

    private LocalDateTime dataAlteracao;

    // Getters e Setters

    public int getId_historico_estoque() {
        return id_historico_estoque;
    }

    public void setId_historico_estoque(int id_historico_estoque) {
        this.id_historico_estoque = id_historico_estoque;
    }

    public int getQuantidadeAnterior() {
        return quantidadeAnterior;
    }

    public void setQuantidadeAnterior(int quantidadeAnterior) {
        this.quantidadeAnterior = quantidadeAnterior;
    }

    public int getQuantidadeAtual() {
        return quantidadeAtual;
    }

    public void setQuantidadeAtual(int quantidadeAtual) {
        this.quantidadeAtual = quantidadeAtual;
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

    public Loja getLoja() {
        return loja;
    }

    public void setLoja(Loja loja) {
        this.loja = loja;
    }
}