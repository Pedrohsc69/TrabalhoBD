package Usuario;

public class main {

	public static void main(String[] args) {
		

		usuario Usuario = new usuario("Junin da Kaloi", "123.456.789-90", "87 9 2345-6789", 5000);
		Usuario.setDataNascimento("25/06/2002");
		
		Categoria categoria = new Categoria("Salario", Usuario.getSalario(), 5, true);
		Categoria categoria02 = new Categoria("Trasnporte", 250, 4, true);
		
		Transacao transacao = new Transacao(categoria.getOrcamento(), "receita", categoria.getNome(), "2024-09-06");
		Transacao transacao02 = new Transacao(categoria02.getOrcamento(), "despesa", categoria.getNome(), "2024-09-20");
		ControleFinanceiro controle = new ControleFinanceiro();
		
		controle.adicionarTransacao(Usuario.getSalario(), transacao.getTipo(), transacao.getCategoria(), transacao.getData());
		
		controle.adicionarTransacao(categoria02.getOrcamento(), transacao02.getTipo(), transacao.getCategoria(), transacao.getData());
		

		
		System.out.println("****Informações Usuário 1:****");
		System.out.println("Nome: " + Usuario.getNome());
		System.out.println("CPF: " + Usuario.getCPF());
		System.out.println("Data Nascimento: " + Usuario.getDataNascimento());
		System.out.println("Salário: R$ " + Usuario.getSalario());
		System.out.println("Contato: " + Usuario.getContato());
		System.out.println("\n****Transações Usuário 1:****");
		categoria.mostrarCategoria();
		System.out.println("-----------------------------------------------------------");
		categoria02.mostrarCategoria();
		System.out.println("");
		controle.gerarRelatorioMensal("09", "2024");
		
		
		System.out.println("\n____________________________________________________________________________________\n");
		
		
		usuario Usuario02 = new usuario("Genivaldo Junior", "987.456.321.08", "87 9 9874-6531", 9637.50);
		
		
		Categoria categoria01Usuario02 = new Categoria("Salario", Usuario02.getSalario(), 5, true);
		Categoria categoria02Usuario02 = new Categoria("Aluguel da casa", 600, 5, true);
		categoria01Usuario02.setDescricao("Salario do emprego");
		
		ControleFinanceiro controleUsuario02 = new ControleFinanceiro();
		

		Transacao transacao01Usuario02 = new Transacao(categoria01Usuario02.getOrcamento(), "receita", categoria01Usuario02.getNome(), "2024-09-01");
		Transacao transacao02Usuario02 = new Transacao(categoria02Usuario02.getOrcamento(), "despesa", categoria01Usuario02.getNome(), "2024-09-06");
		
		controleUsuario02.adicionarTransacao(Usuario02.getSalario(), transacao01Usuario02.getTipo(), transacao01Usuario02.getCategoria(), 
				transacao01Usuario02.getData());
		
		controleUsuario02.adicionarTransacao(categoria02Usuario02.getOrcamento(), transacao02Usuario02.getTipo(), transacao02Usuario02.getCategoria(), 
				transacao02Usuario02.getData());

		
		
		System.out.println("\n****Informações Usuário 2:****");
		System.out.println("Nome: " + Usuario02.getNome());
		System.out.println("CPF: " + Usuario02.getCPF());
		System.out.println("Data Nascimento: " + Usuario02.getDataNascimento());
		System.out.println("Salário: R$ " + Usuario02.getSalario());
		System.out.println("Contato: " + Usuario02.getContato());
		System.out.println("\n****Transações Usuário 2****");
		categoria01Usuario02.mostrarCategoria();
		System.out.println("-----------------------------------------------------------");
		categoria02Usuario02.mostrarCategoria();
		System.out.println("");
		controleUsuario02.gerarRelatorioMensal("09", "2024");
		
	}
}
