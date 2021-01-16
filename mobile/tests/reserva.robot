*** Settings ***
Resource      ../resources/android.robot
Resource      ../resources/reserva_gherkin.robot

Test Setup      Abrir App
Test Teardown   Fechar App

*** Test Cases ***
# using Gherkin
Solicitar reserva de Spots V2
  Dado que existem 4 spots cadastrados para o usuário "lalala@teste.com"
  Quando eu acesso o app com o meu email "usuario@testzao.com"
  Quando eu solicito uma reserva na empresa "Google"
  Então devo ver a mensagem de sucesso "Solicitação de reserva enviada."

# At this scenario, we could put the login steps inside the shared android.robot resources, and use the Gherkin as Keywords not to repeat code
Solicitar Reserva
  Wait Until Page Contains          SEU E-MAIL    ${waitTime}
  Input Text                        accessibility_id=emailInput     jacques2323@test.com
  Input Text                        accessibility_id=techsInput     Cobol
  Click Text                        Encontrar Spots

  Wait Until Page Contains          Epresas que usam Cobol     ${waitTime}
  Swipe By Percent                  85  25  15  25  500
  Wait Until Page Contains          Google
  # Finds Google, goes to the parent (all spot) and then find the button Solicitar reserva
  Click Element                     xpath=//*[@text='Google']/..//*[@text='Solicitar reserva']

  Wait Until Page Contains Element  accessibility_id=dateInput
  Input Text                        accessibility_id=dateInput  20/02/2020
  Click Text                        Solicitar reserva
  
  Wait Until Page Contains Element  id=android:id/alertTitle
  ${message}=                       Get Text  id=android:id/alertTitle
  Should Be Equal                   ${message}  Solicitação de reserva enviada.

  # //*[@text='Solicitar reserva']
  # //*[@text='Google']

  # https://percentagecal.com/answer/1345-is-what-percent-of-1440
