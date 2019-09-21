*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
RegTest
    open browser  http://demowebshop.tricentis.com/register     chrome
    maximize browser window

    set selenium implicit wait  5

    select radio button  Gender     M
    input text  name:FirstName1     Dust
    input text  name:LastName       Yang
    input text  name:Email      dust@gamil.com
    input text  name:Password   test123
    input text  name:ConfirmPassword    test123