*** Settings ***
Documentation    Common Keywords
Library  SeleniumLibrary
Library  BuiltIn
Library  ../customized_keywords/web_driver_manager.py
Variables  ../resources/page_locators/login_page.py
Variables  ../resources/page_locators/home_page.py
Variables  ../resources/page_locators/create_group_page.py
Resource  ../resources/page_keywords/login_page.robot
Resource  ../resources/page_keywords/home_page.robot
Resource  ../resources/page_keywords/create_group_page.robot


*** Variables ***
&{test_url}  test=https://test.qe-360.com:8443/community-app/#/
&{username}  test=mifos
&{password}  test=password
${browser_type}  chrome



*** Keywords ***
User is on Mifos X Client login page
    ${driver_path}=  get driver path  ${browser_type}
    open browser  ${test_url.${env}}  ${browser_type}  executable_path=${driver_path}
    maximize browser window
    set selenium implicit wait  30s

User is on Mifos X Client home page
    user is on Mifos X Client login page
    enter mifos username:  ${username.${env}}
    enter mifos password:  ${password.${env}}
    click sign in button

User is redirected to url:
    [Arguments]  ${expected_url}
    ${actual_url}=  execute javascript  return window.location.href;
    Log  ${actual_url}
    should be equal  ${actual_url}  ${expected_url}

