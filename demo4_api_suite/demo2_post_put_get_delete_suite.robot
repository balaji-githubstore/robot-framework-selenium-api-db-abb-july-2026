*** Settings ***
Library    RequestsLibrary

Suite Setup    Create Session    alias=petstore    url=https://petstore.swagger.io/v2
Suite Teardown   Delete All Sessions

*** Test Cases ***
TC1 Add Valid Pet To Store
    ${req_json_body}    Get File For Streaming Upload    path=${EXECDIR}${/}test-data${/}new_pet.json
    &{headers}     Create Dictionary    content-type=application/json    connection=keep-alive    api-key=special-key
    
    ${response}     POST On Session    alias=petstore    url=/pet    
    ...    headers=${headers}    data=${req_json_body}    expected_status=200
    Log    ${response.json()}
    Should Be Equal As Strings    ${response.json()}[id]    1808
    Should Be Equal As Strings    ${response.json()}[name]    doggie-1808


TC2 Update Valid Pet To Store
    ${req_json_body}    Get File For Streaming Upload    path=${EXECDIR}${/}test-data${/}update_pet.json
    &{headers}     Create Dictionary    content-type=application/json    connection=keep-alive
    
    ${response}     PUT On Session    alias=petstore    url=/pet    
    ...    headers=${headers}    data=${req_json_body}    expected_status=200
    Log    ${response.json()}
    Should Be Equal As Strings    ${response.json()}[id]    1808
    Should Be Equal As Strings    ${response.json()}[name]    doggie-1808-update

TC3 Test Valid Pet Id From Store
    ${response}     GET On Session    alias=petstore    url=/pet/1808   expected_status=200
    Should Be Equal As Strings    ${response.json()}[id]    1808
    Should Be Equal As Strings    ${response.json()}[name]    doggie-1808-update

TC4 Delete Valid Pet From Store
    &{headers}    Create Dictionary    api_key=special-key
    ${response}     DELETE On Session    alias=petstore    url=/pet/1808    headers=${headers}    expected_status=200
    Log    ${response.json()}
    Should Be Equal As Strings    ${response.json()}[message]    1808 


TC5 Test Valid Pet Id From Store
    ${response}     GET On Session    alias=petstore    url=/pet/1808   expected_status=404
    
TC6 Delete Invalid Pet From Store
    &{headers}    Create Dictionary    api_key=special-key
    ${response}     DELETE On Session    alias=petstore    url=/pet/1808    headers=${headers}    expected_status=404
    