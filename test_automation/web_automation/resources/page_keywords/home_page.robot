*** Settings ***
Documentation    Home Page Keywords
Variables  ../page_locators/home_page.py



*** Keywords ***
click + Group button
    wait until element is visible  ${create_group_button}  timeout=60s
    click element  ${create_group_button}