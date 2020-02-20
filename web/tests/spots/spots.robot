*** Settings ***
Documentation   Sessao
...     Para que eu possa disponibilizar spots para locação
...     Sendo um administrador de spots
...     Quero poder cadastrar novas empresas
Resource            ../../resources/spot_steps.robot
 
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Cases ***

Novo Spot BDD
    Dado que estou logado como Admin
    E que eu tenho um spot disponivel na empresa "Google"
    E este spot possui a imagem "google.jpg"
    E usamos as seguintes tecnologias "java, golang, c"
    E o valor da diaria e de "10" reais
    Quando eu faço o cadastro deste spot
    Entao devo ver o spot e valor da diaria no dashboard

Spot gratuito
    Dado que estou logado como "jacques@novobatman.com"
    E que eu tenho um spot disponivel na empresa "Acme"
    E este spot possui a imagem "acme.jpg"
    E usamos as seguintes tecnologias "ruby, python"
    Quando eu faço o cadastro deste spot
    Entao devo ver o spot no dashboard
    E o valor da diaria "GRATUITO"

Limite de spots
    [Tags]      todo
    Dado que a conta "jacques@google.com" possui 4 spots
    Quando acesso o dashboard
    Entao devo ver a seguinte mensagem "Você pode cadastrar até 4 spots"
