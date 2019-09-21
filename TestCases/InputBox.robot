*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}  https://demo.nopcommerce.com/
${BROWSER}  Chrome
${PROXY}   --proxy-server=http:127.0.0.1:12333

*** Test Cases ***
TestingInputBox
    open browser    ${URL}    ${BROWSER}    ${PROXY}
    maximize browser window
    title should be     nopCommerce demo store
    click link  xpath://a[@class='ico-login']
    ${"email_text"}     set variable    id:Email

    element should be visible   ${"email_text"}
    element should be enabled   ${"email_text"}

    input text  ${"email_text"}     Dust@gmail.com
    sleep   5
    clear element text  ${"email_text"}
    sleep   3
    close browser







    



