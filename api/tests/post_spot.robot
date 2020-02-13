*** Settings ***
Library     OperatingSystem

Resource    ../resources/services.robot

Suite Setup     Get Token jacques@teste.com

*** Test Cases ***
Create a new Spot
    &{payload}=                 Create Dictionary   company=Google  techs=java, golang  price=50
    Remove Spot By Company      Google
    ${thumb}=                   google.jpg
    ${response}=                Save Spot  ${payload}  ${thumb}
    ${code}=                    Convert To String      ${response.status_code}
    Should Be Equal             ${code}     200

Empty Company
    &{payload}=                        Create Dictionary      company=${EMPTY}    techs=java, golang  price=50
    ${response}=                       Save Spot   ${payload}  google.jpg
    ${code}=                           Convert To String      ${response.status_code}
    Should Be Equal                    ${code}     412
    ${business_code}=                  Convert To Integer      1001
    # Testa contrato
    Should Be Equal                    ${response.json()['code']}              ${business_code} 
    # Testa que tem info, mas não contrato
    Dictionary Should Contain Value    ${response.json()}      ${business_code}
    Dictionary Should Contain Value    ${response.json()}      Company is required

Empty Technologies
    &{payload}=     Create Dictionary      Teste    techs=${EMPTY}  price=50
    &{response}=    Save Spot              ${payload}  google.jpg
    ${code}=        Convert To String      ${response.status_code}
    Should Be Equal                        ${code}     412
    Should Be Equal                        ${response.json()['code']}              ${business_code} 
    Dictionary Should Contain Value        ${response.json()}      ${business_code}
    Dictionary Should Contain Value        ${response.json()}      Technologies is required

Empty Thumbnail
    &{payload}=          Create Dictionary      Teste    techs=${EMPTY}  price=50
    &{response}=         Save Spot Without Image     ${payload}
    ${code}=             Convert To String      ${response.status_code}
    Should Be Equal      ${code}     412
