*** Settings ***

Library    Dialogs

Resource    ../keywords/type_for/for_aninhado.robot
Resource    ../keywords/type_for/for_inrange.robot
Resource    ../keywords/type_for/for_list.robot
Resource    ../keywords/type_for/for_tradicional.robot
Resource    ../keywords/type_for/for_variables.robot
Resource    ../keywords/type_for/tabuada.robot


*** Test Cases ***

Teste de FOR aninhado
    [Tags]    for_aninhado
    Cria cadastro de produtos (FOR aninhado)

Teste Tradicional
    [Tags]    range
    Tradicional
Teste com limite
    [Tags]    limite
    Apenas quantidade de laços informada (limite superior)

Teste com expressão
    [Tags]    expressao
    Aritmético

Teste com intervalo 
    [Tags]    intervalo
    Intervalos específicos

Teste FOR com numeração da lista
    [Tags]    for_list
    For com numeração

Teste do novo formato do FOR
    [Tags]    new_for
    Novo formato do FOR de listas

Teste FOR com numeração da lista
    [Tags]    for_list
    Cria dicionário de traduções

Tabuada do 0 ao 10
    [Tags]    tabuada_loop
    Gerando tabuada 

Tabuada de um valor
    [Tags]    tabuada
    ${numero}=    Get Value From User    Digite o valor da sua Tabuada:    1
  
    Exibir Tabuada    ${numero}