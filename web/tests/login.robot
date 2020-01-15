*** Settings ***
Documentation   Sessao
...     Para que eu possa ter acesso a interface de administraçao de spots
...     Sendo um usuario que possui um email
...     Quero poder iniciar um nova sessao
Resource        '../resources/steps.robot'

Test Setup          Abrir navegador
Test Teardown       Fechar navegador


*** Test Cases ***

Nova sessao
    Dado que "eu@papito.io" e o meu email
    Quando eu entro com este email
    Entao devo ver a area logada

Email incorreto
    [Template] Tentativa de login
    eu&batman.com

Email nao informado
    [Template] Tentativa de login
    ${EMPTY}

*** Keywords ***
Tentativa de login
    [Arguments]                         ${email}
    Dado que "${email}" e o meu email
    Quando eu entro com este email
    Entao devo ver o alerta "Oops. Informe um email válido!"