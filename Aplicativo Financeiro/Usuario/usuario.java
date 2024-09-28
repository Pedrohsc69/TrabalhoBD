package Usuario;

public class usuario {

	private String nome;
	private String cpf;
	private String dataNascimento;
	private double salario;
	private String contato;
	private Endereco endereco;
	
	
	usuario(String Nome, String CPF, String Contato, double Salario){
		this.nome = Nome;
		this.cpf = CPF;
		this.contato = Contato;
		this.salario = Salario;
	}
	
	//void setNome(String newNome) { this.nome = newNome; }
	
	//void setCPF(String newCPF) { this.cpf = newCPF; }
	
	//void setSalario(double newSalario) { this.salario = newSalario; }

	void setDataNascimento(String newDataNascimento) { 
		this.dataNascimento = newDataNascimento; 
	}
	
	
	void setEndereco(Endereco newEndereco) {
		this.endereco = newEndereco;
	}
	
	
	String getNome() {
		return nome;
	}
	
	String getCPF() {
		return cpf;
	}
	
	String getDataNascimento() {
		if(dataNascimento == null) {
			return "Usuário sem data de nascimento";
		} else {
			return dataNascimento;
		}
	}
	
	double getSalario() {
		return salario;
	}
	
	String getContato() {
		return contato;
	}
	
	String getEnderecoRua() {
		return endereco.getRua();
	}
	
	int getEnderecoNumCasa() {
		return endereco.getNumCasa();
	}
	
	
}
