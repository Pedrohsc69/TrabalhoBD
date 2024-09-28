package Usuario;

public class main {

	public static void main(String[] args) {
		
		Endereco endereco = new Endereco();
		Endereco endereco02 = new Endereco();
		usuario Usuario = new usuario("Junin da Kaloi", "123.456.789-90", "87 9 2345-6789", 4599.63);
		usuario Usuario02 = new usuario("Genivaldo Junior", "987.456.321.08", "87 9 9874-6531", 9637.50);

		endereco.setRua("Rua Norte");
		endereco.setNumCasa(59);
		Usuario.setDataNascimento("25/06/2002");
		Usuario.setEndereco(endereco);
		

		endereco02.setRua("Rua Central");
		endereco02.setNumCasa(10);
		Usuario02.setEndereco(endereco02);
		
		System.out.println("Usuario 1:");
		System.out.println("Nome: " + Usuario.getNome());
		System.out.println("CPF: " + Usuario.getCPF());
		System.out.println("Data Nascimento: " + Usuario.getDataNascimento());
		System.out.println("Salário: R$ " + Usuario.getSalario());
		System.out.println("Contato: " + Usuario.getContato());
		System.out.println("Endereço: " + Usuario.getEnderecoRua() +" N°"+ Usuario.getEnderecoNumCasa());
		
		
		System.out.println("\nUsuario 2:");
		System.out.println("Nome: " + Usuario02.getNome());
		System.out.println("CPF: " + Usuario02.getCPF());
		System.out.println("Data Nascimento: " + Usuario02.getDataNascimento());
		System.out.println("Salário: R$ " + Usuario02.getSalario());
		System.out.println("Contato: " + Usuario02.getContato());
		System.out.println("Endereço: " + Usuario02.getEnderecoRua() +" N°"+ Usuario02.getEnderecoNumCasa());
		

		
	}
}
