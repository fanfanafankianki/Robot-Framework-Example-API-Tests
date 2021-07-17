*** Settings ***
#Documentation    https://lichess.org/api
Library  SeleniumLibrary
Library  Collections
Library  RequestsLibrary
*** Variables ***

${URL}    https://lichess.org
${export}    games/export/_ids
${params}    ids=TJxUmbWK,4OtIh2oh

*** Test Cases ***
TC_009 Post, export game by ID
    Create Session    lichess    https://lichess.org/    verify=true
    ${response}=    post on session    lichess    url=${export}    data=${params}
    log to console    ${response.status_code}
    ${code}=    convert to string    ${response.status_code}
    should be equal    ${code}    200
    should not be empty    ${response.content}


