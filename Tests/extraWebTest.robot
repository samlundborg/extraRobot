*** Settings ***
Documentation           This is some basic info about the whole test suite.
Resource                ../Resources/keywords.robot
Library                 SeleniumLibrary
Test Setup              Begin Web Test
Test Teardown           End Web Test

*** Variables ***
${BROWSER}          chrome
${URL}              https://www.willys.se/

*** Test Cases ***
User can access website
    [Documentation]             This is some basic info about the test
    [Tags]                      Test 1
    Go to Web Page

User can search for kiwi
    [Documentation]             This is some basic info about the test
    [Tags]                      Test 2
    Go to Web Page
    Search for Product          Hallon
