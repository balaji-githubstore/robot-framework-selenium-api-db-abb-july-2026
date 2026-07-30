*** Settings ***
Library   SeleniumLibrary

Test Setup     Open Browser    browser=chrome
Test Teardown    Run Keywords    Close Browser   AND    Log To Console    done

*** Test Cases ***
TC1 Launch Browser and Title
    Go To    url=https://www.google.com/
    # get title and print 
    ${actual_title}     Get Title
    Log To Console    ${actual_title}
    Should Be Equal As Strings    ${actual_title}    Google
    
    Title Should Be    Google


TC2 Valid Book Demo
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://orangehrm.com/book-a-free-demo


TC3 Valid Book Demo
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://orangehrm.com


TC4
    # replace the test setup and teardown in settings 
    [Setup]    None
    Log To Console    hello
    [Teardown]   None


