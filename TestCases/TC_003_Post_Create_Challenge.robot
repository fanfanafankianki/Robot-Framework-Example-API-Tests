*** Settings ***
#Documentation    https://lichess.org/api
Library  SeleniumLibrary
Library  Collections
Library  RequestsLibrary
*** Variables ***

${URL}    https://lichess.org
${challenge}    api/challenge/open

*** Test Cases ***
TC_003 Create challenge for 2 players
    Create Session    lichess    https://lichess.org/    verify=true
    ${response}=    post on session    lichess    url=${challenge}
    log to console    ${response.status_code}
    ${code}=    convert to string    ${response.status_code}
    should be equal    ${code}    200
    should not be empty    ${response.content}
