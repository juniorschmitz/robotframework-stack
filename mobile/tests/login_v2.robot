*** Settings ***
Resource      ../resources/android.robot

Test Setup      Abrir App
Test Teardown   Fechar App

*** Test Cases ***
Login no APP
  Login With  jacques@test.com   Ruby, Python
  Should appear on spots session   Ruby
  Should appear on spots session   Nodejs

*** Keywords ***
Login With
  [Arguments]   ${email}    ${techs}
  Wait Until Page Contains        SEU E-MAIL    ${waitTime}
  Input Text                      accessibility_id=emailInput     ${email}
  Input Text                      accessibility_id=techsInput     ${techs}
  Click Text                      Encontrar Spots

Should appear on spots session
  [Arguments]   ${tech}
  Wait Until Page Contains        Epresas que usam ${tech}     ${waitTime}