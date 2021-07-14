*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  RequestsLibrary
Suite Setup    Create Session  jsonplaceholder  https://lichess.org/
*** Variables ***

${Browser}    Chrome
${URL}    https://lichess.org


*** Test Cases ***
TC_001 Browser Start and Close
    Open Browser    ${URL}    ${Browser}
    Close Browser


