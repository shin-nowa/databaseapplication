package modelo;

import java.io.Serializable;
import java.util.Objects;

public class ProdutoFornecedorId implements Serializable {

    private Produto produto;
    private Fornecedor fornecedor;

    public ProdutoFornecedorId() {}

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ProdutoFornecedorId)) return false;
        ProdutoFornecedorId that = (ProdutoFornecedorId) o;
        return Objects.equals(produto, that.produto) &&
               Objects.equals(fornecedor, that.fornecedor);
    }

    @Override
    public int hashCode() {
        return Objects.hash(produto, fornecedor);
    }
}