# calculatorasm
Calculadora em assembly

section .data
    result dd 0 ; variável para armazenar o resultado

section .text
    global _start

_start:
    mov eax, 5 ; primeiro operando
    mov ebx, 3 ; segundo operando
    add eax, ebx ; adiciona os operandos e armazena o resultado em eax
    mov [result], eax ; armazena o resultado em result
    ; o código a seguir pode ser usado para exibir o resultado em tela
    mov edx, 4 ; tamanho do resultado
    mov ecx, result ; endereço do resultado
    mov ebx, 1 ; stdout
    mov eax, 4 ; sys_write
    int 0x80 ; chama a função do sistema

O código acima usa as instruções de processador mov para mover os operandos para os registradores eax e ebx, e então usa a instrução add para adicioná-los. O resultado é armazenado novamente em eax, que é então armazenado na variável result na memória.

Para implementar as outras operações aritméticas, basta usar as instruções de processador apropriadas. Por exemplo, para subtração, podemos usar a instrução sub em vez de add.

Uma vez que o código estiver funcionando corretamente, podemos integrá-lo em um aplicativo de interface gráfica do usuário (GUI) para que os usuários possam usar a calculadora de maneira mais intuitiva. Isso pode incluir a criação de botões de entrada para cada operação e a exibição de resultados em uma área de saída.
