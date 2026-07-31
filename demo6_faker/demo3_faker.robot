*** Settings ***
Library    FakerLibrary
Library    SeleniumLibrary

*** Test Cases ***
FakerLibrary Words Generation
    ${words}=    FakerLibrary.Words
    Log    words: ${words}
    ${words}=    FakerLibrary.Words    nb=${10}
    Log    words: ${words}

    ${num}=    Credit Card Number
    Log    ${num}
    
