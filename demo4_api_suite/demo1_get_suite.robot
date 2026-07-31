*** Settings ***
Library    RequestsLibrary

Suite Setup    Create Session    alias=petstore    url=https://petstore.swagger.io/v2
Suite Teardown   Delete All Sessions

*** Test Cases ***
TC1 Test InValid Pet Id Print 
    ${response}     GET On Session    alias=petstore    url=/pet/708   expected_status=200
    Log    ${response.json()}
    Log    ${response.status_code}
    Log    ${response.text}
    Log    ${response.headers}
    

TC2 Test InValid Pet Id Path Parameter
    ${response}     GET On Session    alias=petstore    url=/pet/708   expected_status=200
    Log    ${response.json()}
    Log    ${response.json()}[id]
    # Log    ${response.json()['id']}
    Log    ${response.json()}[name]
    Log    ${response.json()}[status]
    Log    ${response.json()}[category]
    Log    ${response.json()}[category][id]
    Log    ${response.json()}[category][name]
    Log    ${response.json()}[tags][0][id]
    Should Be Equal As Integers    ${response.json()}[id]    708
    

TC3 Test InValid Pet Id
    ${response}     GET On Session    alias=petstore    url=/pet/295595    expected_status=404
    Status Should Be    404

TC4 Find Pet By Status Query Parameter
    ${response}     GET On Session    alias=petstore    url=/pet/findByStatus?status=pending  expected_status=200
    Log    ${response.json()}
    Log    ${response.json()}[0][id]
    Log    ${response.json()}[0][status]
    # Log    ${response.json()}[1][status]

# for loop
# advance for loop - foreach

TC5 Find Pet By Status Query Parameter
    ${response}     GET On Session    alias=petstore    url=/pet/findByStatus?status=pending  expected_status=200
    Log    ${response.json()}
    Log    ${response.json()}[0]

    ${pet_count}   Get Length    ${response.json()}

    FOR    ${i}    IN RANGE     0    ${pet_count}
        # Log To Console    ${response.json()}[${i}][status]
        Should Be Equal As Strings    ${response.json()}[${i}][status]    pending
    END


TC6 Find Pet By Status Query Parameter
    ${response}     GET On Session    alias=petstore    url=/pet/findByStatus?status=pending  expected_status=200
    Log    ${response.json()}
    Log    ${response.json()}[0]

    FOR   ${pet}  IN    @{response.json()}
        Should Be Equal As Strings    ${pet}[status]    pending
    END