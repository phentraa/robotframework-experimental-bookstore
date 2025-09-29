*** Comments ***


*** Settings ***
Library    Browser
Resource    ${CURDIR}/../../../common/common.resource
Resource    ${CURDIR}/../../resources/login.resource

*** Variables ***


*** Test Cases ***
Simple Login
    Open Browser To Page    /login
    Enter Username    ${TEST_USER}[username]
    Enter Password    ${TEST_USER}[password]
    Submit Login Form
    Wait For Navigation    ${BASE_URL}/profile    5s
    Get Url    ==    ${BASE_URL}/profile


*** Keywords ***