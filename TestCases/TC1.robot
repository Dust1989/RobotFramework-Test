*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://demo.nopcommerce.com/
${BROWSER}  Chrome
${PROXY}   --proxy-server=http:127.0.0.1:12333

*** Test Cases ***
Loging Test
    Open Browser    ${URL}    ${BROWSER}    ${PROXY}
    loginToApplication
    close browser

*** Keywords ***
loginToApplication
    click link  xpath://a[@class='ico-login']
    input text  id:Email        pavanoltraining@gmail.com
    input text  id:Password     Test@123
    click element   xpath://input[@class='button-1 login-button']
    sleep  3