*** Settings ***
#Documentation    https://lichess.org/api
Library  SeleniumLibrary
Library  Collections
Library  RequestsLibrary
*** Variables ***

${URL}    https://lichess.org
${users}    api/users
${params}    ids=aliquantus,chess-network,lovlas,georges

*** Test Cases ***
TC_008 Post, get user by ID
    Create Session    lichess    https://lichess.org/    verify=true
    ${response}=    post on session    lichess    url=${users}    data=${params}
    log to console    ${response.status_code}
    ${code}=    convert to string    ${response.status_code}
    should be equal    ${code}    200
    should not be empty    ${response.content}


