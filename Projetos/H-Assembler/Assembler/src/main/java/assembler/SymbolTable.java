/**
 * Curso: Elementos de Sistemas
 * Arquivo: SymbolTable.java
 */

package assembler;

import java.util.HashMap;
import java.util.Map;

/**
 * Mantém uma tabela com a correspondência entre os rótulos simbólicos e endereços numéricos de memória.
 */
public class SymbolTable {
	public int labels_num = -1;
	public Map<String, Integer> Table;
    /**
     * Cria a tabela de símbolos.
     */
    public SymbolTable() {
    	this.Table = new HashMap<String, Integer>();
    	Table.put("R0",0);
    	Table.put("R1",1);
    	Table.put("R2",2);
    	Table.put("R3",3);
    	Table.put("R4",4);
    	Table.put("R5",5);
    	Table.put("R6",6);
    	Table.put("R7",7);
    	Table.put("R8",8);
    	Table.put("R9",9);
    	Table.put("R10",10);
    	Table.put("R11",11);
    	Table.put("R12",12);
    	Table.put("R13",13);
    	Table.put("R14",14);
    	Table.put("R15",15);
    	Table.put("KBD",24576);
    	Table.put("SCREEN",16384);
    	Table.put("SP",0);
    	Table.put("LCL",1);
    	Table.put("ARG",2);
    	Table.put("THIS",3);
    	Table.put("THAT",4);
    }

    /**
     * Insere uma entrada de um símbolo com seu endereço numérico na tabela de símbolos.
     * @param  symbol símbolo a ser armazenado na tabela de símbolos.
     * @param  address símbolo a ser armazenado na tabela de símbolos.
     */
    public void addEntry(String symbol, int address) {
    	Table.put(symbol, address-labels_num);
    	labels_num+=1;
    }

    /**
     * Confere se o símbolo informado já foi inserido na tabela de símbolos.
     * @param  symbol símbolo a ser procurado na tabela de símbolos.
     * @return Verdadeiro se símbolo está na tabela de símbolos, Falso se não está na tabela de símbolos.
     */
    public Boolean contains(String symbol) {
    	
    	boolean existe=Table.containsKey(symbol);
    	if (existe) {
        	return true;
   	    } 
    	else {
   	       return false;
    	    }
    	}
    
    public Boolean containsValue(int symbol) {
    	
    	boolean existe=Table.containsValue(symbol);
    	if (existe) {
        	return true;
   	    } 
    	else {
   	       return false;
    	    }
    	}
    

    /**
     * Retorna o valor númerico associado a um símbolo já inserido na tabela de símbolos.
     * @param  symbol símbolo a ser procurado na tabela de símbolos.
     * @return valor numérico associado ao símbolo procurado.
     */
    public Integer getAddress(String symbol) {
    	return Table.get(symbol);
    }

}
