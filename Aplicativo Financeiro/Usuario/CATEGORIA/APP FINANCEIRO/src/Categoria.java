public class Categoria {

    String nome;

    public Categoria(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public void mostrarCategoria() {
        System.out.println("Categoria: " + nome);
    }
}
