*** Comments ***


*** Settings ***
Library    Browser
Resource    ${CURDIR}/../../../common/common.resource

*** Variables ***


*** Test Cases ***
Simple Login
    Open Browser To Login Page
    Enter Username    ${TEST_USER}[username]
    Enter Password    ${TEST_USER}[password]
    Submit Login Form


*** Keywords ***
Open Browser To Login Page
    New Browser    headless=${FALSE}
    New Page    ${BASE_URL}/login
    Get Title    ==    DEMOQA

Enter Username
    [Arguments]    ${username}
    Fill Text    id=userName    ${username}
Enter Password
    [Arguments]    ${password}
    Fill Text    id=password    ${password}
Submit Login Form
    Click    id=login