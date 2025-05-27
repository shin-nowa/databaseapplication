package modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class ItemVenda {
    @Id
    @GeneratedValue
    private int id_item;
    
    private Double preco_unitario;
    private int quantidade;
    private Double desconto;
    private Double valor_total;

    @ManyToOne
    private Venda venda;
    @ManyToOne
    private Produto produto;
    
    //Getters and Setters
    
    public int getId_item() {
        return id_item;
    }
    public void setId_item(int id_item) {
        this.id_item = id_item;
    }
    public Double getPreco_unitario() {
        return preco_unitario;
    }
    public void setPreco_unitario(Double preco_unitario) {
        this.preco_unitario = preco_unitario;
    }
    public int getQuantidade() {
        return quantidade;
    }
    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
    public Double getDesconto() {
        return desconto;
    }
    public void setDesconto(Double desconto) {
        this.desconto = desconto;
    }
    public Double getValor_total() {
        return valor_total;
    }
    public void setValor_total(Double valor_total) {
        this.valor_total = valor_total;
    }
    public Venda getVenda() {
        return venda;
    }
    public void setVenda(Venda venda) {
        this.venda = venda;
    }
    public Produto getProduto() {
        return produto;
    }
    public void setProduto(Produto produto) {
        this.produto = produto;
    }
    
}
