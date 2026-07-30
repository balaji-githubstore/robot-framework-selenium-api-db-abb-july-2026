*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
TC1 Upload
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.ilovepdf.com/pdf_to_word
    Choose File    xpath=//input[@type='file']    D:${/}Mine${/}Balaji Dinakaran Trainer Profile AI 2026.pdf

TC3 CSS Selector
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://orangehrm.com/book-a-free-demo
    Click Element    id=CybotCookiebotDialogBodyLevelButtonLevelOptinAllowAll
    Input Text     css=#Form_getForm_FullName   John wick
    Input Text     css=#Form_getForm_Email    john@gmail.com
    Select From List By Label    css=#Form_getForm_Country    India
    Input Text    css=input[name='CompanyName']   ABB
    Click Element   css=input[value='Get a Free Demo']

