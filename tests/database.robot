*** Settings ***
Documentation   [14/10/2019] https://franz-see.github.io/Robotframework-Database-Library/api/1.2.2/DatabaseLibrary.html
...             Instale: "pip install -U robotframework-databaselibrary"
...             Para acessar o BD o Robot precisa conhecer o DRIVER de cada banco, então precisamos instalar esse DRIVER também (instale apenas para o BD que você utiliza!) ...
...             Para PostgreSQL: "pip install psycopg2"
...             Para SQLite 3: não precisa instalar nada!
...             Para MySQL: "pip install pymysql"
...             Para SQL Server: "pip install pymssql"
...             Para Oracle: "pip install cx-Oracle"

Library         DatabaseLibrary
Library         OperatingSystem
Test Setup      Conectar no Banco de Dados
Test Teardown   Desconectar do Banco de Dados

*** Test Cases ***
Exemplo 01: Executando scripts SQL via Arquivos
    [Tags]    arquivo

    Drop table    account
    Executar script via ARQUIVO no Banco de Dados       create_table_accounts.sql 
    Executar script via ARQUIVO no Banco de Dados       insert_into_account.sql
    Confere se "Anderson" foi inserido com sucesso

Exemplo 02: Executando scripts SQL via STRING
    Limpar Tabela    account
    Executar script via STRING no Banco de Dados        INSERT INTO public.account(username, password, email) VALUES ('Oliveira', 'robot9878', 'robotizando8@robot.com')
    Confere se "Oliveira" foi inserido com sucesso

Exemplo 03: Select Statement
    ${RESPOSTA_SELECT}      Executar query no Banco de dados    SELECT * from account
    Log    ${RESPOSTA_SELECT}
    ## Para pegar um campo específico, utilize as tuplas [NUM_LINHA][NUM_COLUNA]
    Log    Usuário ${RESPOSTA_SELECT[0][0]} - Nome: ${RESPOSTA_SELECT[0][1]} - E-mail: ${RESPOSTA_SELECT[0][3]}
   
Exemplo 04: Limpando Tabelas
    Drop table    account
    Executar script via ARQUIVO no Banco de Dados       create_table_accounts.sql
    Limpar Tabela    account
    Executar script via STRING no Banco de Dados     DROP table account

*** Keywords ***

Monta path do arquivo
    [Arguments]     ${ARQUIVO}
    ${caminho_correto} =    Join Path    ${CURDIR}    ..    my_files    ${ARQUIVO}
    ${caminho_correto} =    Normalize Path    ${caminho_correto}  
    Log    Caminho final: ${caminho_correto}    
    File Should Exist    ${caminho_correto}
    RETURN    ${caminho_correto}

Conectar no Banco de Dados
    ## PostgreSQL
    # Connect To Database   dbapiModuleName=psycopg2   dbName=postgres   dbUsername=postgres   dbPassword=1234   dbHost=localhost   dbPort=5432
    Connect To Database   db_module=psycopg2   db_name=postgres  db_user=postgres   db_password=1234   db_host=localhost   db_port=5432
    ## SQLite 3
      # Connect To Database Using Custom Params   dbapiModuleName=sqlite3    db_connect_string=database="./${DBName}.db", isolation_level=None
    ## MySQL
      # Connect To Database   dbapiModuleName=pymysql   dbName=${DBName}   dbUsername=${DBUser}   dbPassword=${DBPass}   dbHost=${DBHost}   dbPort=${DBPort}
    ## SQL Server
      # Connect To Database   dbapiModuleName=pymssql   dbName=${DBName}   dbUsername=${DBUser}   dbPassword=${DBPass}   dbHost=${DBHost}   dbPort=${DBPort}	  
    ## Oracle
      # Connect To Database Using Custom Params    dbapiModuleName=cx_Oracle    db_connect_string="${DBName}/${DBUser}@${DBHost}:${DBPort}/${DBalias}"

Desconectar do Banco de Dados
    Disconnect From Database

Executar script via STRING no Banco de Dados
    [Arguments]          ${SCRIPT}

    Execute SQL String   ${SCRIPT}

Executar script via ARQUIVO no Banco de Dados
    [Arguments]          ${FILE}
    ${caminho_completo} =    Monta path do arquivo    ${FILE}
    Execute SQL Script   ${caminho_completo}

Executar query no Banco de dados
    [Arguments]         ${QUERY}
    ${RESPONSE_QUERY}   Query   ${QUERY}
    RETURN           ${RESPONSE_QUERY}

Confere se "${USER}" foi inserido com sucesso
    ${count}    Row Count    SELECT username FROM account WHERE username = '${USER}'
    Should Be True    ${count} > 0    msg=O usuário ${USER} não foi encontrado!
    
Limpar Tabela
    [Arguments]     ${TABELA}
    ${REGISTROS}    Row Count    SELECT * FROM ${TABELA}
    Run Keyword If  ${REGISTROS} > 0    Delete All Rows From Table    ${TABELA}

Drop table
    [Arguments]     ${TABELA}
    Execute SQL String    DROP TABLE IF EXISTS ${TABELA} CASCADE;