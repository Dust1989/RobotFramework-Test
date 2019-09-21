*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}  Chrome
${PROXY}   --proxy-server=http:127.0.0.1:12333
${URL}  https://www.practiceselenium.com/practice-form.html


*** Test Cases ***
TestRadiobutton
    open browser    ${URL}  ${BROWSER}  ${PROXY}
    maximize browser window

    # for the dropdown box, dropdown box can not be unselect
    select from list by label  continents   Asia
    sleep  3
    select from list by index  continents   5
    sleep  2

    # for the list box
    select from list by label  selenium_commands    Browser Commands
    sleep   2
    select from list by label  selenium_commands    Navigation Commands
    sleep   2
    select from list by label  selenium_commands    Switch Commands
    sleep   2
    select from list by label  selenium_commands    Wait Commands
    sleep   2
    unselect from list by label  selenium_commands  Wait Commands

    sleep   3
    close browser