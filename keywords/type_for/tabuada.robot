*** Settings ***
Library    Collections
*** Keywords ***

Gerando tabuada
    [Documentation]    Percorre de 1 até 10

    FOR    ${i}    IN RANGE    1    11
        Exibir Tabuada    ${i}   
    END

Exibir Tabuada
    [Arguments]    ${valor}
    Log To Console    \n======== TABUADA DO ${valor} ========
    @{linhas_tabuada}=    Calcular Tabuada    ${valor}
    Imprimir Resultados    @{linhas_tabuada}
    Log To Console    ==============================

Calcular Tabuada
    [Arguments]    ${valor}
    ${results}    Create List    
    FOR    ${counter}    IN RANGE    0    11  
        ${total}=    Evaluate    int(${valor}) * ${counter}
        ${formatting}=    Set Variable    ${valor} x ${counter} = ${total}
        Append To List    ${results}    ${formatting}   
    END
    RETURN   @{results}

Imprimir Resultados
    [Arguments]    @{linhas_tabuada}
    FOR    ${linha}    IN    @{linhas_tabuada}
        Log To Console    ${linha}
    END