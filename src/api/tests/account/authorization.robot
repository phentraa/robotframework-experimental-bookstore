*** Comments ***

*** Settings ***
Library    DateTime
Library    Collections
Library    RequestsLibrary
Resource    ${CURDIR}/../../resources/common.resource
Resource    ${CURDIR}/../../resources/authorization.resource
Suite Setup    Create Session    authorization_session    ${BASE_URL}/Account/v1    verify=true

*** Variables ***


*** Test Cases ***
Authorization Should Be Succesful With Valid Authentication Data
   ${response}    POST Authorized    
   ...            ${TEST_USER}[username]    
   ...            ${TEST_USER}[password]
   ...            authorization_session 
   
   Should Be Equal As Strings   ${response.status_code}    200
   Should Be Equal As Strings   ${response.text}    true

Should Get Token With Valid Authentication Data
    ${response}    POST GenerateToken    
    ...            ${TEST_USER}[username]    
    ...            ${TEST_USER}[password]
    ...            authorization_session 

    ${response_body}    Set Variable    ${response.json()}

    All Required Keys Exists In    ${response_body}
    
    Should Not Be Empty    ${response_body}[token]
    
    ${is_valid}    Validate Datetime    ${response_body}[expires]
    Should Be True    ${is_valid}

*** Keywords ***
All Required Keys Exists In
    [Arguments]    ${dictionary}

    ${keys}    Get Dictionary Keys    ${TOKEN_VIEW_MODEL}
    FOR    ${key}    IN    @{keys}
        Dictionary Should Contain Key    ${dictionary}    ${key}
    END

Validate DateTime
    [Arguments]    ${value}
    RETURN    Run Keyword And Return Status    Convert Date    ${value}