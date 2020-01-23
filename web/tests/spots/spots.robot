*** Settings ***
Documentation   Sessao
...     Para que eu possa disponibilizar spots para locação
...     Sendo um administrador de spots
...     Quero poder cadastrar novas empresas
Resource            ../../resources/spot_steps.robot

Test Setup          Run Keywords       Dado que estou logado como Admin 
Test Teardown       Fechar navegador

*** Test Cases ***

Novo Spot BDD
    E que eu tenho um spot disponivel na empresa "Google"
    E este spot possui a imagem "google.jpg"
    E usamos as seguintes tecnologias "java, golang, c"
    E o valor da diaria e de "10" reais
    Quando eu faço o cadastro deste spot
    Entao devo ver o spot e valor da diaria no dashboard
