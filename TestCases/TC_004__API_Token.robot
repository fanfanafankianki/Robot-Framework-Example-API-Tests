*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  RequestsLibrary
Suite Setup    Create Session  jsonplaceholder  https://lichess.org/
*** Variables ***

${Browser}    Chrome
${URL}    https://explorer.lichess.ovh/
${simul}    lichess
${variant}    "standard"
${fen}    fen=rnbqkbnr/ppp1pppp/8/3pP3/8/8/PPPP1PPP/RNBQKBNR b KQkq - 0 2

*** Test Cases ***
TC_004 Get Request Test on Simul Page
    Create Session    lichess    https://lichess.org/    verify=true
    ${response}=    get on session    lichess    url=${simul}  params=${variant} ${fen}
    log to console    ${response.status_code}
    ${code}=    convert to string    ${response.status_code}
    should be equal    ${code}    200
    should not be empty    ${response.content}

