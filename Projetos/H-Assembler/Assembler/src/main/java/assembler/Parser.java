/**
 * Curso: Elementos de Sistemas
 * Arquivo: Parser.java
 */

package assembler;


import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import assembler.Parser.CommandType;

/**
 * Encapsula o c�digo de leitura. Carrega as instru��es na linguagem assembly,
 * analisa, e oferece acesso as partes da instru��o  (campos e s�mbolos).
 * Al�m disso, remove todos os espa�os em branco e coment�rios.
 */
public class Parser {
	

	public ArrayList<String> parser_content;
	public int instruction_index = 0;
    /** Enumerator para os tipos de comandos do Assembler. */
    public enum CommandType {
        A_COMMAND,      // comandos LEA, que armazenam no registrador A
        C_COMMAND,      // comandos de calculos
        L_COMMAND       // comandos de Label (s�mbolos)
    }

    /**
     * Abre o arquivo de entrada NASM e se prepara para analis�-lo.
     * @param file arquivo NASM que ser� feito o parser.
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
    			
    			while(line.startsWith(" ") || line.startsWith("\t") ){
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
     * Carrega uma instru��o e avan�a seu apontador interno para o pr�xima
     * linha do arquivo de entrada. Caso n�o haja mais linhas no arquivo de
     * entrada o m�todo retorna "Falso", sen�o retorna "Verdadeiro".
     * @return Verdadeiro se ainda h� instru��es, Falso se as instru��es terminaram.
     */
    public boolean advance() {
//    	System.out.println(instruction_index);
//    	System.out.println(parser_content.size());

    		instruction_index +=1;
    	
    	
    	
    	
    	boolean resp =!(instruction_index -1  == parser_content.size());
    	return resp;
    }

    /**
     * Retorna o comando "intru��o" atual (sem o avan�o)
     * @return a instru��o atual para ser analilisada
     */
    public String command() {
//    	System.out.println(parser_content);
    	String command = parser_content.get(instruction_index-1);
//    	System.out.println(parser_content.get(instruction_index-1).charAt(0));
    	return command;
    }

    /**
     * Retorna o tipo da instru��o passada no argumento:
     *  A_COMMAND para leaw, por exemplo leaw $1,%A
     *  L_COMMAND para labels, por exemplo Xyz: , onde Xyz � um s�mbolo.
     *  C_COMMAND para todos os outros comandos
     * @param  command instru��o a ser analisada.
     * @return o tipo da instru��o.
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
     * Retorna o s�mbolo ou valor num�rico da instru��o passada no argumento.
     * Deve ser chamado somente quando commandType() � A_COMMAND.
     * @param  command instru��o a ser analisada.
     * @return somente o s�mbolo ou o valor n�mero da instru��o.
     */
    public String symbol(String command) {
		int index_remove_command = command.indexOf(' ');
    	command = command.substring(index_remove_command+1);
    	
    	if(command.charAt(0)=='$'){	    		
	    	int comeca = command.indexOf('$');
	    	int termina = command.indexOf(',');
	    	return command.substring(comeca+1, termina);
    	}else{
    		int comeca = command.indexOf('%');
    		int termina = command.indexOf(',');
    		return command.substring(comeca+1, termina);
    	}
    	
    }

    /**
     * Retorna o s�mbolo da instru��o passada no argumento.
     * Deve ser chamado somente quando commandType() � L_COMMAND.
     * @param  command instru��o a ser analisada.
     * @return o s�mbolo da instru��o (sem os dois pontos).
     */
    public String label(String command) {
    	return command.substring(0, command.length()-1);
    }

    /**
     * Separa os mnem�nicos da instru��o fornecida em tokens em um vetor de Strings.
     * Deve ser chamado somente quando CommandType () � C_COMMAND.
     * @param  command instru��o a ser analisada.
     * @return um vetor de string contento os tokens da instru��o (as partes do comando).
     */
    public String[] instruction(String command) {
    	String [] mnemnonic = command.split(" |\\,");
    	
    	
    	List<String> list = new ArrayList<String>(Arrays.asList(mnemnonic));
		list.remove("");
		list.remove(" ");
		mnemnonic = list.toArray(new String[0]);
    	
    	
    	return mnemnonic;
    }

	

}