*** Variables ***

# Login Page
${INPUT_EMAIL}          id:email
${GENERAL_ALERT}        class:alert
${BTN_LOGIN}            css:button[type=submit]

# Spot Page
${DASHBOARD}            class:dashboard
${INPUT_FILE}           css:#thumbnail input
${INPUT_ENTERPRISE}     css:input[placeholder*=empresa]
${INPUT_TECHS}          id:techs
${INPUT_VALUE}          css:input[placeholder^=Valor] 
${BTN_REGISTER_SPOT}    //button[contains(text(), 'Cadastrar')]
${UL_SPOT_LIST}         class:spot-list
${LI_SPOT_ITEM}         css:.spot-list li
${ALERT_ERROR}          css:.alert-error
