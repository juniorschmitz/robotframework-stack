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

*** Keywords ***
## Hooks
Abrir App
  Set Appium Timeout    30
  Open Application    ${URL}   platformName=${platformName}    deviceName=${deviceName}   app=${app}    automatioName=${automationName}   autograntPermissions=${autoGrantPermissions}

Fechar App
  Capture Page Screenshot
  Close Application