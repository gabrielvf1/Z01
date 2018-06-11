/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 * Created by Luciano Soares <lpsoares@insper.edu.br>
 * Date: 2/05/2017
 * Adaptado por Rafael Corsi <rafael.corsi@insper.edu.br>
 * Date: 5/2018
 */

package vmtranslator;

import java.util.*;
import java.io.*;
import java.nio.file.*;

/**
 * Traduz da linguagem vm para códigos assembly.
 */
public class Code {

    PrintWriter outputFile = null;  // arquivo .nasm de saída
    String filename = null;         // arquivo .vm de entrada
    int lineCode = 0;               // Linha do codigo vm que gerou as instrucoes
    int contadorELG = 0;

    /**
     * Abre o arquivo de saida e prepara para escrever
     * @param filename nome do arquivo NASM que receberá o código traduzido.
     */
    public Code(String filename) throws FileNotFoundException,IOException {
        File file = new File(filename);
        this.outputFile = new PrintWriter(new FileWriter(file));
    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para executar o comando aritmético.
     * @param  command comando aritmético a ser analisado.
     */
    public void writeArithmetic(String command) {

        if ( command.equals("")) {
            Error.error("Instrução invalida");
        }

        List<String> commands = new ArrayList<String>();

        	if(command.equals("add")) {
        	
            commands.add(String.format("; %d - ADD", lineCode++));
            
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%A");
            commands.add("decw %A");
            commands.add("movw (%A),%S");
            commands.add("decw %A");
            commands.add("addw (%A),%S,%D");
            commands.add("movw %D, (%A)");
            
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%D");
            commands.add("decw %D");
            commands.add("movw %D,(%A)");

        } else if (command.equals("sub")) {
            commands.add(String.format("; %d - SUB testando", lineCode++));      
            
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%A");
            commands.add("decw %A");
            commands.add("movw (%A),%S");
            commands.add("decw %A");
            commands.add("subw (%A),%S,%D");
            commands.add("movw %D, (%A)");
            
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%D");
            commands.add("decw %D");
            commands.add("movw %D,(%A)");
            
            
        } else if (command.equals("neg")) {
            commands.add(String.format("; %d - NEG", lineCode++));
            
            commands.add(("leaw $SP, %A" ));
            commands.add(("movw (%A), %A"));
            commands.add(("decw %A"));
            commands.add(("movw (%A), %D"));
            commands.add(("negw %D"));
            commands.add(("movw %D, (%A)"));
                    

        }else if (command.equals("eq")) {
                commands.add(String.format("; %d - EQ", lineCode++));

                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("movw (%A), %D");
                commands.add("decw %A");
                commands.add("subw (%A), %D, %S");
                commands.add("leaw $EQUALS"+(contadorELG)+", %A  ");
                commands.add("je %S");
                commands.add("nop");
                
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("decw %A");
                commands.add("movw %A, %D");
				commands.add("leaw $0,%A");
				commands.add("movw %A, %S");
				commands.add("movw %D, %A");
				commands.add("movw %S, (%A)");
				commands.add("leaw $END"+(contadorELG)+",%A");
				commands.add("jmp");
				commands.add("nop");
				
				commands.add("EQUAL"+(contadorELG)+":");
				commands.add("leaw $0,%A");
				commands.add("movw %A,%D");
				commands.add("decw %D");
				commands.add("leaw $SP,%A");
				commands.add("movw (%A), %A");
				commands.add("decw %A");
				commands.add("decw %A");
				commands.add("movw %D (%A)");
				commands.add("incw %A");
				commands.add("movw %A %D");
				commands.add("leaw $SP,%A");
				commands.add("movw %D,(%A)");
				commands.add("leaw $END2"+(contadorELG)+",%A");
				commands.add("jmp");
				commands.add("nop");
				
				commands.add("END"+(contadorELG)+":");
				commands.add("nop");
				commands.add("leaw $SP,%A");
				commands.add("movw (%A),%D");
				commands.add("decw %D");
				commands.add("movw %D,(%A)");
				commands.add("END2"+(contadorELG)+":");
                contadorELG+=1;
                
                
                
            } else if (command.equals("gt")) {
                commands.add(String.format("; %d - GT", lineCode++));
                
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("movw (%A), %D");
                commands.add("decw %A");
                commands.add("subw (%A), %D, %S");
                commands.add("leaw $GREATER"+(contadorELG)+", %A  ");
                commands.add("jg %S");
                commands.add("nop");
                
                commands.add("leaw $SP, %A");
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("decw %A");
                commands.add("movw %A, %D");
				commands.add("leaw $0,%A");
				commands.add("movw %A, %S");
				commands.add("movw %D, %A");
				commands.add("movw %S, (%A)");
				commands.add("leaw $END"+(contadorELG)+",%A");
				commands.add("jmp");
				commands.add("nop");
				
				commands.add("GREATER"+(contadorELG)+":");
				commands.add("leaw $0,%A");
				commands.add("movw %A,%D");
				commands.add("decw %D");
				commands.add("leaw $SP,%A");
				commands.add("movw (%A), %A");
				commands.add("decw %A");
				commands.add("decw %A");
				commands.add("movw %D (%A)");
				commands.add("incw %A");
				commands.add("movw %A %D");
				commands.add("leaw $SP,%A");
				commands.add("movw %D,(%A)");
				commands.add("leaw $END2"+(contadorELG)+",%A");
				commands.add("jmp");
				commands.add("nop");
				
				commands.add("END"+(contadorELG)+":");
				commands.add("nop");
				commands.add("leaw $SP,%A");
				commands.add("movw (%A),%D");
				commands.add("decw %D");
				commands.add("movw %D,(%A)");
				commands.add("END2"+(contadorELG)+":");
				contadorELG+=1;

        } else if (command.equals("lt")) {
            commands.add(String.format("; %d - LT", lineCode++));
            
            commands.add("leaw $SP, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("movw (%A), %D");
            commands.add("decw %A");
            commands.add("subw (%A), %D, %S");
            commands.add("leaw $LOWER"+(contadorELG)+", %A  ");
            commands.add("jl %S");
            commands.add("nop");
            
            commands.add("leaw $SP, %A");
            commands.add("movw (%A), %A");
            commands.add("decw %A");
            commands.add("decw %A");
            commands.add("movw %A, %D");
			commands.add("leaw $0,%A");
			commands.add("movw %A, %S");
			commands.add("movw %D, %A");
			commands.add("movw %S, (%A)");
			commands.add("leaw $END"+(contadorELG)+",%A");
			commands.add("jmp");
			commands.add("nop");
			
			commands.add("LOWER"+(contadorELG)+":");
			commands.add("leaw $0,%A");
			commands.add("movw %A,%D");
			commands.add("decw %D");
			commands.add("leaw $SP,%A");
			commands.add("movw (%A), %A");
			commands.add("decw %A");
			commands.add("decw %A");
			commands.add("movw %D (%A)");
			commands.add("incw %A");
			commands.add("movw %A %D");
			commands.add("leaw $SP,%A");
			commands.add("movw %D,(%A)");
			commands.add("leaw $END2"+(contadorELG)+",%A");
			commands.add("jmp");
			commands.add("nop");
			
			commands.add("END"+(contadorELG)+":");
			commands.add("nop");
			commands.add("leaw $SP,%A");
			commands.add("movw (%A),%D");
			commands.add("decw %D");
			commands.add("movw %D,(%A)");
			commands.add("END2"+(contadorELG)+":");
			contadorELG+=1;

        } else if (command.equals("and")) {
            commands.add(String.format("; %d - AND", lineCode++));
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%A");
            commands.add("decw %A");
            commands.add("movw (%A),%S");
            commands.add("decw %A");
            commands.add("andw (%A),%S,%D");
            commands.add("movw %D, (%A)");
            
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%D");
            commands.add("decw %D");
            commands.add("movw %D,(%A)");

        } else if (command.equals("or")) {
            commands.add(String.format("; %d - OR", lineCode++));
            
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%A");
            commands.add("decw %A");
            commands.add("movw (%A),%S");
            commands.add("decw %A");
            commands.add("orw (%A),%S,%D");
            commands.add("movw %D, (%A)");
            
            commands.add("leaw $SP,%A");
            commands.add("movw (%A),%D");
            commands.add("decw %D");
            commands.add("movw %D,(%A)");
        } else if (command.equals("not")) {
            commands.add(String.format("; %d - NOT", lineCode++));
            
            commands.add(("leaw $SP, %A" ));
            commands.add(("movw (%A), %A"));
            commands.add(("decw %A"));
            commands.add(("movw (%A), %D"));
            commands.add(("notw %D"));
            commands.add(("movw %D, (%A)"));
      

        }

        String[] stringArray = new String[ commands.size() ];
        commands.toArray( stringArray );
        write(stringArray);

    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para executar o comando de Push ou Pop.
     * @param  command comando de push ou pop a ser analisado.
     * @param  segment segmento de memória a ser usado pelo comando.
     * @param  index índice do segkento de memória a ser usado pelo comando.
     */
    public void writePushPop(Parser.CommandType command, String segment, Integer index) {

        if ( command.equals("")) {
            Error.error("Instrução invalida");
        }

        List<String> commands = new ArrayList<String>();

        if(command == Parser.CommandType.C_POP) {
            commands.add(String.format("; %d - POP %s %d", lineCode++ ,segment, index));

            if (segment.equals("constant")) {
                Error.error("Não faz sentido POP com constant");
            } else if (segment.equals("local")) {
                
                commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("movw (%A), %D"); // D tem o valor da pilha
                
                commands.add("leaw $LCL, %A");
            	commands.add("movw (%A), %S");          	
            	commands.add("leaw $" + index + ", %A");
            	commands.add("addw %S, %A, %S");
            	commands.add("movw %S, %A");
            	commands.add("movw %D, (%A)");  //move D para o local
            	
            	commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("movw %A, %D");
                commands.add("leaw $SP, %A" );
                commands.add("movw %D, (%A)");
                
                

            } else if (segment.equals("argument")) {
            	
            	commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("movw (%A), %D"); // D tem o valor da pilha
                
                commands.add("leaw $ARG, %A");
            	commands.add("movw (%A), %S");          	
            	commands.add("leaw $" + index + ", %A");
            	commands.add("addw %S, %A, %S");
            	commands.add("movw %S, %A");
            	commands.add("movw %D, (%A)"); 
            	
            	commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("movw %A, %D");
                commands.add("leaw $SP, %A" );
                commands.add("movw %D, (%A)");

            } else if (segment.equals("this")) {
            	commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("movw (%A), %D"); // D tem o valor da pilha
                
                commands.add("leaw $THIS, %A");
            	commands.add("movw (%A), %S");          	
            	commands.add("leaw $" + index + ", %A");
            	commands.add("addw %S, %A, %S");
            	commands.add("movw %S, %A");
            	commands.add("movw %D, (%A)");  
            	
            	commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("movw %A, %D");
                commands.add("leaw $SP, %A" );
                commands.add("movw %D, (%A)");

            } else if (segment.equals("that")) {
            	commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("movw (%A), %D"); // D tem o valor da pilha
                
                commands.add("leaw $THAT, %A");
            	commands.add("movw (%A), %S");          	
            	commands.add("leaw $" + index + ", %A");
            	commands.add("addw %S, %A, %S");
            	commands.add("movw %S, %A");
            	commands.add("movw %D, (%A)");  
            	
            	commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("movw %A, %D");
                commands.add("leaw $SP, %A" );
                commands.add("movw %D, (%A)");

            } else if (segment.equals("static")) {
            	commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("movw (%A), %D"); // D tem o valor da pilha
                
                commands.add("leaw $" + (16+index) + ", %A");
            	commands.add("movw %D, (%A)");  
            	
            	commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("movw %A, %D");
                commands.add("leaw $SP, %A" );
                commands.add("movw %D, (%A)");
            	

            } else if (segment.equals("temp")) {
            	
            	commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("movw (%A), %D"); // D tem o valor da pilha
                
                commands.add("leaw $" + (5+index) + ", %A");
            	commands.add("movw %D, (%A)");  
            	
            	commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("decw %A");
                commands.add("movw %A, %D");
                commands.add("leaw $SP, %A" );
                commands.add("movw %D, (%A)");
            	
            } else if (segment.equals("pointer")) {
                if(index==0) {
                	
                	commands.add("leaw $SP, %A" );
                    commands.add("movw (%A), %A");
                    commands.add("decw %A");
                    commands.add("movw (%A), %D"); // D tem o valor da pilha
                    
                    
                    
                	commands.add("leaw $3, %A");
                	commands.add("movw %D, (%A)");
                	
                    commands.add("leaw $SP, %A" );
                    commands.add("movw (%A), %A");
                    commands.add("decw %A");
                    commands.add("movw %A, %D");
                    commands.add("leaw $SP, %A" );
                    commands.add("movw %D, (%A)");
                	

                } else {
                	commands.add("movw (%A), %A");
                    commands.add("decw %A");
                    commands.add("movw (%A), %D"); // D tem o valor da pilha                  
                    
                	commands.add("leaw $4, %A");
                	commands.add("movw %D, (%A)");
                	
                    commands.add("leaw $SP, %A" );
                    commands.add("movw (%A), %A");
                    commands.add("decw %A");
                    commands.add("movw %A, %D");
                    commands.add("leaw $SP, %A" );
                    commands.add("movw %D, (%A)");

                }
            }
        } else if (command == Parser.CommandType.C_PUSH) {
            commands.add(String.format("; %d - PUSH %s %d", lineCode++ ,segment, index));

            if (segment.equals("constant")) {
            	
            	commands.add("leaw $" + index + ", %A");
            	commands.add("movw %A, %D");
            	commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("movw %D, (%A)");
                
                commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("incw %A");
                commands.add("movw %A, %D");
                commands.add("leaw $SP, %A" );
                commands.add("movw %D, (%A)");
                
            } else if (segment.equals("local")) {

            	commands.add("leaw $LCL, %A");
            	commands.add("movw (%A), %D");          	
            	commands.add("leaw $" + index + ", %A");
            	commands.add("addw %D, %A, %S");
            	commands.add("movw %S, %A");
            	commands.add("movw (%A), %S");
            	
            	commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("movw %S, (%A)");
        	
                commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("incw %A");
                commands.add("movw %A, %D");
                commands.add("leaw $SP, %A" );
                commands.add("movw %D, (%A)");
                
            } else if (segment.equals("argument")) {
            	 
            	commands.add("leaw $ARG, %A");
            	commands.add("movw (%A), %D");          	
            	commands.add("leaw $" + index + ", %A");
            	commands.add("addw %D, %A, %S");
            	commands.add("movw %S, %A");
            	commands.add("movw (%A), %S");
            	
            	commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("movw %S, (%A)");
        	
                commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("incw %A");
                commands.add("movw %A, %D");
                commands.add("leaw $SP, %A" );
                commands.add("movw %D, (%A)");
            	
            } else if (segment.equals("this")) {
            	
            	commands.add("leaw $THIS, %A");
            	commands.add("movw (%A), %D");          	
            	commands.add("leaw $" + index + ", %A");
            	commands.add("addw %D, %A, %S");
            	commands.add("movw %S, %A");
            	commands.add("movw (%A), %S");
            	
            	commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("movw %S, (%A)");
        	
                commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("incw %A");
                commands.add("movw %A, %D");
                commands.add("leaw $SP, %A" );
                commands.add("movw %D, (%A)");
                
            } else if (segment.equals("that")) {
            	
            	commands.add("leaw $THAT, %A");
            	commands.add("movw (%A), %D");          	
            	commands.add("leaw $" + index + ", %A");
            	commands.add("addw %D, %A, %S");
            	commands.add("movw %S, %A");
            	commands.add("movw (%A), %S");
            	
            	commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("movw %S, (%A)");
        	
                commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("incw %A");
                commands.add("movw %A, %D");
                commands.add("leaw $SP, %A" );
                commands.add("movw %D, (%A)");
                
            } else if (segment.equals("static")) {
            	
            	commands.add("leaw $" + (16+index) + ", %A");
            	commands.add("movw (%A), %D");
            	
            	commands.add("leaw $SP, %A" );
                commands.add("movw %A, %A");
                commands.add("movw %D, (%A)");
        	
                commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("incw %A");
                commands.add("movw %A, %D");
                commands.add("leaw $SP, %A" );
                commands.add("movw %D, (%A)");
                
            } else if (segment.equals("temp")) {
            	commands.add("leaw $" + (5+index) + ", %A");
            	commands.add("movw (%A), %D");
            	
            	commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("movw %D, (%A)");
        	
                commands.add("leaw $SP, %A" );
                commands.add("movw (%A), %A");
                commands.add("incw %A");
                commands.add("movw %A, %D");
                commands.add("leaw $SP, %A" );
                commands.add("movw %D, (%A)");
            } else if (segment.equals("pointer")) {
                if(index==0) {
                	
                	commands.add("leaw $3, %A");
                	commands.add("movw (%A), %D");
                	
                	commands.add("leaw $SP, %A" );
                    commands.add("movw (%A), %A");
                    commands.add("movw %D, (%A)");                   
            	
                    commands.add("leaw $SP, %A" );
                    commands.add("movw (%A), %A");
                    commands.add("incw %A");
                    commands.add("movw %A, %D");
                    commands.add("leaw $SP, %A" );
                    commands.add("movw %D, (%A)");
                	
                } else {
                	commands.add("leaw $4, %A");
                	commands.add("movw (%A), %D");
                	
                	commands.add("leaw $SP, %A" );
                    commands.add("movw (%A), %A");
                    commands.add("movw %D, (%A)");                   
            	
                    commands.add("leaw $SP, %A" );
                    commands.add("movw (%A), %A");
                    commands.add("incw %A");
                    commands.add("movw %A, %D");
                    commands.add("leaw $SP, %A" );
                    commands.add("movw %D, (%A)");

                }
            }
        }

        String[] stringArray = new String[ commands.size() ];
        commands.toArray( stringArray );
        write(stringArray);

    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para inicializar o processo da VM (bootstrap).
     * Também prepara a chamada para a função Sys.init
     * O código deve ser colocado no início do arquivo de saída.
     */
    public void writeInit(boolean bootstrap, boolean isDir) {

        List<String> commands = new ArrayList<String>();

        if(bootstrap || isDir)
            commands.add( "; Inicialização para VM" );

        if(bootstrap) {
            commands.add("leaw $256,%A");
            commands.add("movw %A,%D");
            commands.add("leaw $SP,%A");
            commands.add("movw %D,(%A)");
        }

        if(isDir){
            commands.add("leaw $Main.main, %A");
            commands.add("jmp");
            commands.add("nop");
        }

        if(bootstrap || isDir) {
            String[] stringArray = new String[commands.size()];
            commands.toArray(stringArray);
            write(stringArray);
        }
    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para gerar o labels (marcadores de jump).
     * @param  label define nome do label (marcador) a ser escrito.
     */
    public void writeLabel(String label) {

        List<String> commands = new ArrayList<String>();
        commands.add( "; Label (marcador)" );
        commands.add((filename) + "-"+ (label) + ":");
        System.out.println(label);
        
    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para gerar as instruções de goto (jumps).
     * Realiza um jump incondicional para o label informado.
     * @param  label define jump a ser realizado para um label (marcador).
     */
    public void writeGoto(String label) {
    	
        List<String> commands = new ArrayList<String>();
        
        commands.add(String.format("; %d - Goto Incondicional", lineCode++));
        commands.add("leaw $" + (filename) + "-"+ (label) + ", %A");
        //commands.add("decw %A");
        commands.add("jmp");
        commands.add("nop");
        //commands.add("movw %SP, %A");
        //commands.add("movw %D, (%A)");
    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para gerar as instruções de goto condicional (jumps condicionais).
     * Realiza um jump condicional para o label informado.
     * @param  label define jump a ser realizado para um label (marcador).
     */
    public void writeIf(String label) {

        List<String> commands = new ArrayList<String>();
        
        commands.add(String.format("; %d - Goto Condicional", lineCode++));
        commands.add("leaw $SP,%A");
        commands.add("movw (%A),%D");
        commands.add("leaw $0,%A");
        commands.add("negw %A");
        commands.add("subw %A,%D,%D");
        commands.add("leaw $" + (filename) + "-" + (label) + ", %A");
        commands.add("decw %A");
        commands.add("je %D");
        commands.add("nop");
     }

    /**
     * Grava no arquivo de saida as instruções em Assembly para uma chamada de função (Call).
     * @param  functionName nome da função a ser "chamada" pelo call.
     * @param  numArgs número de argumentos a serem passados na função call.
     */
    public void writeCall(String functionName, Integer numArgs) {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - chamada de funcao %s", lineCode++, functionName));
        
        //push return-address
        commands.add("leaw $SP,%A");
        commands.add("movw (%A),%S");
        commands.add("leaw $SP,%A");
        commands.add("movw (%A),%A");
        commands.add("incw %A");
        commands.add("movw %S,(%A)");


        //push LCL
        commands.add("incw %S");
        commands.add("leaw $R1,%A");
        commands.add("movw (%A),%S");


        //push ARG
        commands.add("incw %S");
        commands.add("leaw $R2,%A");
        commands.add("movw (%A),%S");


        //push THIS
        commands.add("incw %S");
        commands.add("leaw $R3,%A");
        commands.add("movw (%A),%S");


        //push THAT
        commands.add("incw %S");
        commands.add("leaw $R4,%A");
        commands.add("movw (%A),%S");


        //LCL = SP
        commands.add("leaw $SP,%A");
        commands.add("movw (%A),%D");
        commands.add("leaw $R1,%A");
        commands.add("movw %D,%A");


        //ARG = SP-n-5
        commands.add("leaw $5,%A");
        commands.add("movw %A,%S");
        commands.add("leaw $"+(numArgs)+",%A");
        commands.add("incw %S, %A, %A");
        commands.add("subw %D, %A, %S");
        commands.add("leaw $R2,%A");
        commands.add("movw %S,%A");

        //goto f
        commands.add("leaw $" +(functionName)+ ",%A");
        commands.add("movw %A,%D");
        commands.add("jmp %D");
        commands.add("nop");
    }

    /**
     * Grava no arquivo de saida as instruções em Assembly para o retorno de uma sub rotina.
     */
    public void writeReturn() {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Retorno de função", lineCode++));
        
        // FRAME = LCL
        commands.add("leaw $R1,%A");
        commands.add("movw (%A),%S");

        //RET = *(FRAME-5)
        commands.add("movw %S,%D");
        commands.add("leaw $5,%A");
        commands.add("subw %D, %A, %D");

        //*ARG=pop()


        //SP=ARG+1 
        commands.add("leaw $R1,%A");
        commands.add("movw (%A),%S");
        commands.add("incw %S");
        commands.add("leaw $R0,%A");
        commands.add("movw %S,%A");


        //THAT = *(FRAME-1)
        commands.add("leaw $1,%A");
        commands.add("subw %S, %A, %S");
        commands.add("leaw $R4,%A");
        commands.add("movw %S,%A");


        //THIS = *(FRAME-2)
        commands.add("leaw $2,%A");
        commands.add("subw %S, %A, %S");
        commands.add("leaw $R3,%A");
        commands.add("movw %S,%A");


        //ARG = *(FRAME-3)
        commands.add("leaw $3,%A");
        commands.add("subw %S, %A, %S");
        commands.add("leaw $R2,%A");
        commands.add("movw %S,%A");


        //LCL = *(FRAME-4)
        commands.add("leaw $4,%A");
        commands.add("subw %S, %A, %S");
        commands.add("leaw $R1,%A");
        commands.add("movw %S,%A");


        //goto RET
        commands.add("jmp %D");
        commands.add("nop");
    }


    /**
     * Grava no arquivo de saida as instruções em Assembly para a declaração de uma função.
     * @param  functionName nome da função a ser criada.
     * @param  numLocals número de argumentos a serem passados na função call.
     */
    public void writeFunction(String functionName, Integer numLocals) {

        List<String> commands = new ArrayList<String>();
        commands.add(String.format("; %d - Declarando função %s", lineCode++, functionName));
        commands.add((filename) + "-"+(functionName)+":");
        int i=numLocals;
        while (i>0){
        	writePushPop(Parser.CommandType.C_PUSH, "constant", 0);
            i-=1;
        }

    }

    /**
     * Armazena o nome do arquivo vm de origem.
     * Usado para definir os dados estáticos do código (por arquivo).
     * @param file nome do arquivo sendo tratado.
     */
    public void vmfile(String file) {

        int i = file.lastIndexOf(File.separator);
        int j = file.lastIndexOf('.');
        this.filename = file.substring(i+1,j);

    }

    // grava as instruções em Assembly no arquivo de saída
    public void write(String[] stringArray) {
        // gravando comandos no arquivos
        for (String s: stringArray) {
            this.outputFile.println(s);
        }
    }

    // fecha o arquivo de escrita
    public void close() throws IOException {
        this.outputFile.close();
    }

		}