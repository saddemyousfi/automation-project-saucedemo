*** Settings ***
Documentation    Fichier de variables pour les tests Robot Framework
Library          OperatingSystem
Library          Collections

*** Variables ***
# Configuration du navigateur
${BROWSER}              Chrome
${HEADLESS}             False
${IMPLICIT_WAIT}        10

# URLs (peuvent être surchargées par variables.json)
${BASE_URL}             https://www.saucedemo.com
${INVENTORY_URL}        ${BASE_URL}/inventory.html
${CART_URL}             ${BASE_URL}/cart.html

# Identifiants par défaut
${VALID_USERNAME}       standard_user
${VALID_PASSWORD}       secret_sauce
${LOCKED_USERNAME}      locked_out_user
${PROBLEM_USERNAME}     problem_user

# Sélecteurs - Page de connexion
${LOGIN_USERNAME}       css:#user-name
${LOGIN_PASSWORD}       css:#password
${LOGIN_BUTTON}         css:#login-button
${LOGIN_ERROR}          css:[data-test='error']

# Sélecteurs - Menu Burger
${BURGER_MENU_BTN}      css:#react-burger-menu-btn
${BURGER_MENU_WRAP}     css:.bm-menu-wrap
${MENU_ALL_ITEMS}       css:#inventory_sidebar_link
${MENU_ABOUT}           css:#about_sidebar_link
${MENU_LOGOUT}          css:#logout_sidebar_link
${MENU_RESET}           css:#reset_sidebar_app_link
${MENU_CLOSE_BTN}       css:#react-burger-cross-btn

# Sélecteurs - Page d'inventaire
${INVENTORY_TITLE}      css:.title
${PRODUCT_ITEMS}        css:.inventory_item
${CART_BADGE}           css:.shopping_cart_badge
${ADD_TO_CART_BTN}      css:[data-test*='add-to-cart']

# Sélecteurs - Page du panier
${CART_ITEM}            css:.cart_item
${CHECKOUT_BTN}         css:#checkout
${CONTINUE_SHOPPING}    css:#continue-shopping

# Textes attendus
${TXT_PRODUCTS}         Products
${TXT_YOUR_CART}        Your Cart
${TXT_ALL_ITEMS}        All Items
${TXT_ABOUT}            About
${TXT_LOGOUT}           Logout
${TXT_RESET}            Reset App State

# Timeouts
${TIMEOUT_DEFAULT}      10s
${TIMEOUT_SHORT}        3s
${TIMEOUT_LONG}         30s

# Chemins des fichiers
${JSON_VARS_PATH}       ${CURDIR}/variables.json
${RESULTS_DIR}          ${CURDIR}/../results
${SCREENSHOTS_DIR}      ${RESULTS_DIR}/screenshots