*** Settings ***
Library     Collections
Library     RequestsLibrary
Library     OperatingSystem
Library     ./libs/mongo.py

*** Keywords ***
Dado que existem 4 spots cadastrados para o usuário "${email}"
  Set Token       ${email}
  Hard Reset      ${token}
  Save Spot List  my_spots.json

Quando eu acesso o app com o meu email "${email}"
  Wait Until Page Contains          SEU E-MAIL    ${waitTime}
  Input Text                        accessibility_id=emailInput     ${email}
  Input Text                        accessibility_id=techsInput     Cobol
  Click Text                        Encontrar Spots

Quando eu solicito uma reserva na empresa "${company}"
  Wait Until Page Contains          Epresas que usam Cobol     ${waitTime}
  Swipe By Percent                  85  25  15  25  500
  Wait Until Page Contains          ${company}
  Click Element                     xpath=//*[@text='${company}']/..//*[@text='Solicitar reserva']

Então devo ver a mensagem de sucesso "${message}"
  Wait Until Page Contains Element  id=android:id/alertTitle
  ${message_to_verify}=             Get Text  id=android:id/alertTitle
  Should Be Equal                   ${message}  ${message_to_verify}

Save Spot
    [Arguments]     ${payload}  ${thumb}
    Create Session  spotapi     ${base_uri}
    ${file_data}=       Get Binary File     ${CURDIR}/img/${thumb}
    &{files}=           Create Dictionary   thumbnail=${file_data}
    &{headers}=     Create Dictionary           user_id=${token}
    ${response}=    Post Request    spotapi     /spots  files=${files}  data=${payload}     headers=${headers}
    [return]        ${response}

Save Spot List
    [Arguments]     ${json_file}
    ${my_spots}=     Get File         resources/fixtures/${json_file}
    ${json}=         Evaluate         json.loads('''${my_spots}''')    json
    ${data}=         Set Variable     ${json['data']}

    :FOR    ${item}     IN      @{data}

    \       ${thumb}=           Get From Dictionary     ${item}         thumb
    \       ${payload}=         Get From Dictionary     ${item}         payload
    \       Save Spot           ${payload}      ${thumb}

Set Token
    [Arguments]     ${email}
    &{payload}      Create Dictionary       email= ${email}
    &{headers}=     Create Dictionary       Content-Type=application/json
    ${response}=    Post Session  ${payload}
    ${token}        Convert To String   ${response.json()['_id']}
    Set Suite Variable  ${token}