package Usuario;

public class Endereco {

	private String Rua;
	private int numCasa;
	

	void setRua(String newRua) {
		if(numCasa == 0) {
			this.Rua = null;
		} else {			
			this.Rua = newRua;
		}
	}
	
	void setNumCasa(int newNumCasa) {
		if(Rua == null) {
			this.numCasa = 0;
		} else {
			this.numCasa = newNumCasa;
		}
	}
	
	
	
	String getRua() {
		return Rua;
	}
	
	int getNumCasa() {
			return numCasa;
	}
}
