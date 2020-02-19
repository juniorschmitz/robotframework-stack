*** Settings ***
Library     Collections
Library     RequestsLibrary
Library     OperatingSystem

Library     ./libs/mongo.py

*** Variables ***
${base_uri}     https://spotlab-api.herokuapp.com

*** Keywords ***
### /sessions
Post Session
    [Arguments]         ${payload}

    Create Session      spotapi     ${base_uri}
    
    &{headers}=         Create Dictionary      Content-Type=application/json
    ${response}=        Post Request   spotapi     /sessions   data=${payload}  headers=${headers}
   
    [return]            ${response}

Set Token
    [Arguments]     ${email}

    &{payload}      Create Dictionary       email= ${email}
    &{headers}=     Create Dictionary       Content-Type=application/json

    ${response}=    Post Session  ${payload}
    ${token}      Convert To String   ${response.json()['_id']}
    
    Set Suite Variable  ${token}

### /spots
Save Spot
    [Arguments]     ${payload}  ${thumb}

    Create Session  spotapi     ${base_uri}

    ${file_data}=       Get Binary File     ${CURDIR}/img/${thumb}
    &{files}=           Create Dictionary   thumbnail=${file_data}
    
    &{headers}=     Create Dictionary           user_id=${token}
    ${response}=    Post Request    spotapi     /spots  files=${files}  data=${payload}     headers=${headers}
    
    [return]        ${response}

Save Spot Without Image
    [Arguments]     ${payload}
    
    Create Session  spotapi     ${base_uri}
    
    &{headers}=     Create Dictionary   Content-Type=application/json   user_id=${token}
    ${response}=    Post Request    spotapi     /spots  data=${payload}     headers=${headers}
    
    [return]        ${response}
