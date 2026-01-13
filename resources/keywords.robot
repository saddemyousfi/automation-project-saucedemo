*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    OperatingSystem

*** Variables ***
${DATA_FILE}       ${CURDIR}${/}config.json
${BASE_URL}        None
${USERNAME}        None
${PASSWORD}        None
${USERNAME_INPUT}  None
${PASSWORD_INPUT}  None
${LOGIN_BUTTON}    None
${BURGER_MENU}     None
${LOGOUT_LINK}     None

*** Keywords ***
Load Configuration
    ${config}=    Evaluate    __import__('json').load(open(r'''${DATA_FILE}''','r',encoding='utf-8'))
    Set Suite Variable    ${BASE_URL}        ${config["urls"]["base"]}
    Set Suite Variable    ${USERNAME}        ${config["credentials"]["username"]}
    Set Suite Variable    ${PASSWORD}        ${config["credentials"]["password"]}
    Set Suite Variable    ${USERNAME_INPUT}  ${config["selectors"]["username_input"]}
    Set Suite Variable    ${PASSWORD_INPUT}  ${config["selectors"]["password_input"]}
    Set Suite Variable    ${LOGIN_BUTTON}    ${config["selectors"]["login_button"]}
    Set Suite Variable    ${BURGER_MENU}     ${config["selectors"]["burger_menu"]}
    Set Suite Variable    ${LOGOUT_LINK}     ${config["selectors"]["logout_link"]}

Open Application
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window

Login With Valid Credentials
    Wait Until Element Is Visible    ${USERNAME_INPUT}    10s
    Input Text    ${USERNAME_INPUT}    ${USERNAME}
    Wait Until Element Is Visible    ${PASSWORD_INPUT}    10s
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    10s
    Click Button  ${LOGIN_BUTTON}

Open Burger Menu
    Wait Until Element Is Visible    ${BURGER_MENU}    10s
    Click Button    ${BURGER_MENU}
    Wait Until Element Is Visible    css=.bm-menu    10s

Close Burger Menu
    Wait Until Element Is Visible    css=.bm-cross-button    10s
    Click Element    css=.bm-cross-button
    Wait Until Element Is Not Visible    css=.bm-menu    10s

Verify Burger Menu Links
    # All Items
    Open Burger Menu
    Wait Until Element Is Visible    id=inventory_sidebar_link    10s
    Click Element    id=inventory_sidebar_link
    Wait Until Page Contains Element    id=inventory_container    10s

    # About page
    Open Burger Menu
    Wait Until Element Is Visible    id=about_sidebar_link    10s
    Click Element    id=about_sidebar_link
    Wait Until Page Contains    Sauce Labs    10s
    Go Back

    # Reset App State
    Open Burger Menu
    Wait Until Element Is Visible    id=reset_sidebar_link    10s
    Click Element    id=reset_sidebar_link
    Close Burger Menu

    # Logout
    Open Burger Menu
    Wait Until Element Is Visible    ${LOGOUT_LINK}    10s
    Click Element    ${LOGOUT_LINK}