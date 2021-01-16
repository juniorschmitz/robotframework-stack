*** Settings ***
Resource      ../resources/android.robot

Test Setup      Abrir App
Test Teardown   Fechar App

*** Test Cases ***
Login no APP
  Quando eu faço login "jacques@test.com" e "Ruby, Python"
  Então devo ver "Ruby" na área de spots
  E devo ver "Nodejs" na área de spots

### The keywords that are here could  be in the android.robot file too, keeping only the test scenario in this file, much like Cucumber

*** Keywords ***
Quando eu faço login "${email}" e "${techs}"
  Wait Until Page Contains        SEU E-MAIL    ${waitTime}
  Input Text                      accessibility_id=emailInput     ${email}
  Input Text                      accessibility_id=techsInput     ${techs}
  Click Text                      Encontrar Spots

Então devo ver "${tech}" na área de spots
  Wait Until Page Contains        Epresas que usam ${tech}     ${waitTime}