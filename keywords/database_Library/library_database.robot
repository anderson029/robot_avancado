*** Settings ***
Library         DatabaseLibrary
Library         OperatingSystem

*** Keywords ***
Monta path do arquivo
    [Arguments]     ${ARQUIVO}
    ${caminho_correto} =    Join Path    ${CURDIR}    ../..    my_files    ${ARQUIVO}
    ${caminho_correto} =    Normalize Path    ${caminho_correto}  
    Log    Caminho final: ${caminho_correto}    
    File Should Exist    ${caminho_correto}
    RETURN    ${caminho_correto}

Conectar no Banco de Dados
    ## PostgreSQL
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