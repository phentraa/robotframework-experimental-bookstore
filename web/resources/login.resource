*** Keywords ***
Enter Username
    [Arguments]    ${username}
    Fill Text    id=userName    ${username}

Enter Password
    [Arguments]    ${password}
    Fill Text    id=password    ${password}
    
Submit Login Form
    Click    id=login