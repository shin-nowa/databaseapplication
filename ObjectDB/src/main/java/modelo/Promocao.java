package modelo;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Promocao {
    @Id
    @GeneratedValue
    private int id_promocao;

    private String nome_promocao;
    private String descricao;
    private Double percentual_desconto;
    private boolean ativa;


    private LocalDateTime data_inicio;
    private LocalDateTime data_fim;

    // Getters and Setters
    
    public int getId_promocao() {
        return id_promocao;
    }
    public void setId_promocao(int id_promocao) {
        this.id_promocao = id_promocao;
    }
    public String getNome_promocao() {
        return nome_promocao;
    }
    public void setNome_promocao(String nome_promocao) {
        this.nome_promocao = nome_promocao;
    }
    public String getDescricao() {
        return descricao;
    }
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    public Double getPercentual_desconto() {
        return percentual_desconto;
    }
    public void setPercentual_desconto(Double percentual_desconto) {
        this.percentual_desconto = percentual_desconto;
    }
    public boolean isAtiva() {
        return ativa;
    }
    public void setAtiva(boolean ativa) {
        this.ativa = ativa;
    }
    public LocalDateTime getData_inicio() {
        return data_inicio;
    }
    public void setData_inicio(LocalDateTime data_inicio) {
        this.data_inicio = data_inicio;
    }
    public LocalDateTime getData_fim() {
        return data_fim;
    }
    public void setData_fim(LocalDateTime data_fim) {
        this.data_fim = data_fim;
    }
    

    
}
