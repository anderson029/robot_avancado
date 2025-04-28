*** Settings ***
# Tipo	            Escopo	            Quando                             Executa	Uso Típico
# Task Setup	    Tarefa completa	    Antes de QUALQUER execução	        Inicialização global (raro)
# Task Teardown	    Tarefa completa	    Após TODAS as execuções	            Finalização global (raro)
# Suite Setup	    Suite de testes	    Antes dos testes da suite	        Preparar ambiente para vários testes
# Suite Teardown	Suite de testes	    Após todos os testes da suite	    Limpeza geral da suite
# Test Setup	    Teste individual	Antes de cada teste	                Preparação específica do teste
# Test Teardown	    Teste individual	Após cada teste	                    Limpeza específica do teste

Resource    ../keywords/teardowns/teardowns.robot

Suite Teardown  Controlando o teardown da suite
Test Teardown   Controlando o teardown do teste


*** Test Cases ***
#### SUCESSO
Exemplo 01: Teste lidando com Suite e Test Teardowns
    Essa keyword fará o teste passar, não executando as keywords abaixo!
    #por conta da keyword acima as demmais não sera executadas
    Esse keyword vai passar sozinha!

Exemplo 02: Teste lidando com Suite e Test Teardowns
    Esse keyword vai passar sozinha!
    Esse aqui também vai passar com uma condição e vai parar de executar as keywords abaixo!
    Esse keyword vai passar sozinha!


#### FALHAS
Exemplo 03: Teste lidando com Suite e Test Teardowns
    Esse keyword vai passar sozinha!
    Essa keyword fará o teste falhar, não executando as keywords abaixo!
    Esse keyword vai passar sozinha!

Exemplo 04: Teste lidando com Suite e Test Teardowns
    Esse keyword vai falhar sozinha!

