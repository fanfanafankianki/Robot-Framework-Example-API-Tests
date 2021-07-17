*** Settings ***
#Documentation    https://lichess.org/api
Library  SeleniumLibrary
Library  Collections
Library  RequestsLibrary
*** Variables ***

${URL}    https://explorer.lichess.ovh/
${lichess}    lichess
${variant}    "standard"
${fen}    fen=rnbqkbnr/ppp1pppp/8/3pP3/8/8/PPPP1PPP/RNBQKBNR b KQkq - 0 2

*** Test Cases ***
TC_004 Get Lichess Board Analysis
    Create Session    lichess    https://lichess.org/    verify=true
    ${response}=    get on session    lichess    url=${lichess}  params=${variant} ${fen}
    log to console    ${response.status_code}
    ${code}=    convert to string    ${response.status_code}
    should be equal    ${code}    200
    should not be empty    ${response.content}

