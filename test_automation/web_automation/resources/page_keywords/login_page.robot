*** Settings ***
Documentation    Login Page Keywords
Variables  ../page_locators/login_page.py




*** Keywords ***
enter mifos username:
    [Arguments]  ${username}
    input text  ${username_field}  ${username}

enter mifos password:
    [Arguments]  ${password}
    input text  ${password_field}  ${password}

click sign in button
    click element  ${sign_in_button}