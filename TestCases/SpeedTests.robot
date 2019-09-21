*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://demowebshop.tricentis.com/register
${BROWSER}  Chrome
${PROXY}   --proxy-server=http:127.0.0.1:12333


*** Test Cases ***
RegTest
    open browser    ${URL}  ${BROWSER}  ${PROXY}
    maximize browser window


    ${speed}=   get selenium speed
    log to console  ${speed}
    # set selenium speed  能使操作的每一步都等待设定好的时间-比如下面的2秒
    set selenium speed  2 seconds
    ${speed}=   get selenium speed
    log to console  ${speed}
    select radio button     Gender  M
    input text  name:FirstName  Yang
    input text  name:LastName   Dust
    input text  name:Email  dust@gmail.com
    input text  name:Password   test123
    input text  name:ConfirmPassword    test123

    sleep  3
    close browser