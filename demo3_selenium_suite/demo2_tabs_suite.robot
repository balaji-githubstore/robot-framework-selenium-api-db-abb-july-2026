*** Settings ***
Library   SeleniumLibrary

*** Test Cases ***
TC1
    Open Browser    browser=edge
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://demo.openemr.io/b/openemr/
    # click on OrangeHRM, Inc.
    Click Element    partial link=Acknowledgments
    Switch Window    Acknowledgments, Licensing and Certification
    Click Element     link=OpenEMR Foundation
    # verify the header - About the OpenEMR Foundation
    Element Text Should Be    locator=xpath=//h1[contains(text(),'About the Open')]    expected=About the OpenEMR Foundation
    # go to the first tab (main)
    # log the title

