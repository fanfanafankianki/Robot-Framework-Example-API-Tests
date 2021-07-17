*** Settings ***
#Documentation    https://lichess.org/api
Library  SeleniumLibrary
Library  Collections
Library  RequestsLibrary
*** Variables ***

${URL}    https://lichess.org
${top10}    player
${params}    application/vnd.lichess.v3+json

*** Test Cases ***
TC_007 Get top 10 users
    Create Session    lichess    https://lichess.org/    verify=true
    ${response}=    get on session    lichess    url=${top10}    params=${params}
    log to console    ${response.status_code}
    ${code}=    convert to string    ${response.status_code}
    should be equal    ${code}    200
    should not be empty    ${response.content}


