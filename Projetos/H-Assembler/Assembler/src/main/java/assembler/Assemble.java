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
 * Faz a geração do código gerenciando os demais módulos
 */
public class Assemble {
    private String inputFile;              // arquivo de entrada nasm
    File hackFile = null;                  // arquivo de saída hack
    private PrintWriter outHACK = null;    // grava saida do código de máquina em Hack
    boolean debug;                         // flag que especifica se mensagens de debug são impressas
    private SymbolTable table;             // tabela de símbolos (variáveis e marcadores)

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public Assemble(String inFile, String outFileHack, boolean debug) throws IOException {
        this.debug = debug;
        inputFile  = inFile;
        hackFile   = new File(outFileHack);                      // Cria arquivo de saída .hack
        outHACK    = new PrintWriter(new FileWriter(hackFile));  // Cria saída do print para
                                                                 // o arquivo hackfile
        table      = new SymbolTable();                          // Cria e inicializa a tabela de simbolos

    }

    /**
     * primeiro passo para a construção da tabela de símbolos de marcadores (labels)
     * varre o código em busca de Símbolos novos Labels e Endereços de memórias
     * e atualiza a tabela de símbolos com os endereços.
     *
     * Dependencia : Parser, SymbolTable
     */
    public void fillSymbolTable() throws FileNotFoundException, IOException {
    	Parser parser = new Parser(inputFile);  // abre o arquivo e aponta para o começo
    	
    	for(int i = 0; i < parser.label_content.size();i++){
    		String label = parser.label_content.get(i);
    		String label_add = parser.label(label);
    		table.addEntry(label_add,parser.label_indexes.get(i));
    	}
    	
    }

    /**
     * Segundo passo para a geração do código de máquina
     * Varre o código em busca de instruções do tipo A, C
     * gerando a linguagem de máquina a partir do parse das instruções.
     *
     * Dependencias : Parser, Code
     */
    public void generateMachineCode() throws FileNotFoundException, IOException{
        Parser parser = new Parser(inputFile);  // abre o arquivo e aponta para o começo
        
        while (parser.advance()){
        	String bit_15 = "0";
        	String machine_code = "";
        	String binary = "";
        	
        	

    		if (parser.commandType(parser.command()) == Parser.CommandType.A_COMMAND){
    			String label = parser.symbol(parser.command());
            	          
				int label_int = -1;
            	
            	try {  
                    label_int = Integer.parseInt(label);  
                    
                 } catch (NumberFormatException e) {}  
    			
    			
    			if(label_int!=-1){
    				binary =Code.toBinary( String.valueOf(label_int));
    				machine_code = bit_15 + binary;
    				outHACK.println(machine_code);
    			}else{
	    			if (table.contains(parser.symbol(parser.command()))){
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