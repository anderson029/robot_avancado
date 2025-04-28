*** Keywords ***

Novo formato do FOR de listas
    FOR    ${animal}    IN    gato    cachorro    cavalo
        Log To Console    O animal desse laço é: ${animal}!
        Log To Console     Vamos para o próximo animal da lista...
    END