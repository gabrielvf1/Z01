/**
 * Curso: Elementos de Sistemas
 * Arquivo: Assemble.java
 * Created by Luciano <lpsoares@insper.edu.br> 
 * Date: 04/02/2017
 *
 * 2018 @ Rafael Corsi
 */

package assembler;

import java.io.*;
import java.util.*;

/**
 * Faz a gera��o do c�digo gerenciando os demais m�dulos
 */
public class Assemble {
    private String inputFile;              // arquivo de entrada nasm
    File hackFile = null;                  // arquivo de sa�da hack
    private PrintWriter outHACK = null;    // grava saida do c�digo de m�quina em Hack
    boolean debug;                         // flag que especifica se mensagens de debug s�o impressas
    private SymbolTable table;             // tabela de s�mbolos (vari�veis e marcadores)

    /**
     * Retorna o c�digo bin�rio do mnem�nico para realizar uma opera��o de c�lculo.
     * @param  mnemnonic vetor de mnem�nicos "instru��o" a ser analisada.
     * @return Opcode (String de 7 bits) com c�digo em linguagem de m�quina para a instru��o.
     */
    public Assemble(String inFile, String outFileHack, boolean debug) throws IOException {
        this.debug = debug;
        inputFile  = inFile;
        hackFile   = new File(outFileHack);                      // Cria arquivo de sa�da .hack
        outHACK    = new PrintWriter(new FileWriter(hackFile));  // Cria sa�da do print para
                                                                 // o arquivo hackfile
        table      = new SymbolTable();                          // Cria e inicializa a tabela de simbolos

    }

    /**
     * primeiro passo para a constru��o da tabela de s�mbolos de marcadores (labels)
     * varre o c�digo em busca de S�mbolos novos Labels e Endere�os de mem�rias
     * e atualiza a tabela de s�mbolos com os endere�os.
     *
     * Dependencia : Parser, SymbolTable
     */
    public void fillSymbolTable() throws FileNotFoundException, IOException {
    	Parser parser = new Parser(inputFile);  // abre o arquivo e aponta para o come�o
    	
    	while (parser.advance()){
    		if (parser.commandType(parser.command()) == Parser.CommandType.L_COMMAND){
    			String label_to_add = parser.label(parser.command());
    			//parser.instruction_index-=1;
    			table.addEntry(label_to_add, parser.instruction_index);
    			
    		}
    	}
    	
    }

    /**
     * Segundo passo para a gera��o do c�digo de m�quina
     * Varre o c�digo em busca de instru��es do tipo A, C
     * gerando a linguagem de m�quina a partir do parse das instru��es.
     *
     * Dependencias : Parser, Code
     */
    
    public void generateMachineCode() throws FileNotFoundException, IOException{
        Parser parser = new Parser(inputFile);  // abre o arquivo e aponta para o come�o
        
        while (parser.advance()){
        	String bit_15 = "0";
        	String machine_code = "";
        	String binary = "";
        	
        	
    		if (parser.commandType(parser.command()) == Parser.CommandType.A_COMMAND){
    			String comando = parser.command();
    			String simbolo = parser.symbol(comando);
    			int simbolo_int = -1;
    			try {  
    		         simbolo_int = Integer.parseInt(simbolo);  
    		         
    		      } catch (NumberFormatException e) {  
    		         
    		      }  
    			
    			if(simbolo_int !=-1){
    				binary =Code.toBinary( String.valueOf(simbolo_int));
    				machine_code = bit_15 + binary;
    				outHACK.println(machine_code);
    			}else{
	    			if (table.contains(simbolo)){  				
	    				binary =Code.toBinary( String.valueOf(table.getAddress(parser.symbol(parser.command()))));
	    				machine_code = bit_15 + binary;
	    				outHACK.println(machine_code);
	    				
	    			}else{
	    				
	    				int i=0;
	    				while (!table.containsValue(i)){
	    					i++;
	    				}
	    				
	    				//i -= 1; //arruma uma soma a mais
	    				table.addEntry(parser.symbol(parser.command()), i);
	    				binary =Code.toBinary(String.valueOf(i));
	    				machine_code = bit_15 + binary;
	    				outHACK.println(machine_code);
	    			
	    			}
    			}

    			
    		}else{
    			if (parser.commandType(parser.command()) == Parser.CommandType.C_COMMAND){
	//    			commando tipo C
	    			bit_15 = "1";
	    			binary = Code.comp( parser.instruction(parser.command())) + Code.dest( parser.instruction(parser.command())) + Code.jump( parser.instruction(parser.command()));
					machine_code = bit_15 + binary;
					outHACK.println(machine_code);
    			}
    		}
    	}
        

    }

    /**
     * Fecha arquivo de escrita
     */
    public void close() throws IOException {
        if(outHACK!=null) {
            outHACK.close();
        }
    }

    /**
     * Remove o arquivo de .hack se algum erro for encontrado
     */
    public void delete() {
        try{
            if(hackFile!=null) {
                hackFile.delete();
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

}