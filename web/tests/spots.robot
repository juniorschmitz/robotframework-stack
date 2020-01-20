*** Settings ***
Documentation   Sessao
...     Para que eu possa disponibilizar spots para locação
...     Sendo um administrador de spots
...     Quero poder cadastrar novas empresas
Resource            ../resources/steps.robot

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

Spot sem o nome da empresa
    E que eu tenho um spot disponivel na empresa ""
    E este spot possui a imagem "acme.jpg"
    E usamos as seguintes tecnologias "java, golang, c"
    E o valor da diaria e de "10" reais
    Quando eu faço o cadastro deste spot
    Entao devo ver o alerta de erro "O nome da sua empresa é obrigatório!"
