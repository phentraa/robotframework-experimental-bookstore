*** Comments ***


*** Settings ***
Library    Browser
Resource    ${CURDIR}/../../resources/common.resource
Resource    ${CURDIR}/../../resources/login.resource

Test Setup    Open Browser To Page    /login
Test Template    Error Message Is Visible When Using Incorrect Credentials

*** Variables ***


*** Test Cases ***
Empty Username Empty Password    ${EMPTY}    ${EMPTY}
Valid Username Empty Password    ${TEST_USER}[username]   ${EMPTY}
Empty Username Valid Password    ${EMPTY}    ${TEST_USER}[password]
Valid Username Invalid Password    ${TEST_USER}[username]    invalid_password
Invalid Username Valid Password    invalid_user    ${TEST_USER}[password]
Invalid Username Invalid Password    invalid_user    invalid_password


*** Keywords ***
Error Message Is Visible When Using Incorrect Credentials
    [Arguments]    ${username}    ${password}
    [Timeout]    2s
    Enter Username    ${username}
    Enter Password    ${password}
    Submit Login Form
    ${error_message}    Get Text    id=name
    Should Be Equal    ${error_message}   Invalid username or password!