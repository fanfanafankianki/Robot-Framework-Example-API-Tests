*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  RequestsLibrary
Suite Setup    Create Session  jsonplaceholder  https://lichess.org/
*** Variables ***

${Browser}    Chrome
${URL}    https://lichess.org
${simul}    api/challenge/open

*** Test Cases ***
TC_003 Get Request Test on Simul Page
    Create Session    lichess    https://lichess.org/    verify=true
    ${response}=    post on session    lichess    url=${simul}
    log to console    ${response.status_code}
    log to console    ${response.content}
    ${code}=    convert to string    ${response.status_code}
    should be equal    ${code}    200

