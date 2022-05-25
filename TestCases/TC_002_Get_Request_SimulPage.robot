*** Settings ***
#Documentation    https://lichess.org/api
Library  SeleniumLibrary
Library  Collections
Library  RequestsLibrary
*** Variables ***

${URL}    https://lichess.org
${simul}    api/simul
${response}=    get on session    lichess    url=${simul}
${code}=    convert to string
 ${response.status_code}

*** Test Cases ***
TC_002 Get Request Test on Simul Page
    Create Session with lichess site
    Log response to console
    Code should be equall to 200
    Verify response content is not empty

*** Keywords ***
Create Session with lichess site
    Create Session    lichess    ${URL}}    verify=true

Log response to console
    log to console    ${response.status_code}

Code should be equall to 200
    should be equal    ${code}    200

Verify response content is not empty
    should not be empty    ${response.content}