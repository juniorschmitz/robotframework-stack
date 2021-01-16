*** Settings ***
Resource     base.robot

*** Keywords ***
Dado que "${email}" e o meu email
    Set Global Variable     ${email}

Quando eu entro com este email
    Input text                      ${INPUT_EMAIL}        ${email}
    Click Element                   ${BUTTON_LOGIN}

Entao devo ver a area logada
    Sleep                           5
    Page Should Contain Element     ${DIV_DASH}

Entao devo ver o alerta "${expect_alert}"
    Element Text Should Be      class:alert     ${expect_alert}