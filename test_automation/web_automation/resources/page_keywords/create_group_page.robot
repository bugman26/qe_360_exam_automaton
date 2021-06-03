*** Settings ***
Documentation    Create Group Page Keywords
Variables  ../page_locators/create_group_page.py



*** Keywords ***
select office:
    [Arguments]  ${office_type}
    wait until element is visible  ${office_field}  timeout=60s
    click element  ${office_field}
    ${office_selection_locator}=  replace string  ${office_drop_down_value}  office_text_value  ${office_type}
    click element  ${office_selection_locator}

enter random name
    ${random_name}=  generate random string  12
    set suite variable  ${random_name}  ${random_name}
    log  entered name: ${random_name}
    input text  ${name_field}  ${random_name}

enter name:
    [Arguments]  ${name}
    input text  ${name_field}  ${name}

click active checkbox
    click element  ${active_check_box}

add client:
    [Arguments]  ${add_clients_value}
    input text  ${add_clients_field}  ${add_clients_value}
    sleep  2s
    ${client_choices_locator}=  replace string  ${add_client_choices}  client_entered  ${add_clients_value}
    click element  ${client_choices_locator}

click add button
    click element  ${add_button}

enter random external id
    ${external_id_value}=  generate random string  15
    input text  ${external_id_field}  ${external_id_value}

click submit button
    click element  ${submit_button}

verify new group is successfully created
    ${center_group_name_locator}=  replace string  ${group_center_name}  created_group_name  ${random_name}
    element should be visible  ${center_group_name_locator}

verify error message is displayed in create group page:
    [Arguments]  ${error_message}
    ${create_grp_error_msg_locator}=  replace string  ${create_group_error_msg}  error_message  ${error_message}
    element should be visible  ${create_grp_error_msg_locator}

verify actual name is the same as expected:
    [Arguments]  ${expected_name_value}
    ${actual_name_value}  get value  ${name_field}
    should be equal  ${actual_name_value}  ${expected_name_value}

enter external id:
    [Arguments]  ${external_id}
    input text  ${external_id_field}  ${external_id}


verify actual external id is the same as expected:
    [Arguments]  ${expected_id_value}
    ${actual_id_value}  get value  ${external_id_field}
    should be equal  ${actual_id_value}  ${expected_id_value}

verify add client - client details is displayed for client name:
    [Arguments]  ${client_name}
    ${client_details_info_locator}=  replace string  ${client_details_info}  client_name  ${client_name}
    element should be visible  ${client_details_info_locator}

enter activation date:
    [Arguments]  ${activation_date}
    input text  ${activation_date_field}  ${activation_date}

enter submitted on date:
    [Arguments]  ${submitted_on_date}
    input text  ${submitted_on_date_field}  ${submitted_on_date}

click x button for client name:
    [Arguments]  ${client_name}
    ${add_client_delete_or_x_button_locator}=  replace string  ${add_client_delete_or_x_button}  client_name  ${client_name}
    click element  ${add_client_delete_or_x_button_locator}

verify element should not be visible for added client name:
    [Arguments]  ${client_name}
    ${added_client_locator}=  replace string  ${added_client}  client_name  ${client_name}
    element should not be visible  ${added_client_locator}

click cancel button
    click element  ${cancel_button}

