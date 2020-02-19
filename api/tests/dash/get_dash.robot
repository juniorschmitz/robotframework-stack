*** Settings ***
Resource    ../../resources/services.robot

*** Test Cases ***
Get spots on Dashboard
    Set Token       jacques@batman.com
    Save Spot List   my_spots.json

    ${response}=    Get My Spots
    ${code}=         Convert To String      ${response.status_code}

    Should Be Equal         ${code}     200
    Log                     ${response.text}
    Should Not Be Empty     ${response.json()}
