# 测试的结果是Ubuntu，开启了ssr的环境下，设置如下，不采用proxy也能访问


*** Settings ***
Library  SeleniumLibrary
Suite Teardown  Close All Browsers

*** Variables ***
${URL}  https://www.google.com
${BROWSER}  Chrome
${PROXY}    --proxy-server=http:127.0.0.1:12333

*** Test Cases ***
ProxyTest
    open browser  ${url}    ${browser}
    input text  name:q  robotframework
    click button  name:btnK
    sleep   3
    close browser

#ProxyTest_02
#    open chrome
#    go to   ${url}
#    input text  name:q  robotframework\n
##    click element  name:btnK
#    sleep   3
#    close browser

*** Keywords ***
open chrome
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-extensions
#    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
#    Call Method    ${chrome_options}    add_argument    ${PROXY}   # 目前不能这样使用proxy，经过测试在Ubuntu的环境下会自动使用系统的ssr的代理
    Create Webdriver    Chrome    chrome_options=${chrome_options}