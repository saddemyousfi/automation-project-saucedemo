*** Settings ***
Library           SeleniumLibrary
Variables         config.json

*** Keywords ***
Login To Swag Labs
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${locators['login_user']}    timeout=10s
    Input Text        ${locators['login_user']}    ${username}
    Input Password    ${locators['login_pass']}    ${password}
    Click Button      ${locators['login_btn']}
    Wait Until Location Contains    inventory.html    timeout=10s

Open Sidebar Menu
    # Check if the menu is already open
    ${is_open}=    Run Keyword And Return Status    Element Should Be Visible    ${locators['logout_link']}
    IF    not ${is_open}
        Wait Until Element Is Visible    ${locators['menu_btn']}    timeout=10s
        # Using Javascript to ensure the click isn't intercepted by animations
        Execute Javascript    document.getElementById('react-burger-menu-btn').click()
        # Wait for the specific About link to be ready
        Wait Until Element Is Visible    ${locators['about_link']}    timeout=10s
        Sleep    1s    # Buffer for CSS slide-in transition
    END

Verify Sidebar Options
    Wait Until Element Is Visible    ${locators['item_link']}    timeout=5s
    FOR    ${option}    IN    @{menu_labels}
        Element Should Contain    ${locators['menu_container']}    ${option}
    END

Reset App State And Verify Cart
    Open Sidebar Menu
    Wait Until Element Is Visible    ${locators['reset_link']}
    Click Element     ${locators['reset_link']}
    # Close the menu to check the cart badge on the main page
    Execute Javascript    document.getElementById('react-burger-cross-btn').click()
    Sleep    0.5s
    Element Should Not Be Visible    ${locators['cart_badge']}

Logout From App
    Open Sidebar Menu
    Wait Until Element Is Visible    ${locators['logout_link']}
    Click Element     ${locators['logout_link']}
    Wait Until Element Is Visible    ${locators['login_btn']}    timeout=10s