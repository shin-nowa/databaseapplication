package app;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class Teste {
    public static void mainfeio(String[] args) {
        try {
            System.out.println("Tentando carregar...");
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("lojaPU");
            System.out.println("SUCESSO!");
            emf.close();
        } catch (Exception e) {
            System.err.println("Erro ao inicializar:");
            e.printStackTrace();
        }
    }
}