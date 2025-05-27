package modelo;

import java.io.Serializable;
import java.util.Objects;

public class ProdutoPromocaoId implements Serializable {

    private Promocao promocao;
    private Produto produto;

    public ProdutoPromocaoId() {}

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ProdutoPromocaoId)) return false;
        ProdutoPromocaoId that = (ProdutoPromocaoId) o;
        return Objects.equals(promocao, that.promocao) &&
               Objects.equals(produto, that.produto);
    }

    @Override
    public int hashCode() {
        return Objects.hash(promocao, produto);
    }
}