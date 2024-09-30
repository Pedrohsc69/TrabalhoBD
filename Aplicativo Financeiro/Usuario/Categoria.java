class Categoria {
    private String nome;
    private String descricao;
    private double orcamento;
    private int prioridade;
    private boolean ativa;

    Categoria(String nome, String descricao, double orcamento, int prioridade, boolean ativa) {
        setNome(nome);
        setDescricao(descricao);
        setOrcamento(orcamento);
        setPrioridade(prioridade);
        this.ativa = ativa;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        if (nome == null || nome.isEmpty()) {
            throw new IllegalArgumentException("O nome não pode ser vazio.");
        }
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        if (descricao == null || descricao.isEmpty()) {
            throw new IllegalArgumentException("A descrição não pode ser vazia.");
        }
        this.descricao = descricao;
    }

    public double getOrcamento() {
        return orcamento;
    }

    public void setOrcamento(double orcamento) {
        if (orcamento < 0) {
            throw new IllegalArgumentException("O orçamento não pode ser negativo.");
        }
        this.orcamento = orcamento;
    }

    public int getPrioridade() {
        return prioridade;
    }

    public void setPrioridade(int prioridade) {
        if (prioridade < 1 || prioridade > 5) {
            throw new IllegalArgumentException("A prioridade deve ser entre 1 e 5.");
        }
        this.prioridade = prioridade;
    }

    public boolean isAtiva() {
        return ativa;
    }

    public void setAtiva(boolean ativa) {
        this.ativa = ativa;
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