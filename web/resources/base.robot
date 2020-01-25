*** Settings ***
Library     SeleniumLibrary
Library     ./libs/mongo.py


Resource    pages/elements.robot
*** Keywords ***
Abrir navegador
    Open Browser                    about:blank       chrome
    Set Window Size                 1440  900
    Set Selenium Implicit Wait      10
    Go To                           http://spotlab.herokuapp.com/

Fechar navegador
    Capture Page Screenshot
    Close Browser

### Shared steps here if any
