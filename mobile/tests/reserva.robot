*** Settings ***
Resource      ../resources/android.robot

Test Setup      Abrir App
Test Teardown   Fechar App

*** Test Cases ***
Solicitar Reserva
  Wait Until Page Contains        SEU E-MAIL    ${waitTime}
  Input Text                      accessibility_id=emailInput     jacques@test.com
  Input Text                      accessibility_id=techsInput     Ruby, Python
  Click Text                      Encontrar Spots
  Wait Until Page Contains        Epresas que usam Ruby     ${waitTime}
  Wait Until Page Contains        Epresas que usam Python   ${waitTime}
