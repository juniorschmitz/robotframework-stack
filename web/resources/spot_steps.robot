*** Settings ***
Resource     base.robot

*** Keywords ***
Dado que estou logado como "${email}"
    base.Abrir navegador
    Input Text                  ${INPUT_EMAIL}       ${email}
    Click Element               ${BTN_LOGIN}

Dado que estou logado como Admin
    base.Abrir navegador
    Input Text                  ${INPUT_EMAIL}       batman@teste.com
    Click Element               ${BTN_LOGIN}

E que eu tenho um spot disponivel na empresa "${company}"
    Set Global Variable         ${company}
    Remove Company              ${company}

E este spot possui a imagem "${picture}"
    Set Global Variable         ${picture}

E usamos as seguintes tecnologias "${techs}"
    Set Global Variable         ${techs}

E o valor da diaria e de "${price}" reais
    Set Global Variable         ${price}

E nao vou cobrar a diaria
    Set Global Variable         ${price}    0

Quando eu faço o cadastro deste spot
    Click Link          /new
    Run Keyword if      "${picture}"
    ...                 Choose File     ${INPUT_FILE}               ${CURDIR}/img/${picture}

    Input Text          ${INPUT_ENTERPRISE}                         ${company}
    Input Text          ${INPUT_TECHS}                              ${techs}
    Run Keyword if      ${price} > 0
    ...                 Input Text          ${INPUT_VALUE}                             ${price}

    Click Element       ${BTN_REGISTER_SPOT}

Entao devo ver o spot no dashboard
    Wait Until Element Is Visible       ${LI_SPOT_ITEM}
    Element Should Contain              ${UL_SPOT_LIST}       ${company}

E o valor da diaria "${value}"
    Element Should Contain              ${UL_SPOT_LIST}       ${value}

Entao devo ver o alerta de erro "${alert}"
    Wait Until Element Is Visible       ${ALERT_ERROR}
    Element Should Contain              ${ALERT_ERROR}           ${alert}

Mas eu ja tenho 4 spots cadastrados

Quando acesso o dashboard

Entao devo ver a seguinte mensagem "Voce pode cadastrar ate 4 spots"