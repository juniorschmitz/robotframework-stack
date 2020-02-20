*** Settings ***
Library     OperatingSystem

Resource    ../../resources/services.robot

Suite Setup     Set Token   jacques@teste.com

*** Test Cases ***
Get Unique Spot
    Set Token           jacques@batmannn.com

    &{my_spot}=         Create Dictionary       company=Marvel Unique   techs=java  price=20    user=${token}
    
    ${spot_id}=         Insert Unique Spot      ${my_spot}

    Log To Console      ${spot_id}

    ${response}=        Get Spot By Id          ${spot_id}

    ${code}=            Convert To String       ${response.status_code}

    Should Be Equal     ${code}     200
    Dictionary Should Contain       ${response.json()}      ${my_spot.company}
