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


User can go to Avalible Jobs
    [Documentation]             This is a test for navigate to Willys Jobs
    [Tags]                      Test 5
    Go to Web Page
    Click on Avalible Jobs


*** ignore ***

User can access website
    [Documentation]             This is some basic info about the test
    [Tags]                      Test 1
    Go to Web Page

User can search for adding hallon to cart
    [Documentation]             This is some basic info about the test
    [Tags]                      Test 2
    Go to Web Page
    Search for Product          Hallon

User can search for kiwi, using Gherkin
    [Documentation]             This is a test with Gherkin
    [Tags]                      Test 3
    Given Go to Web Page
    When Enter Search Term     kiwi
    And Submit Search
    Then Verify Search Completed    kiwi

User can go to Erbjudanden
    [Documentation]             This is a test for navigation to Erbjudanden
    [Tags]                      Test 4
    Go to Web Page
    Click on erbjudande
    Verify New Site

