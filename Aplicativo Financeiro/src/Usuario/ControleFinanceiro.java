package Usuario;

import java.util.ArrayList;
import java.util.List;

// Classe que representa uma Transação (receita ou despesa)
class Transacao {
    private double valor;
    private String tipo; // "receita" ou "despesa"
    private String categoria;
    private String data; // Data no formato "yyyy-MM-dd"

    // Construtor da classe Transacao
    public Transacao(double valor, String tipo, String categoria, String data) {
        this.valor = valor;
        this.tipo = tipo.toLowerCase(); // Força o tipo para minúsculo
        this.categoria = categoria;
        this.data = data;
    }

    // Getters e Setters para acessar os atributos privados
    public double getValor() {
        return valor;
    }

    public String getTipo() {
        return tipo;
    }

    public String getCategoria() {
        return categoria;
    }


    public String getData() {
        return data;
    }


    public String toString() {
        return "Transacao{" +
                "valor=" + valor +
                ", tipo='" + tipo + '\'' +
                ", categoria='" + categoria + '\'' +
                ", data='" + data + '\'' +
                '}';
    }
}

// Classe que representa o Controle Financeiro
class ControleFinanceiro {
    private List<Transacao> transacoes;

    // Construtor para inicializar a lista de transações
    public ControleFinanceiro() {
        this.transacoes = new ArrayList<>();
    }

    // Método para adicionar uma nova transação
    public void adicionarTransacao(double valor, String tipo, String categoria, String data) {
        Transacao transacao = new Transacao(valor, tipo, categoria, data);
        transacoes.add(transacao);
    }

    // Método para listar todas as transações registradas
    public void listarTransacoes() {
        for (Transacao transacao : transacoes) {
            System.out.println(transacao);
        }
    }

    // Método para calcular o total de receitas ou despesas por categoria
    public double calcularTotalPorCategoria(String categoria, String tipo) {
        double total = 0;
        for (Transacao transacao : transacoes) {
            if (transacao.getCategoria().equalsIgnoreCase(categoria) && transacao.getTipo().equalsIgnoreCase(tipo)) {
                total += transacao.getValor();
            }
        }
        return total;
    }

    // Método para gerar um relatório das transações de um mês específico
    public void gerarRelatorioMensal(String mes, String ano) {
        System.out.println("****Relatório de transações para " + mes + "/" + ano +":****");
        double totalReceitas = 0;
        double totalDespesas = 0;

        for (Transacao transacao : transacoes) {
            if (transacao.getData().startsWith(ano + "-" + mes)) {
                System.out.println(transacao);
                if (transacao.getTipo().equals("receita")) {
                    totalReceitas += transacao.getValor();
                } else if (transacao.getTipo().equals("despesa")) {
                    totalDespesas += transacao.getValor();
                }
            }
        }

        System.out.printf("Total de Receitas: R$ %.2f%n", totalReceitas);
        System.out.printf("Total de Despesas: R$ %.2f%n", totalDespesas);
        System.out.printf("Saldo Final: R$ %.2f%n", (totalReceitas - totalDespesas));
    }

    public static void main(String[] args) {
        // Criando um novo controle financeiro
        ControleFinanceiro controle = new ControleFinanceiro();

        // Adicionando algumas transações
        controle.adicionarTransacao(5000, "receita", "Salário", "2024-09-01");
        controle.adicionarTransacao(200, "despesa", "Transporte", "2024-09-10");
        controle.adicionarTransacao(300, "despesa", "Alimentação", "2024-09-15");

        
        // Listando as transações
        controle.listarTransacoes();

        // Gerando relatório mensal para setembro de 2024
        controle.gerarRelatorioMensal("09", "2024");
        
        System.out.println(controle.calcularTotalPorCategoria("Transporte", "receita"));
    }
}