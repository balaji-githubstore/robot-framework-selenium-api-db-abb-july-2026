*** Settings ***
Library    DateTime
Library    String

*** Test Cases ***
TC1
    [Tags]    smoke    regression
    Log To Console    message=Balaji Dinakaran
    Log To Console    message=hello
    Log To Console    hello2

TC2 
    [Tags]    smoke
    ${num1}   Set Variable    10
    ${num2}   Set Variable    20
    Log To Console   message=${num1}
    Log To Console   message=${num2}

TC3
    ${radius}   Set Variable    10
    ${result}    Evaluate   3.14*${radius}*${radius}
    Log To Console    ${result} 


TC4
    ${current_date}  Get Current Date
    Log To Console    ${current_date}


TC5
    ${my_name}   Set Variable    balaji dinakaran
    ${my_name}    Convert To Upper Case    ${my_name}
    Log To Console    ${my_name}


TC6
    ${num1}   Set Variable    $100,000,000
    ${num2}   Set Variable    $200,000
    # add num1 and num2 and print 
    # will start at 2 PM IST
    ${num1}    Remove String    ${num1}    $    ,
    ${num2}    Remove String    ${num2}    $    ,
    ${result}    Evaluate   ${num1}+${num2}
    Log To Console    ${result} 