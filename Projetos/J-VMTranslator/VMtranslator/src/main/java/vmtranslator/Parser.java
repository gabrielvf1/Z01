/**
 * Curso: Elementos de Sistemas
 * Arquivo: Parser.java
 * Created by Luciano Soares <lpsoares@insper.edu.br>
 * Date: 2/05/2017
 *
 * Adaptado por Rafael Corsi <rafael.corsi@insper.edu.br>
 * Date: 5/2018
 */
package vmtranslator;

import java.io.*;
import java.util.ArrayList;

/**
 * Encapsula o código de leitura. Carrega as instruções na linguagem de máquina
 * virtual a pilha, analisa, e oferece acesso aos comandos. Além disso, remove
 * todos os espaços em branco e comentários.
 */
public class Parser {

	public ArrayList<String> parser_content;
	public String currentCommand = ""; // comando atual
	private BufferedReader fileReader; // leitor de arquivo
	public int instruction_index = 0;
	
	
	public ArrayList<Integer> label_indexes;
	public ArrayList<String> label_content;

	/**
	 * Enumerator para os tipos de comandos de Linguagem de Máquina Virtua a
	 * Pilha.
	 */
	public static enum CommandType {
		C_ARITHMETIC, // comandos aritméticos
		C_PUSH, // comandos de push
		C_POP, // comandos de pop
		C_LABEL, // label
		C_GOTO, // comando goto
		C_IF, // comando if-goto
		C_FUNCTION, // declaracao de funcao
		C_RETURN, // retorno de funcao
		C_CALL // chamada de funcao
	}

	/**
	 * Abre o arquivo de entrada VM e se prepara para analisá-lo.
	 * 
	 * @param file
	 *            arquivo VM que será feito o parser.
	 * @throws IOException 
	 */
	public Parser(String file) throws IOException {
		this.fileReader = new BufferedReader(new FileReader(file));
    	String line;
    	parser_content = new ArrayList<String>();
    	label_content = new ArrayList<String>();
    	label_indexes = new ArrayList<Integer>();
    	
    	while ((line = fileReader.readLine()) != null) {
			if (line.contains("//")){
				line = line.substring(0,line.indexOf("//"));	    				
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

	}

	/**
	 * Carrega um comando e avança seu apontador interno para o próxima linha do
	 * arquivo de entrada. Caso não haja mais linhas no arquivo de entrada o
	 * método retorna "Falso", senão retorna "Verdadeiro".
	 * 
	 * @return Verdadeiro se ainda há instruções, Falso se as instruções
	 *         terminaram.
	 */
	public Boolean advance() throws IOException {
		boolean resp = !(instruction_index == parser_content.size());

		instruction_index += 1;
		return resp;
	}

	/**
	 * Retorna o comando "intrução" atual (sem o avanço)
	 * 
	 * @return a instrução atual para ser analilisada
	 */
	public String command() {
		String command = parser_content.get(instruction_index - 1);
		return command;
	}

	/**
	 * Retorna o tipo da instrução passada no argumento: C_PUSH para push, por
	 * exemplo push constant 1 C_POP para pop, por exemplo pop constant 2
	 * 
	 * @param command
	 *            instrução a ser analisada.
	 * @return o tipo da instrução.
	 */
	public CommandType commandType(String command) {
		String[] parts = command.split(" ");

		if (parts[0].equals("push")) {
			return Parser.CommandType.C_PUSH;
		} else if (parts[0].equals("return")) {
			return Parser.CommandType.C_RETURN;
		} else if (parts[0].equals("if-goto")) {
			return Parser.CommandType.C_IF;
		} else if (parts[0].equals("goto")) {
			return Parser.CommandType.C_GOTO;
		} else if (parts[0].equals("label")) {
			return Parser.CommandType.C_LABEL;
		} else if (parts[0].equals("function")) {
			return Parser.CommandType.C_FUNCTION;
		} else if (parts[0].equals("pop")) {
			return Parser.CommandType.C_POP;
		} else if (parts[0].equals("call")) {
			return Parser.CommandType.C_CALL;
		} else {
			if (parts[0].equals("add") || parts[0].equals("sub") || parts[0].equals("neg") || parts[0].equals("eq")
					|| parts[0].equals("gt") || parts[0].equals("lt") || parts[0].equals("and") || parts[0].equals("or")
					|| parts[0].equals("not")) {
				return Parser.CommandType.C_ARITHMETIC;
			}
		}
		return null;

	}

	/**
	 * Retorna o primeiro argumento de um comando push ou pop passada no
	 * argumento. Se for um comando aritmético, retorna o próprio texto do
	 * comando Deve ser chamado somente quando commandType() é diferente de
	 * C_RETURN.
	 * 
	 * @param command
	 *            instrução a ser analisada.
	 * @return somente o símbolo ou o valor número da instrução.
	 */
	public String arg1(String command) {
		String[] parts = command.split(" ");
		return parts[1];
	}

	/**
	 * Retorna o segundo argumento de um comando push ou pop passada no
	 * argumento. Deve ser chamado somente quando commandType() é C_PUSH, C_POP,
	 * C_FUNCTION, ou C_CALL.
	 * 
	 * @param command
	 *            instrução a ser analisada.
	 * @return o símbolo da instrução (sem os dois pontos).
	 */
	public Integer arg2(String command) {
		String[] parts = command.split(" ");
		return Integer.parseInt(parts[2]);
	}

	// fecha o arquivo de leitura
	public void close() throws IOException {
		fileReader.close();
	}

}