*** Settings ***
Library    FlaUILibrary

*** Comments ***
Only xpath is supported - FlaUILibrary
//TagName[@Attribute='']
//ControlType[@Attribute='']

//MenuItem[@Name='File']

//Document[@Name='Text editor']

//Button[@AutomationId='AddButton']

//Button[@Name='Sign in']

//Edit[@Name='Email or phone number']

//Button[@Name='Next']

//Text[@Name='Having trouble signing in with this email. Please sign in with a different account or create a free account']

faster to search 
/MenuBar/MenuItem[@Name='File]

*** Keywords ***
Wait and Click Element 
    [Arguments]    ${locator}
    Wait Until Element Exist    ${locator}
    Click    ${locator}

Wait And Set Text To Textbox  
    [Arguments]    ${locator}    ${text}    ${retries}=10
    Wait Until Element Exist    ${locator}    ${retries}
    Set Text To Textbox    ${locator}    ${text}

*** Test Cases ***
TC1 
    Launch Application    application=C:${/}Windows${/}notepad.exe
    Wait Until Element Exist    //Document[@Name='Text editor']
    Set Text To Textbox    //Document[@Name='Text editor']    jack1232kkdskdksj
    Wait Until Element Exist    //Document[@Name='Text editor']
    Click    //MenuItem[@Name='File']
    Sleep    5s

TC2 
    Launch Application    application=C:${/}Windows${/}notepad.exe
    Wait And Set Text To Textbox    //Document[@Name='Text editor']    jack1232kkdskdksj
    Wait and Click Element    //MenuItem[@Name='File']
    Sleep    5s

TC3 Zoom
    Launch Application    application=C:${/}Users${/}balaj${/}AppData${/}Roaming${/}Zoom${/}bin${/}Zoom.exe
    Wait and Click Element    //Button[@Name='Sign in']
    # Wait And Set Text To Textbox      //Edit[@Name='Email or phone number']    sajdjasdjas@gmail.com
    Wait and Click Element    //Edit[@Name='Email or phone number'] 
    @{keys}     Create List    t'sajdjasdjasdsdsdd@gmail.com'
    Press Keys    ${keys}
    Wait and Click Element    //Button[@Name='Next']
    Element Should Exist    //Text[@Name='Having trouble signing in with this email. Please sign in with a different account or create a free account']
    ${actual_Name}    Get Name From Element    //Text[@Name='Having trouble signing in with this email. Please sign in with a different account or create a free account']
    Log     ${actual_Name} 
    # Switch Uia To    uia=UIA3
    Sleep    5s
    [Teardown]    Close Application By Name    Zoom