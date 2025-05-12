*** Settings ***
Documentation   [14/10/2019] https://franz-see.github.io/Robotframework-Database-Library/api/1.2.2/DatabaseLibrary.html
...             Instale: "pip install -U robotframework-databaselibrary"
...             Para acessar o BD o Robot precisa conhecer o DRIVER de cada banco, então precisamos instalar esse DRIVER também (instale apenas para o BD que você utiliza!) ...
...             Para PostgreSQL: "pip install psycopg2"
...             Para SQLite 3: não precisa instalar nada!
...             Para MySQL: "pip install pymysql"
...             Para SQL Server: "pip install pymssql"
...             Para Oracle: "pip install cx-Oracle"

Resource    ../keywords/database_Library/library_database.robot

Test Setup      Conectar no Banco de Dados
Test Teardown   Desconectar do Banco de Dados

*** Test Cases ***
Exemplo 01: Executando scripts SQL via Arquivos
    [Tags]    arquivo    sql

    Drop table    account
    Executar script via ARQUIVO no Banco de Dados       create_table_accounts.sql 
    Executar script via ARQUIVO no Banco de Dados       insert_into_account.sql
    Confere se "Anderson" foi inserido com sucesso

Exemplo 02: Executando scripts SQL via STRING
    [Tags]    string    sql

    Limpar Tabela    account
    Executar script via STRING no Banco de Dados        INSERT INTO public.account(username, password, email) VALUES ('Oliveira', 'robot9878', 'robotizando8@robot.com')
    Confere se "Oliveira" foi inserido com sucesso

Exemplo 03: Select Statement
    [Tags]    select    sql

    ${RESPONSE_QUERY}      Executar query no Banco de dados    SELECT * from account
    Log    ${RESPONSE_QUERY}
    ## Para pegar um campo específico, utilize as tuplas [NUM_LINHA][NUM_COLUNA]
    Log    Usuário ${RESPONSE_QUERY[0][0]} - Nome: ${RESPONSE_QUERY[0][1]} - E-mail: ${RESPONSE_QUERY[0][3]}
   
Exemplo 04: Limpando Tabelas
    [Tags]    limpar    sql
    Drop table    account
    Executar script via ARQUIVO no Banco de Dados       create_table_accounts.sql
    Limpar Tabela    account
    Executar script via STRING no Banco de Dados     DROP table account