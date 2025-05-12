*** Settings ***
Documentation    https://marketsquare.github.io/robotframework-difflibrary/
...    https://github.com/MarketSquare/robotframework-difflibrary
...    Instale: "pip install -U robotframework-difflibrary"

Resource    ../keywords/diff_library/diff_library.robot
Resource    ../keywords/database_Library/library_database.robot

*** Test Cases ***

Comparar Arquivos
    [Tags]    diff
    ${file1}    Monta path do arquivo    arquivo_TEXTO.txt
    ${file2}    Monta path do arquivo    arquivo_TEXTO_2.txt
    Compare file    ${file1}    ${file2}