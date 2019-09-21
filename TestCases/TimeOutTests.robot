*** Settings ***
Library  SeleniumLibrary
Suite Teardown    Close All Browsers

*** Variables ***
${URL}  https://demowebshop.tricentis.com/register
${BROWSER}  Chrome
${PROXY}   --proxy-server=http:127.0.0.1:12333

*** Keywords ***
Open Chrome
    [Arguments]    ${url}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-extensions
#    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
#    Call Method    ${chrome_options}    add_argument    ${PROXY}   # 目前不能这样使用proxy
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To    ${url}

*** Test Cases ***
RegTest
#    open browser  ${URL}    ${browser}
    Open Chrome  ${URL}
    maximize browser window

    set selenium timeout  10 seconds    #可以使用这种方法设置timeout的🌍时间，也可以像下面那样直接加参数
    wait until page contains  Registere     timeout=3      # defautl 5 secs

    select radio button     Gender  M
    input text  name:FirstName  Yang
    input text  name:LastName   Dust
    input text  name:Email  dust@gmail.com
    input text  name:Password   test123
    input text  name:ConfirmPassword    test123

    sleep  3
    close browser