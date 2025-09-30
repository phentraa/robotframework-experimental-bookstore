*** Settings ***
Variables    ${CURDIR}/../../env_vars.py

*** Keywords ***
Open Browser To Page
    [Arguments]    ${path}
    New Browser    headless=${TRUE}
    New Page    ${BASE_URL}${path}
    Get Title    ==    DEMOQA
