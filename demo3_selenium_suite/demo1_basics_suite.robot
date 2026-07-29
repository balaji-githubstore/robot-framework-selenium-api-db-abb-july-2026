*** Settings ***
Library   SeleniumLibrary

*** Test Cases ***
TC1 Launch Browser and Title
    Open Browser    browser=chrome
    Go To    url=https://www.google.com/
    # get title and print 
    ${actual_title}     Get Title
    Log To Console    ${actual_title}
    Should Be Equal As Strings    ${actual_title}    Google
    
    Title Should Be    Google


TC2 Valid Book Demo
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://orangehrm.com/book-a-free-demo
    Click Element    id=CybotCookiebotDialogBodyLevelButtonLevelOptinAllowAll
    # Input Text    locator=id:Form_getForm_FullName    text=John wick
    # Input Text    locator=id=Form_getForm_FullName    text=John wick
    # Input Text     id:Form_getForm_FullName   John wick
    Input Text     id=Form_getForm_FullName   John wick

TC3 Valid Book Demo
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://orangehrm.com
    Click Element    id=CybotCookiebotDialogBodyLevelButtonLevelOptinAllowAll
    Click Element    link=Book a Free Demo
    Input Text     id=Form_getForm_FullName   John wick
    Input Text     id=Form_getForm_Email    john@gmail.com
    Select From List By Label    id=Form_getForm_Country    India
    Input Text    id=Form_getForm_CompanyName    ABB
    Input Text    name=JobTitle    QA Lead
    # select employee --> 51 to 200
    Select From List By Index    id=Form_getForm_NoOfEmployees    3
    Click Element    id=Form_getForm_action_submitForm

TC4
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.medibuddy.in/
    # Click on Login
    Click Element    link=Login
    # Input Text    id=phone    89898989

TC5 Task
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://medibuddy.in
    Click Element    link=Login
    Click Element    xpath=//div[text()='I have a Corporate Account']


*** Comments ***
Task 1
1.	Navigate onto https://www.medibuddy.in/
2.	Close if any popup and Click on Login
3.	Click on I have Corporate Account 
4.	Click on Learn More
5.	Click on Skip
6.	Click on Login using Username & Password
7.	Enter username as john 
8.	Enter password as john123 
9.	Click on show password 
10.	Click log in 
11.	 Get the error message shown and print it in terminal  

    
    
