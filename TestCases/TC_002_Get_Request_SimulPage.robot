*** Settings ***
#Documentation    https://lichess.org/api
Library  SeleniumLibrary
Library  Collections
Library  RequestsLibrary
*** Variables ***

${URL}    https://lichess.org
${simul}    api/simul
${response}    get on session    lichess    url=${simul}
${code}    convert to string    ${response.status_code}

*** Test Cases ***
TC_002 Get Request Test on Simul Page
    Create Session with lichess site
    Get response and log response to console
    Get code and check if code is equal to 200
    Verify response content is not empty    ${response.content}

*** Keywords ***
Create Session with lichess site
    Create Session    lichess    ${URL}    verify=true

Log response to console
    [Arguments]    ${expected}
    log to console    ${expected}

Code should be equal to 200
    [Arguments]    ${code1}
    should be equal    ${code1}    200

Verify response content is not empty
    [Arguments]     ${response.content}
    should not be empty    ${response.content}

Get response and log response to console
    ${response}=    get on session    lichess    url=${simul}
    Log response to console    ${response.status_code}

Get code and check if code is equal to 200
    ${response}=    get on session    lichess    url=${simul}
    ${code}=    convert to string    ${response.status_code}
    Code should be equal to 200    ${code}