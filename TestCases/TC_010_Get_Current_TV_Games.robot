*** Settings ***
#Documentation    https://lichess.org/api
Library  SeleniumLibrary
Library  Collections
Library  RequestsLibrary
*** Variables ***

${URL}    https://lichess.org
${tv}    api/tv/channels

*** Test Cases ***
TC_010 Get current TV Games
    Create Session    lichess    https://lichess.org/    verify=true
    ${response}=    get on session    lichess    url=${tv}
    log to console    ${response.status_code}
    ${code}=    convert to string    ${response.status_code}
    should be equal    ${code}    200
    should not be empty    ${response.content}


