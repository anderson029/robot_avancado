*** Settings ***
Documentation   http://robotframework.org/robotframework/latest/libraries/Process.html
Library         Process
Resource    ../keywords/database_Library/library_database.robot

*** Test Cases ***
Exemplo 01: Abrindo programas
    Abra e feche o Notepad

Exemplo 02: Executando e aguardando scripts/programas
    Execute um script e aguarde ele finalizar com sucesso
    Execute um script e aguarde ele finalizar com falha

Exemplo 03: Execute comandos de prompt
    Executando comandos diversos de prompt

*** Keywords ***
Abra e feche o Notepad
    ## Inicia o processo e não espera por resposta dele
    ## Lembrete: Para caminhos no Windows use barras duplas!!
    ${MEU_PROCESSO}     Start Process    C:\\WINDOWS\\system32\\notepad.exe
    Sleep  3s
    Terminate Process   ${MEU_PROCESSO}   kill=True

Verifica sucesso na execução do processo
    [Arguments]      ${PROCESSO}
    ## RC igual a zero indica SUCESSO na execução do processo
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${PROCESSO.rc}    0
    ...   msg=ATENÇÃO! O seu processo não executou com sucesso
    ## Se ocorreu erro, vamos logar ele
    Run Keyword If   ${PROCESSO.rc}!=0   Log   FALHA OCORRIDA: "${PROCESSO.stderr}"

Execute um script e aguarde ele finalizar com sucesso
    #.rc  # Retorna o código de retorno do processo
    #.stdout  # Retorna a saída padrão do processo
    #.stderr  # Retorna a saída de erro do processo
    #.kill()  # Encerra o processo
    # Log    PID do meu processo: ${MEU_PROCESSO.pid}e
    
    ${file}    Monta path do arquivo    hello_world.py
    ## Inicia o processo e espera pelo seu término
    ${MEU_PROCESSO}     Run Process     python   ${file}    cwd=${CURDIR}    shell=True
  
    Log    Resultado da execução (sucesso/falha): ${MEU_PROCESSO.rc} 
    Log    Saída da execução: ${MEU_PROCESSO.stdout}
    Verifica sucesso na execução do processo      ${MEU_PROCESSO}

Execute um script e aguarde ele finalizar com falha
    ${file}    Monta path do arquivo    hello_world_fail.py
    ## Inicia o processo e espera pelo seu término
    ${MEU_PROCESSO}     Run Process     python   ${file} 
    Log    Resultado da execução (sucesso/falha): ${MEU_PROCESSO.rc}
    Log    Saída da execução: ${MEU_PROCESSO.stdout}
    Log    Falha da execução: ${MEU_PROCESSO.stderr}
    Verifica sucesso na execução do processo      ${MEU_PROCESSO}

Executando comandos diversos de prompt
    ## Use o atributo shell=True para habilitar funções de shell,
    ## como criar um diretório, por exemplo
    Run Process    mkdir robot_teste   cwd=${CURDIR}   shell=True

