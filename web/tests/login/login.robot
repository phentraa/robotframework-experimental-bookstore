*** Comments ***


*** Settings ***
Library    Browser
Resource    ${CURDIR}/../../resources/common.resource
Resource    ${CURDIR}/../../resources/login.resource

Test Setup    Run Keywords    Open Browser To Page    /login
...           AND             Do Succesful Login    ${TEST_USER}[username]    ${TEST_USER}[password]

*** Variables ***


*** Test Cases ***
Profile Page Should Be Visible After Succesful Login
    [Teardown]    Do Succesful Logout
    Get Url    ==    ${BASE_URL}/profile

Login Page Should Be Visible After Successful Logout
    Do Succesful Logout
    Get Url    ==    ${BASE_URL}/login


*** Keywords ***