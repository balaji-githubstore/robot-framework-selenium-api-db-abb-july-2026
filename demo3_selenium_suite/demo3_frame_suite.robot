*** Settings ***
Library   SeleniumLibrary

*** Test Cases ***
# TC1 Frame
#     Open Browser    browser=chrome
#     Maximize Browser Window
#     Set Selenium Implicit Wait    20s
#     Go To    url=https://x.com/?lang=en-in
#     Click Element    xpath=//span[text()='Continue with Google']

TC2 Frame
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://demo.automationtesting.in/Frames.html
    Select Frame    //iframe[@id='singleframe']
    Input Text    xpath=//input[@type='text']    john
    # click, select inside the frame if required 
    Unselect Frame

TC3 Frame
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://app.thetestingacademy.com/playwright/frames/
    Select Frame    xpath=//iframe[@name='vehicle-form']
    # enter vehicle name - creta 
    Input Text    name=vehicleName    creta
    # owner name - John
    Input Text    name=ownerName    creta
    # vehicle type - SUV
    Select From List By Label    name=vehicleType    SUV
    # submit registration 
    Scroll Element Into View    id=vehicle-submit
    Click Element    id=vehicle-submit
    Unselect Frame
    [Teardown]    Close Browser

