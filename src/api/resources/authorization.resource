*** Keywords ***
POST Authorized
    [Arguments]    ${username}
    ...            ${password}
    ...            ${session}    

    ${data}        Create dictionary
    ...            userName=${username}
    ...            password=${password}
    
    ${response}    POST On Session    ${session}
    ...            /Authorized
    ...            json=${data}
    ...            expected_status=anything

    RETURN    ${response}

POST GenerateToken
    [Arguments]    ${username}
    ...            ${password}
    ...            ${session}    

    ${data}        Create dictionary
    ...            userName=${username}
    ...            password=${password}
    
    ${response}    POST On Session    ${session}
    ...            /GenerateToken
    ...            json=${data}
    ...            expected_status=anything

    RETURN    ${response}