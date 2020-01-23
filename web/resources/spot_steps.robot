*** Settings ***
Resource     base.robot

*** Keywords ***
Dado que estou logado como Admin
    base.Abrir navegador
    Input Text                  id: email       teste@batman.com
    Click Element               css: button[type=submit]

E que eu tenho um spot disponivel na empresa "${company}"
    Set Global Variable         ${company}
    Remove Company              ${company}

E este spot possui a imagem "${picture}"
    Set Global Variable         ${picture}

E usamos as seguintes tecnologias "${techs}"
    Set Global Variable         ${techs}

E o valor da diaria e de "${price}" reais
    Set Global Variable         ${price}

Quando eu faço o cadastro deste spot
    Click Link          /new
    Run Keyword if      "${picture}"
    ...                 Choose File     css:#thumbnail input                        ${CURDIR}/img/${picture}
    Input Text          css:input[placeholder*=empresa]             ${company}
    Input Text          id:techs                                    ${techs}
    Input Text          css:input[placeholder^=Valor]               ${price}
    Click Element       //button[contains(text(), 'Cadastrar')]

Entao devo ver o spot e valor da diaria no dashboard
    Wait Until Element Is Visible       css:.spot-list li
    Element Should Contain              class:spot-list         ${company}
    Element Should Contain              class:spot-list         R$${price}/dia

Entao devo ver o alerta de erro "${alert}"
    Wait Until Element Is Visible       css:.alert-error
    Element Should Contain              css:.alert-error       ${alert}