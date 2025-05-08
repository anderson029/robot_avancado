# robot_avancado
Estudo e automação de testes com robot framework avançado


Formas de executar o projeto
robot --outputdir results --include tabuada ./tests
robot -d ./results --i tabuada ./tests

#Exeeutar por casos de testes:
robot -d ./results --test "Exemplo 01: Criando arquivos" ./tests/operating_system.robot