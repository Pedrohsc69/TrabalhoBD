package Usuario;

class Categoria {
    private String nome;
    private String descricao;
    private double orcamento;
    private int prioridade;
    private boolean ativa;

    Categoria(String nome, double orcamento, int prioridade, boolean ativa) {
        this.nome = nome;
        this.orcamento = orcamento;
        this.prioridade = prioridade;
        this.ativa = ativa;
    }

    public String getNome() {
        return nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public double getOrcamento() {
        return orcamento;
    }

    public int getPrioridade() {
        return prioridade;
    }

    public boolean isAtiva() {
        return ativa;
    }

    public void mostrarCategoria() {
        if (ativa) {
            System.out.println("Categoria: " + nome);
            System.out.println("Descrição: " + descricao);
            System.out.println("Orçamento: " + orcamento);
            System.out.println("Prioridade: " + prioridade);
            System.out.println("Ativa: " + ativa);
        } else {
            System.out.println("Categoria inativa.");
        }
    }
}
