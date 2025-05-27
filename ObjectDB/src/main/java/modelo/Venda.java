package modelo;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Venda {
    @Id
    @GeneratedValue
    private int id_venda;

    private String numero_venda;
    private Double valor_total;
    private Double desconto_total;
    private String forma_pagamento;
    private String status_venda;
    private LocalDateTime data_venda;

    
    @ManyToOne
    private Cliente cliente;
    
    @ManyToOne
    private Loja loja;
    
    @ManyToOne
    private Funcionario funcionario;
    
     // Adiciona lista de itens da venda
    @OneToMany(mappedBy = "venda")
    private List<ItemVenda> itens = new ArrayList<>();

    // Método addItem que faltava
    public void addItem(ItemVenda item) {
        item.setVenda(this); // Associa o item à esta venda
        this.itens.add(item);
    }
    
    // Getters and Setters
    public int getId_venda() {
        return id_venda;
    }

    public void setId_venda(int id_venda) {
        this.id_venda = id_venda;
    }

    public String getNumero_venda() {
        return numero_venda;
    }
    
    public void setNumero_venda(String numero_venda) {
        this.numero_venda = numero_venda;
    }
    
    public Double getValor_total() {
        return valor_total;
    }

    public void setValor_total(Double valor_total) {
        this.valor_total = valor_total;
    }

    public Double getDesconto_total() {
        return desconto_total;
    }

    public void setDesconto_total(Double desconto_total) {
        this.desconto_total = desconto_total;
    }

    public String getForma_pagamento() {
        return forma_pagamento;
    }

    public void setForma_pagamento(String forma_pagamento) {
        this.forma_pagamento = forma_pagamento;
    }

    public String getStatus_venda() {
        return status_venda;
    }
    
    public void setStatus_venda(String status_venda) {
        this.status_venda = status_venda;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    public LocalDateTime getData_venda() {
        return data_venda;
    }

    public void setData_venda(LocalDateTime data_venda) {
        this.data_venda = data_venda;
    }

    public Loja getLoja() {
        return loja;
    }

    public void setLoja(Loja loja) {
        this.loja = loja;
    }

    public Funcionario getFuncionario() {
        return funcionario;
    }

    public void setFuncionario(Funcionario funcionario) {
        this.funcionario = funcionario;
    }
}