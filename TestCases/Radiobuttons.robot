*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}  Chrome
${URL}  https://www.practiceselenium.com/practice-form.html
${PROXY}   --proxy-server=http:127.0.0.1:12333

*** Test Cases ***
TestRadiobutton
    open browser    ${URL}  ${BROWSER}  ${PROXY}
    maximize browser window

    sleep   3
    # Selecting Radio buttons
    select radio button     sex     Female
    select radio button     exp     5

    # Selecting Check Box
    select checkbox     BlackTea
    select checkbox     RedTea

    sleep   2
    unselect checkbox   BlackTea

    sleep   3
    close browser