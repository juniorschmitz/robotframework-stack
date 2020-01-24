*** Settings ***
Library     Collections
Library     RequestsLibrary

*** Variables ***
${base_uri}     https://spotlab-api.herokuapp.com

*** Keywords ***
Post Session
    [Arguments]         ${payload}
    Create Session      spotapi     ${base_uri}
    &{headers}=         Create Dictionary      Content-Type=application/json
    ${response}=        Post Request   spotapi     /sessions   data=${payload}  headers=${headers}
    [return]            ${response}
