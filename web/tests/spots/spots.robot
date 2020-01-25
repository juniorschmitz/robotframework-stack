*** Settings ***
Documentation   Sessao
...     Para que eu possa disponibilizar spots para locação
...     Sendo um administrador de spots
...     Quero poder cadastrar novas empresas
Resource            ../../resources/spot_steps.robot

Test Teardown       Fechar navegador

*** Test Cases ***

Novo Spot BDD
    Dado que estou logado como "batman@jacques.com"
    E que eu tenho um spot disponivel na empresa "Google"
    E este spot possui a imagem "google.jpg"
    E usamos as seguintes tecnologias "java, golang, c"
    E o valor da diaria e de "10" reais
    Quando eu faço o cadastro deste spot
    Entao devo ver o spot no dashboard
    E o valor da diaria "R$10/dia"

Novo Spot Gratuito
    Dado que estou logado como "batman@jacques.com"
    E que eu tenho um spot disponivel na empresa "Acme"
    E este spot possui a imagem "acme.jpg"
    E usamos as seguintes tecnologias "ruby, python"
    E nao vou cobrar a diaria
    Quando eu faço o cadastro deste spot
    Entao devo ver o spot no dashboard
    E o valor da diaria "GRATUITO"

Limite de spots
    [Tags]      todo
    Dado que estou logado como "jacques@spot.com"
    Mas eu ja tenho 4 spots cadastrados
    Quando acesso o dashboard
    Entao devo ver a seguinte mensagem "Voce pode cadastrar ate 4 spots"
