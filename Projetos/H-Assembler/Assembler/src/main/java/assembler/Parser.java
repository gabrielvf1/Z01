/**
 * Curso: Elementos de Sistemas
 * Arquivo: Parser.java
 */

package assembler;

import java.awt.List;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Encapsula o código de leitura. Carrega as instruções na linguagem assembly,
 * analisa, e oferece acesso as partes da instrução  (campos e símbolos).
 * Além disso, remove todos os espaços em branco e comentários.
 */
public class Parser {
	

	public ArrayList<String> parser_content;
	public int instruction_index = 0;
    /** Enumerator para os tipos de comandos do Assembler. */
    public enum CommandType {
        A_COMMAND,      // comandos LEA, que armazenam no registrador A
        C_COMMAND,      // comandos de calculos
        L_COMMAND       // comandos de Label (símbolos)
    }

    /**
     * Abre o arquivo de entrada NASM e se prepara para analisá-lo.
     * @param file arquivo NASM que será feito o parser.
     * @throws IOException 
     */
    public Parser(String file) throws IOException {
    	BufferedReader parser_file = new BufferedReader(new FileReader(file));
    	String line;
    	parser_content = new ArrayList<String>();
    	
    	while ((line = parser_file.readLine()) != null) {
    				if (line.contains(";")){
    					line = line.substring(0,line.indexOf(';'));	    				
    				}   									   	 
    			
    			while(line.startsWith(" ")){
    				line = line.substring(1);
    			}
    			while(line.endsWith(" ")){
    				line = line.substring(0,line.length()-1);
    			}
        		if (line.isEmpty() == false){
        			parser_content.add(line);
        		} 		
    	}
  
    	parser_file.close();
    	

    	
    }

    /**
     * Carrega uma instrução e avança seu apontador interno para o próxima
     * linha do arquivo de entrada. Caso não haja mais linhas no arquivo de
     * entrada o método retorna "Falso", senão retorna "Verdadeiro".
     * @return Verdadeiro se ainda há instruções, Falso se as instruções terminaram.
     */
    public Boolean advance() {
//    	System.out.println(instruction_index);
//    	System.out.println(parser_content.size());
    	
    	instruction_index +=1;
    	boolean resp =!(instruction_index -1  == parser_content.size());
    	return resp;
    }

    /**
     * Retorna o comando "intrução" atual (sem o avanço)
     * @return a instrução atual para ser analilisada
     */
    public String command() {
//    	System.out.println(parser_content);
    	String command = parser_content.get(instruction_index-1);
//    	System.out.println(parser_content.get(instruction_index-1).charAt(0));
    	return command;
    }

    /**
     * Retorna o tipo da instrução passada no argumento:
     *  A_COMMAND para leaw, por exemplo leaw $1,%A
     *  L_COMMAND para labels, por exemplo Xyz: , onde Xyz é um símbolo.
     *  C_COMMAND para todos os outros comandos
     * @param  command instrução a ser analisada.
     * @return o tipo da instrução.
     */
    public CommandType commandType(String command) {
    	String[] parts = command.split(" ");
    	
    	if (parts[0].equals("leaw")){
    		return Parser.CommandType.A_COMMAND;
    		
    	}else{
    		
    		if (command.charAt(command.length()-1) == ':'){  			
    			return Parser.CommandType.L_COMMAND;
    			
    		}else{   			
    			return Parser.CommandType.C_COMMAND;
    		}
    	}
    	
    }

    /**
     * Retorna o símbolo ou valor numérico da instrução passada no argumento.
     * Deve ser chamado somente quando commandType() é A_COMMAND.
     * @param  command instrução a ser analisada.
     * @return somente o símbolo ou o valor número da instrução.
     */
    public String symbol(String command) {
    	int comeca = command.indexOf('$');
    	int termina = command.indexOf(',');
    	return command.substring(comeca+1, termina);
    	
    }

    /**
     * Retorna o símbolo da instrução passada no argumento.
     * Deve ser chamado somente quando commandType() é L_COMMAND.
     * @param  command instrução a ser analisada.
     * @return o símbolo da instrução (sem os dois pontos).
     */
    public String label(String command) {
    	return command.substring(0, command.length()-1);
    }

    /**
     * Separa os mnemônicos da instrução fornecida em tokens em um vetor de Strings.
     * Deve ser chamado somente quando CommandType () é C_COMMAND.
     * @param  command instrução a ser analisada.
     * @return um vetor de string contento os tokens da instrução (as partes do comando).
     */
    public String[] instruction(String command) {
    	String [] mnemnonic = command.split(" |\\,");
    	return mnemnonic;
    }

}
