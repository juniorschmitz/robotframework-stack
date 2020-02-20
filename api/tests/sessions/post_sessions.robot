*** Settings ***
Resource    ../../resources/services.robot

*** Test Cases ***
New Session
    [tags]      smoke
    &{payload}=      Create Dictionary      email=batman@jacques.com
    ${response}=     Post Session           ${payload}
    ${code}=         Convert To String      ${response.status_code}
    Should Be Equal     ${code}     200

Wrong Email
    &{payload}=      Create Dictionary      email=batman&jacques.com
    ${response}=     Post Session           ${payload}
    ${code}=         Convert To String      ${response.status_code}
    Should Be Equal     ${code}     409

Required Email
    &{payload}=      Create Dictionary      email=${EMPTY}
    ${response}=     Post Session           ${payload}
    ${code}=         Convert To String      ${response.status_code}
    Should Be Equal     ${code}     412

Without Data
    &{headers}=         Create Dictionary      Content-Type=application/json
    ${response}=     Post Request   spotapi     /sessions   headers=${headers}
    ${code}=         Convert To String           ${response.status_code}
    Should Be Equal     ${code}     412
