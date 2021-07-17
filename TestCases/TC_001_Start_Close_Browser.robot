*** Settings ***
#Documentation    https://lichess.org/api
Library  SeleniumLibrary
Library  Collections
Library  RequestsLibrary
*** Variables ***

${Browser}    Chrome
${URL}    https://lichess.org


*** Test Cases ***
TC_001 Browser Start and Close
    Open Browser    ${URL}    ${Browser}
    Close Browser


