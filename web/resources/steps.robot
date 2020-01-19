*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
### Hooks
Abrir navegador
    Open Browser                    http://spotlab.herokuapp.com/       chrome
    Set Selenium Implicit Wait      10
Fechar navegador
    Capture Page Screenshot
    Close Browser

### Login   Steps
Dado que "#{email}" e o meu email
    Set Global Variable     ${email}

Quando eu entro com este email
    Input text                      id:email        ${email}
    Click Element                   css:button[type=submit]

Entao devo ver a area logada
    Sleep                           5
    Page Should Contain Element     class:dashboard

Entao devo ver o alerta "${expect_alert}"
    Element Text Should Be      class:alert     ${expect_alert}


###  Spot Steps
Dado que estou logado como Admin
    steps.Abrir navegador
    Input Text                  id: email       teste@batman.com
    Click Element               css: button[type=submit]

E que eu tenho um spot disponivel na empresa "${company}"
    Set Global Variable         ${company}

E este spot possui a imagem "${picture}"
    Set Global Variable         ${picture}

E usamos as seguintes tecnologias "${techs}"
    Set Global Variable         ${techs}

E o valor da diaria e de "${price}" reais
    Set Global Variable         ${price}

Quando eu faço o cadastro deste spot
    Click Link      /new
    Choose File     css:#thumbnail input        ${CURDIR}/img/${picture}
    Input Text      css:input[placeholder=*empresa]     ${company}
    Input Text      id:techs                            ${techs}
    Input Text      css:input[placeholder^=Valor]       ${price}
    Click Element   //button[contains(text(), 'Cadastrar')]        

Entao devo ver o spot e valor da diaria no dashboard
    Wait Until Element Is Visible       css:.spot-list li
    Element Should Contain              class:spot-list     ${company}
    Element Should Contain              class:spot-list     R$${price}/dia
