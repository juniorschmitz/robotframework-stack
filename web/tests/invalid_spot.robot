*** Settings ***
Documentation   Invalid Spot
...     Para que eu possa disponibilizar spots para locação
...     Sendo um administrador de spots
...     Quero poder cadastrar novas empresas
Resource            ../resources/steps.robot

Test Setup      Run Keywords    Dado que estou logado como Admin
Test Teardown   Fechar navegador
Test Template   Invalid spot

*** Test Cases ***  thumbnail   company     techs           alert
Empty thumbnail     ${EMPTY}    Google      java, golang    Precisamos da foto da sua empresa!
Empty company       acme.jpg    ${EMPTY}    ruby, python    O nome da sua empresa é obrigatório!
Empty techs         acme.jpg    Google      ${EMPTY}        Informe pelo menos uma tecnologia :)

*** Keywords ***
Invalid spot
    [Arguments]     ${thumbnail}     ${company}     ${techs}     ${alert}

    E que eu tenho um spot disponivel na empresa "${company}"
    E este spot possui a imagem "${thumbnail}"
    E usamos as seguintes tecnologias "${techs}"
    E o valor da diaria e de "10" reais
    Quando eu faço o cadastro deste spot
    Entao devo ver o alerta de erro "${alert}"