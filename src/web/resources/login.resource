*** Keywords ***
Enter Username
    [Arguments]    ${username}
    Fill Text    id=userName    ${username}

Enter Password
    [Arguments]    ${password}
    Fill Text    id=password    ${password}
    
Submit Login Form
    Click    id=login

Do Succesful Logout
    Click    text=Log out

Do Succesful Login
    [Arguments]    ${username}    ${password}
    Enter Username    ${username}
    Enter Password    ${password}
    Submit Login Form
    Wait For Navigation    ${BASE_URL}/profile    5s