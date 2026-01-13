*** Settings ***
Resource       ../resources/keywords.robot
Suite Setup    Load Configuration
Test Teardown  Close Browser

*** Test Cases ***
Navigation dans le menu burger
    Open Application
    Login With Valid Credentials
    Open Burger Menu
    Verify Burger Menu Links
