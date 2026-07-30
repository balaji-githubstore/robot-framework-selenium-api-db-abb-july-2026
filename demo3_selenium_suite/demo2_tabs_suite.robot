*** Settings ***
Library   SeleniumLibrary

*** Test Cases ***
TC1 Switch Tab Using Title
    Open Browser    browser=edge
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://demo.openemr.io/b/openemr/
    # click on OrangeHRM, Inc.
    Click Element    partial link=Acknowledgments
    # switch to new tab with title
    Switch Window    Acknowledgments, Licensing and Certification
    Click Element     link=OpenEMR Foundation
    # verify the header - About the OpenEMR Foundation
    Element Text Should Be    locator=xpath=//h1[contains(text(),'About the Open')]    expected=About the OpenEMR Foundation
    # go to the first tab (main)
    Switch Window    OpenEMR Login
    Log Title
    Log Source
    [Teardown]    Close Browser
    

TC2 Switch Tab Using NEW and MAIN
    Open Browser    browser=edge
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://demo.openemr.io/b/openemr/
    # click on OrangeHRM, Inc.
    Click Element    partial link=Acknowledgments
    # switch to new tab using NEW -  the latest opened window is selected
    Switch Window    NEW
    Click Element     link=OpenEMR Foundation
    # verify the header - About the OpenEMR Foundation
    Element Text Should Be    locator=xpath=//h1[contains(text(),'About the Open')]    expected=About the OpenEMR Foundation
    # go to the first tab (main)
    Switch Window    MAIN
    Log Title
    Log Source
    [Teardown]    Close Browser