*** Settings ***
Variables    env_vars.py

*** Keywords ***
Open Browser To Page
    [Arguments]    ${path}
    New Browser    headless=${FALSE}
    New Page    ${BASE_URL}${path}
    Get Title    ==    DEMOQA
