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

TC4
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.citigroup.com/global/about-us/global-presence/india
    Click Element    xpath=//button[text()='Accept All']
    Mouse Over     xpath=//div[text()='My Account']
    Click Element    xpath=//div[text()='Banking with Citi']
    Switch Window    Online Banking, Mortgages, Personal Loans, Investing | Citi.com
    Input Text    xpath=//input[@formcontrolname='username']    demo123

TC5 Javascript Option 1
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.malaysiaairlines.com/us/en/home.html
    Click Element    xpath=//span[text()='Accept all cookies']
    Click Element    xpath=//span[text()='Multi-city']

    # //approach 1
    # Input Text    xpath=//div[@id='multi-city']//input[@aria-label="Depart"]    05 Aug 2026

    # //approach 2 - automating calendar 
      
    # //approach 3
    # use javascript to fill the readonly textbox 
    Execute Javascript    document.querySelector("input[aria-label='Depart']").value="20 Aug 2026"
    Execute Javascript    document.querySelectorAll("input[aria-label='Depart']")[1].value='03 Sep 2026'
    Sleep   3s

TC5 Javascript Option 2
    Open Browser    browser=chrome    options=add_argument("start-maximized");add_argument("--disable-notifications")
    # Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.malaysiaairlines.com/us/en/home.html
    Wait Until Element Is Visible    xpath=//span[text()='Accept all cookies']    timeout=30s
    Click Element    xpath=//span[text()='Accept all cookies']
    Click Element    xpath=//span[text()='Multi-city']

    ${dep_element}    Get WebElement    xpath=//div[@id='multi-city']//input[@aria-label="Depart"]
    Execute Javascript    arguments[0].value="20 Aug 2026"    ARGUMENTS        ${dep_element}

    ${ret_element}    Get WebElement    xpath=(//div[@id='multi-city']//input[@aria-label="Depart"])[2]
    Execute Javascript    arguments[0].value="20 Sep 2026"    ARGUMENTS        ${ret_element}


    # ${ret_element}    Get WebElement    xpath=(//div[@id='multi-city']//input[@aria-label="Depart"])[2]
    # Execute Javascript    arguments[0].click()    ARGUMENTS        ${ret_element}


    # Execute Javascript    arguments[0].value="20 Aug 2026";arguments[1].value="20 Aug 2026";    ARGUMENTS        ${dep_element}    ${ret_element}