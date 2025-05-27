package modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Loja {
    @Id
    @GeneratedValue
    private int id_loja;

    private String codigo_loja;
    private String nome_loja;
    private String endereco;
    private String cidade;
    private String estado;
    private String cep;
    private String telefone;
    private String gerente;
    private boolean ativa;

    // Getters and Setters
    
    public int getId_loja() {
        return id_loja;
    }
    public void setId_loja(int id_loja) {
        this.id_loja = id_loja;
    }
    public String getCodigo_loja() {
        return codigo_loja;
    }
    public void setCodigo_loja(String codigo_loja) {
        this.codigo_loja = codigo_loja;
    }
    public String getNome_loja() {
        return nome_loja;
    }
    public void setNome_loja(String nome_loja) {
        this.nome_loja = nome_loja;
    }
    public String getEndereco() {
        return endereco;
    }
    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }
    public String getCidade() {
        return cidade;
    }
    public void setCidade(String cidade) {
        this.cidade = cidade;
    }
    public String getEstado() {
        return estado;
    }
    public void setEstado(String estado) {
        this.estado = estado;
    }
    public String getCep() {
        return cep;
    }
    public void setCep(String cep) {
        this.cep = cep;
    }
    public String getTelefone() {
        return telefone;
    }
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
    public String getGerente() {
        return gerente;
    }
    public void setGerente(String gerente) {
        this.gerente = gerente;
    }
    public boolean isAtiva() {
        return ativa;
    }
    public void setAtiva(boolean ativa) {
        this.ativa = ativa;
    }

    
}
