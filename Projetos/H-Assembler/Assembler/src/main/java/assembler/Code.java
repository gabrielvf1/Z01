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
     * @param  mnemnonic[0] vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 4 bits) com código em linguagem de máquina para a instrução.
     */
    public static String dest(String[] mnemnonic) {
    	String d3 = "0",d2 = "0",d1 = "0",d0 = "0";
    	
    	if (mnemnonic[0] == "nop" || mnemnonic.length < 2){
    		return "0000";
    	}  	
    	
    	if (mnemnonic.length < 3){
    		switch(mnemnonic[1]){	
	    		case "%A" : d3 = "1";break;
				case "%S" : d2 = "1";break;
				case "%D" : d1 = "1";break;
				case "(%A)" : d0 = "1";break;
    		}
 
    	}else{
 
	    	for(int i = 0; i < mnemnonic.length-2; i++){
	    		switch(mnemnonic[2+i]){	
		    		case "%A" : d3 = "1";break;
					case "%S" : d2 = "1";break;
					case "%D" : d1 = "1";break;
					case "(%A)" : d0 = "1";break;
	    		}
	    	}
    	}
    	
    	return d3+d2+d1+d0;
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic[0] vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) {
    	String bit14="0",bit13="0";
    	String bit_12to7="0";
    	
    	if (mnemnonic[0] == "nop"){
    		return "0000";
    	}
    	
    	
    	if (mnemnonic.length < 3){
    		switch (mnemnonic[1]){
    			case "%D" : bit13 = "0"; bit14 = "0"; break;
    			case "%S" : bit13 = "1"; bit14 = "0"; break;
    			case "%A" : bit13 = "0"; bit14 = "0"; break;
    			case "(%A)" : bit13 = "0"; bit14 = "1"; break;	
    		}
 
    	}else{
    	
	    	if (mnemnonic[1] == "%A" || mnemnonic[2] == "%A"){
	    		bit14 = "0";
	    	}else{
	    		bit14 = "1";
	    	}
	
	    	if (mnemnonic[1] == "%D" || mnemnonic[2] == "%D"){
	    		bit13 = "0";
	    	}else{
	    		bit13 = "1";
	    	}
    	}
 
    	

    	
    	
    	
    	if (mnemnonic[1] == "%D" || mnemnonic[1] == "%S"){
    		switch (mnemnonic[0]){
    			case "movw" : bit_12to7 = "001100";break;
    			case "addw" : bit_12to7 = "000010";break;
    			case "subw" : bit_12to7 = "010011";break;
    			case "rsubw" : bit_12to7 = "000111";break;
    			case "incw" : bit_12to7 = "011111";break;
    			case "decw" : bit_12to7 = "000110";break;
    			case "notw" : bit_12to7 = "001101";break;
    			case "negw" : bit_12to7 = "001111";break;
    			case "andw" : bit_12to7 = "000000";break;
    			case "orw" : bit_12to7 = "010101";break;
    		}
    		
    	}else{
    		switch (mnemnonic[0]){
			case "movw" : bit_12to7 = "110000";break;
			case "addw" : bit_12to7 = "000010";break;
			case "subw" : bit_12to7 = "000111";break;
			case "rsubw" : bit_12to7 = "010011";break;
			case "incw" : bit_12to7 = "111011";break;
			case "decw" : bit_12to7 = "110010";break;
			case "notw" : bit_12to7 = "110001";break;
			case "negw" : bit_12to7 = "110001";break;
			case "andw" : bit_12to7 = "000000";break;
			case "orw" : bit_12to7 = "010101";break;
    		}
    		
    	}
    	
    	return bit14+bit13+bit_12to7;
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     * @param  mnemnonic[0] vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {
      	if (mnemnonic[0] == "jg"){
    		return "001";
    	} else if ( mnemnonic[0] == "je"){
    		return "010";
    	} else if ( mnemnonic[0] == "jge"){
    		return "011";
    	} else if ( mnemnonic[0] == "jl"){
    		return "100";
    	} else if ( mnemnonic[0] == "jne"){
    		return "101";
    	} else if ( mnemnonic[0] == "jle"){
    		return "110";
    	} else if ( mnemnonic[0] == "jmp"){
    		return "111";
    	} else {
    		return "000";
    	}
    	
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
    	System.out.println("ERRO: Tamanho do Número é superior a 15 bits");
    	Bin="111111111111111";	
    	
    	}
    	
    	return Bin ;
    }
}
