*** Settings ***
Library   SeleniumLibrary

*** Test Cases ***
TC1 Link and Partial Link Font Check
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.nasscom.in/nasscom-membership
    # click on calculate fee
    # when using link or partial link - use the font present on the UI
    # better use xpath - //a[text()='Calculate Fee'] when different font in html and UI
    Scroll Element Into View    link=CALCULATE FEE
    Click Element    link=CALCULATE FEE

TC2 Javascript alert
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.nasscom.in/nasscom-membership
    # click on calculate fee
    Scroll Element Into View    id=calculate-fee
    Click Element    id=calculate-fee
    ${actual_alert_text}     Handle Alert    action=ACCEPT    timeout=20s
    Log To Console    ${actual_alert_text}
    Log    ${actual_alert_text}
    Should Be Equal As Strings    ${actual_alert_text}    Please enter the total revenue greater than ZERO.
    [Teardown]    Close Browser


TC3 Javascript alert
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.nasscom.in/nasscom-membership
    # click on calculate fee
    Scroll Element Into View    id=calculate-fee
    Click Element    id=calculate-fee
    Alert Should Be Present    text=Please enter the total revenue greater than ZERO.    action=ACCEPT
    [Teardown]    Close Browser