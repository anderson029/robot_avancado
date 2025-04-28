*** Keywords ***

### FOR mais opções IN RANGE
Tradicional
    [Documentation]    Percorre de 1 até 10
    FOR    ${index}    IN RANGE    1    11
        Log To Console     ${index}
    END

Apenas quantidade de laços informada (limite superior)
    [Documentation]    Percorre de 0 até 9
    FOR    ${index}    IN RANGE    10
        Log To Console     ${index}
    END

Aritmético
    [Documentation]    Percorre de 0 até 5
    ${var}   Set Variable    ${5}
    FOR    ${index}    IN RANGE    ${var} + 1
        Log To Console     ${index}
    END

Intervalos específicos
    [Documentation]    Percorre de 0 até 30, pulando de 5 em 5
    FOR    ${index}    IN RANGE    0    31    5
        Log To Console     ${index}
    END
