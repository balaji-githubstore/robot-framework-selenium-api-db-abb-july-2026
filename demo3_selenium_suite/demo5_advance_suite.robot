*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
TC1 Upload
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.ilovepdf.com/pdf_to_word
    Choose File    xpath=//input[@type='file']    D:${/}Mine${/}Balaji Dinakaran Trainer Profile AI 2026.pdf
    


