*** Settings ***
Library   AppiumLibrary

# {
#   "platformName": "Android",
#   "deviceName": "Pixel 3",
#   "app": "C:\\work\\robotstack\\mobile\\tests\\app\\spotlab.apk",
#   "automationName": "uiautomator2",
#   "autoGrantPermissions": true
# }
# http://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html

*** Variables ***
${URL}                    http://localhost:4723/wd/hub
${platformName}           Android
${deviceName}             Pixel 3
${app}                    ${CURDIR}/app/spotlab.apk
${automationName}         uiautomator2
${autoGrantPermissions}   true
${waitTime}

*** Test Cases ***
Login no APP
  Abrir App
  Wait Until Page Contains        SEU E-MAIL    ${waitTime}
  Input Text                      accessibility_id=emailInput     jacques@test.com
  Input Text                      accessibility_id=techsInput     Ruby, Python
  Click Text                      Encontrar Spots
  Wait Until Page Contains        Epresas que usam Ruby     ${waitTime}
  Wait Until Page Contains        Epresas que usam Python   ${waitTime}
  Fechar App

*** Keywords ***
Abrir App
  Set Appium Timeout    30
  Open Application    ${URL}   platformName=${platformName}    deviceName=${deviceName}   app=${app}    automatioName=${automationName}   autograntPermissions=${autoGrantPermissions}

Fechar App
  Capture Page Screenshot
  Close Application