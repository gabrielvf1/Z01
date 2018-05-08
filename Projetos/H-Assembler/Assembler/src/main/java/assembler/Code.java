/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;

/**
 * Traduz mnemônicos da linguagem assembly para códigos binários da arquitetura Z0.
 */
public class Code {

    /**
     * Retorna o código binário do(s) registrador(es) que vão receber o valor da instrução.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 4 bits) com código em linguagem de máquina para a instrução.
     */
    public static String dest(String[] mnemnonic) {
    	
    	return null;
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) {
    	return null;
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {
    	String jumpBin = "";  	
    	jumpBin = "111";
    	
    	return jumpBin;
    	
    }

    /**
     * Retorna o código binário de um valor decimal armazenado numa String.
     * @param  symbol valor numérico decimal armazenado em uma String.
     * @return Valor em binário (String de 15 bits) representado com 0s e 1s.
     */
    public static String toBinary(String symbol) {
    	
    	int Dec= Integer.parseInt(symbol);
    	String Bin;
    	
    	if (Dec<32767){
    		Bin=Integer.toBinaryString(Dec);
   
    		int Falta = 15-Bin.length();
    		String complemento="";
    		while (Falta != 0){
    			complemento= complemento+"0";
    			Falta -=1;
    		}
    		Bin=complemento+Bin;
    	}
    	else{
    	System.out.println("ERRO: Tamanho do N�mero � superior a 15 bits");
    	Bin="111111111111111";	
    	
    	}
    	
    	return Bin ;
    }

}
