package modelo;

import java.time.LocalDateTime;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity 
public class Compra {
    @Id
    @GeneratedValue
    private int id_compra;

    private String numero_compra;
    private LocalDateTime data_compra;
    private Double valor_total;
    private String status_compra;

    @ManyToOne
    private Fornecedor fornecedor;
    @ManyToOne
    private Loja loja;

    // Getters and Setters

    public int getId_compra() {
        return id_compra;
    }
    public void setId_compra(int id_compra) {
        this.id_compra = id_compra;
    }
    public String getNumero_compra() {
        return numero_compra;
    }
    public void setNumero_compra(String numero_compra) {
        this.numero_compra = numero_compra;
    }
    public LocalDateTime getData_compra() {
        return data_compra;
    }
    public void setData_compra(LocalDateTime data_compra) {
        this.data_compra = data_compra;
    }
    public Double getValor_total() {
        return valor_total;
    }
    public void setValor_total(Double valor_total) {
        this.valor_total = valor_total;
    }
    public String getStatus_compra() {
        return status_compra;
    }
    public void setStatus_compra(String status_compra) {
        this.status_compra = status_compra;
    }
    public Fornecedor getFornecedor() {
        return fornecedor;
    }
    public void setFornecedor(Fornecedor fornecedor) {
        this.fornecedor = fornecedor;
    }
    public Loja getLoja() {
        return loja;
    }
    public void setLoja(Loja loja) {
        this.loja = loja;
    }

    
}
