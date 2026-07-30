*** Settings ***
Library    Collections

# global variable
*** Variables ***
${BROWSER_NAME}    chrome
@{COLORS}    red    green    yellow    
&{EMPLOYEE_DIC}    id=10    name=bala   role=trainer


*** Test Cases ***
TC1
    ${BROWSER_NAME}    Set Variable    FIREFOX
    Log To Console    ${BROWSER_NAME}
    
TC2
    Log To Console    ${BROWSER_NAME}
    Log To Console    ${COLORS}
    Log To Console    ${COLORS}[0]

TC3
    Log To Console    ${COLORS}
    # append orange to ${COLORS}
    Append To List    ${COLORS}    orange    
    # insert black at index 0 
    Insert Into List    ${COLORS}    0    black
    # remove green  from ${COLORS}
    Remove Values From List    ${COLORS}    green
    Log To Console    ${COLORS}

TC4
    # print name from &{EMPLOYEE_DIC}
    Log To Console    ${EMPLOYEE_DIC}
    Log To Console    ${EMPLOYEE_DIC}[name]

TC5
    ${browser}  Set Variable    edge
    @{fruits}     Create List    mango    orange    banana
    Log To Console    ${fruits}[0]

    &{mobile_dic}    Create Dictionary    mobile=android    os=9    model=oneplus
    Log To Console    ${mobile_dic}[model]


TC6
    Log To Console    D:\\Mine\\Balaji Dinakaran Trainer Profile AI 2026.pdf
    Log To Console    D:${/}Mine${/}Balaji Dinakaran Trainer Profile AI 2026.pdf
    Log To Console    hello${SPACE}${SPACE}world
    Log To Console    ${CURDIR}
    Log To Console    ${EXECDIR}
    Log To Console    ${OUTPUT_DIR}
    Log To Console    ${TEMPDIR}
    Log To Console    ${TEST_NAME}
    Log To Console    ${SUITE_NAME}
    Log To Console    ${EXECDIR}${/}test-data${/}new_pet.json