*** Settings ***
Library    ../keywords/MyCustomLibraries/Libraries/HashLibrary/geradorHash.py
Resource    ../keywords/database_Library/library_database.robot


*** Test Cases ***
Teste de conversão de string para HASH sha256
    Converter "Estou ficando ninja em Robot Framework!!" para sha256

Teste de conversão de arquivo para HASH sha256
    ${file}    Monta path do arquivo    arquivo_PDF.pdf
    Converter o arquivo "${file}" para sha256

*** Keywords ***
Converter "${CONTEUDO}" para sha256
    ${CONTEUDO_HASH}   Gerar Hash    ${CONTEUDO}
    Log   Converteu com o conteúdo: ${CONTEUDO_HASH}

Converter o arquivo "${FILE}" para sha256
    ${CONTEUDO_HASH}   Gerar Hash Arquivo   ${FILE}
    Log   Converteu com arquivo: ${CONTEUDO_HASH}
