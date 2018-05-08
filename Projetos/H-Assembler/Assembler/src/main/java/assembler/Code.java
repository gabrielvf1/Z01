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
    	
    	if (mnemnonic.length == 2){
    		switch(mnemnonic[1]){	
	    		case "%A" : d3 = "1";break;
				case "%S" : d2 = "1";break;
				case "%D" : d1 = "1";break;
				case "(%A)" : d0 = "1";break;
    		}
    	}else if(mnemnonic.length==3){
 
	    	for(int i = 0; i < mnemnonic.length-2; i++){
	    		switch(mnemnonic[2+i]){	
		    		case "%A" : d3 = "1";break;
					case "%S" : d2 = "1";break;
					case "%D" : d1 = "1";break;
					case "(%A)" : d0 = "1";break;
	    		}
	    	}
	    	
    	}else {
    		if(mnemnonic[0]=="movw"){
	    		for(int i = 0; i < mnemnonic.length-2; i++){
		    		switch(mnemnonic[2+i]){	
			    		case "%A" : d3 = "1";break;
						case "%S" : d2 = "1";break;
						case "%D" : d1 = "1";break;
						case "(%A)" : d0 = "1";break;
		    		}
		    	}
    		}else{
    			switch(mnemnonic[mnemnonic.length-1]){	
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
    	String bit_12to7="000000";
    	
    	if(mnemnonic[0].contains("\t")){
    		mnemnonic[0] = mnemnonic[0].replaceAll("\t", "");
    	}
    	
    	if (mnemnonic[0].equals("nop")){
    		return "00000000";
    	}
    	
    	if (mnemnonic[0].equals("jmp") && mnemnonic.length==1){
    		return "00110000";
    	}
    	
    	
    	if(mnemnonic[0].equals("movw")){
    		
			switch(mnemnonic[1]){
    		case "%D" : bit14 = "0" ; bit13 = "0"; bit_12to7="001100";break;
    		case "%A" : bit14 = "0" ; bit13 = "0"; bit_12to7="110000";break;
    		case "%S" : bit14 = "0" ; bit13 = "1"; bit_12to7="001100";break;
    		case "(%A)" : bit14 = "1" ; bit13 = "0"; bit_12to7="110000";break;
    		case "$0" : bit14 = "0" ; bit13 = "0"; bit_12to7="101010";break;
    		case "$1" : bit14 = "0" ; bit13 = "0"; bit_12to7="111111";break;
    		case "%-1" : bit14 = "0" ; bit13 = "0"; bit_12to7="111010";break;
    		
    		}
					
		}else{
				    	
	    	if(mnemnonic.length == 2){
	    		switch(mnemnonic[1]){
	    		case "%D" : bit14 = "0" ; bit13 = "0";break;
	    		case "%A" : bit14 = "0" ; bit13 = "0";break;
	    		case "%S" : bit14 = "0" ; bit13 = "1";break;
	    		case "(%A)" : bit14 = "1" ; bit13 = "0";break;		
	    		}
	    		
	    		if(mnemnonic[1].equals("%S") || mnemnonic[1].equals("%D")){
		    		switch (mnemnonic[0]){
		    		case "incw" : bit_12to7 = "011111";break;
					case "decw" : bit_12to7 = "001110";break;
					case "notw" : bit_12to7 = "001101";break;
					case "negw" : bit_12to7 = "001111";break;
					case "jmp" : bit_12to7 = "001100"; break;
					case "je" : bit_12to7 = "001100"; break;
					case "jne" : bit_12to7 = "001100"; break;
					case "jg" : bit_12to7 = "001100"; break;
					case "jge" : bit_12to7 = "001100"; break;
					case "jl" : bit_12to7 = "001100"; break;
					case "jle" : bit_12to7 = "001100"; break;
					
		    		}
	    		}else{
	    			
	    			switch (mnemnonic[0]){
		    		case "incw" : bit_12to7 = "110111";break;
					case "decw" : bit_12to7 = "110010";break;
					case "notw" : bit_12to7 = "110001";break;
					case "negw" : bit_12to7 = "110011";break;
					case "jmp" : bit_12to7 = "110000"; break;
					case "je" : bit_12to7 = "110000"; break;
					case "jne" : bit_12to7 = "110000"; break;
					case "jg" : bit_12to7 = "110000"; break;
					case "jge" : bit_12to7 = "110000"; break;
					case "jl" : bit_12to7 = "110000"; break;
					case "jle" : bit_12to7 = "110000"; break;
		    		}
	    			
	    		}
	    						
	    	}else{
	    		
	    		
	    				
	    		if(mnemnonic.length == 4){   		
	    			
	    			if(mnemnonic[0].equals("subw") && mnemnonic[2].equals("$1")){
	    				bit13 = "0";
	    				bit14 = "1";
	    				bit_12to7 = "110010";
	    				
	    			
	    			}else{
		    			
		    			if (mnemnonic[1].equals("%A") || mnemnonic[2].equals("%A")){
		    	    		bit14 = "0";
		    	    	}else{
		    	    		bit14 = "1";
		    	    	}
		    	
		    	    	if (mnemnonic[1].equals("%D") || mnemnonic[2].equals("%D")){
		    	    		bit13 = "0";
		    	    	}else{
		    	    		bit13 = "1";
		    	    	}
	    			
	    			
	    	    	
		    	    	switch (mnemnonic[0]){   		
		    			case "addw" : bit_12to7 = "000010";break;
		    			case "subw" : bit_12to7 = "010011";break;
		    			case "rsubw" : bit_12to7 = "000111";break;  		
		    			case "andw" : bit_12to7 = "000000";break;
		    			case "orw" : bit_12to7 = "010101";break;
		    	    	}
	    	    	
	 	
	    			}
	    		}
	    		
	    		
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