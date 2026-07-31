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


TC2 Update Valid Pet To Store
    ${req_json_body}    Get File For Streaming Upload    path=${EXECDIR}${/}test-data${/}update_pet.json
    &{headers}     Create Dictionary    content-type=application/json    connection=keep-alive
    
    ${response}     PUT On Session    alias=petstore    url=/pet    
    ...    headers=${headers}    data=${req_json_body}    expected_status=200
    Log    ${response.json()}

# TC3 Delete Valid Pet From Store
    