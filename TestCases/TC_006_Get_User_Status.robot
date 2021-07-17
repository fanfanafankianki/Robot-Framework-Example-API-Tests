*** Settings ***
#Documentation    https://lichess.org/api
Library  SeleniumLibrary
Library  Collections
Library  RequestsLibrary
*** Variables ***

${URL}    https://lichess.org
${users}    api/users/status
${params}    ids=fanfanafankianki

*** Test Cases ***
TC_006 Get real-time users status test
    Create Session    lichess    https://lichess.org/    verify=true
    ${response}=    get on session    lichess    url=${users}    params=${params}
    log to console    ${response.status_code}
    ${code}=    convert to string    ${response.status_code}
    should be equal    ${code}    200
    should not be empty    ${response.content}


