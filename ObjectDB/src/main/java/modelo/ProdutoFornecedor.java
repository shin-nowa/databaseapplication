package modelo;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.ManyToOne;

@IdClass(ProdutoFornecedor.class)
@Entity
public class ProdutoFornecedor {
    @Id
    private Double preco_compra;
    private int prazo_entrega;

    @ManyToOne
    private Produto produto;

    @ManyToOne
    private Fornecedor fornecedor;

    // Getters and Setters

    public Double getPreco_compra() {
        return preco_compra;
    }

    public void setPreco_compra(Double preco_compra) {
        this.preco_compra = preco_compra;
    }

    public int getPrazo_entrega() {
        return prazo_entrega;
    }

    public void setPrazo_entrega(int prazo_entrega) {
        this.prazo_entrega = prazo_entrega;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public Fornecedor getFornecedor() {
        return fornecedor;
    }

    public void setFornecedor(Fornecedor fornecedor) {
        this.fornecedor = fornecedor;
    }
}