*** Settings ***
Library  SeleniumLibrary
Library  Collections
*** Variables ***

*** Keywords ***
Start and Maximize Browser
    [Arguments]  ${UserURL}  ${InputBrowser}
    Open Browser  ${UserURL}  ${InputBrowser}
    maximize browser window