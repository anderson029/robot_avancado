*** Keywords ***

### Usando várias variáveis
Cria dicionário de traduções
    FOR    ${index}    ${english}    ${finnish}    ${portugues}   IN
    ...     1           cat           kissa         gato
    ...     2           dog           koira         cachorro
    ...     3           horse         hevonen       cavalo
        Log To Console     Animal ${index}:\nEm inglês: ${english}\nEm finlandês: ${finnish}\nEm português: ${portugues}
    END