*** Settings ***
Library    demo.py


*** Test Cases ***
TC1
    ${res}  Area Of Circle    4
    Log To Console    ${res}