*** Settings ***
Documentation  Create Group Functionalities
Library  SeleniumLibrary
Library  String
Library  BuiltIn
Resource  common_keywords.robot

Test Teardown  close browser

*** Test Cases ***
User is successfully add active group with one client
    [Tags]  smoke  regression  test_1
    Given User is on Mifos X Client home page
    And User clicks on + Group button
    When User selects Office:  Head Office
    And User enters random Name
    And User selects Staff
    And User clicks Active checkbox
    And User enters Add clients:  Unused Client 2 Sample
    And Client Details is displayed for name:  Unused Client 2 Sample
    And User clicks Add>> button
    And User enters random External id
    And User clicks Submit button
    Then New group is successfully created


User is successfully add active group with two or more clients
    [Tags]  regression  test_2
    Given User is on Mifos X Client home page
    And User clicks on + Group button
    When User selects Office:  Head Office
    And User enters random Name
    And User selects Staff
    And User clicks Active checkbox
    And User enters Add clients:  Sample Exam Client 1
    And Client Details is displayed for name:  Sample Exam Client 1
    And User clicks Add>> button
    And User enters Add clients:  Sample Exam Client 2
    And Client Details is displayed for name:  Sample Exam Client 2
    And User clicks Add>> button
    And User enters Add clients:  Sample Exam Client 3
    And Client Details is displayed for name:  Sample Exam Client 3
    And User clicks Add>> button
    And User enters random External id
    And User clicks Submit button
    Then New group is successfully created

User is successfully add active group with no client
    [Tags]  regression  test_3
    Given User is on Mifos X Client home page
    And User clicks on + Group button
    When User selects Office:  Head Office
    And User enters random Name
    And User selects Staff
    And User clicks Active checkbox
    And User enters random External id
    And User clicks Submit button
    Then New group is successfully created


User is successfully add inactive group with one client
    [Tags]  smoke  regression  test_4
    Given User is on Mifos X Client home page
    And User clicks on + Group button
    When User selects Office:  Head Office
    And User enters random Name
    And User selects Staff
    And User enters Add clients:  Sample Exam Client 2
    And Client Details is displayed for name:  Sample Exam Client 2
    And User clicks Add>> button
    And User enters random External id
    And User clicks Submit button
    Then New group is successfully created


User is successfully add inactive group with two or more clients
    [Tags]  regression  test_5
    Given User is on Mifos X Client home page
    And User clicks on + Group button
    When User selects Office:  Head Office
    And User enters random Name
    And User selects Staff
    And User enters Add clients:  Sample Exam Client 1
    And Client Details is displayed for name:  Sample Exam Client 1
    And User clicks Add>> button
    And User enters Add clients:  Sample Exam Client 2
    And Client Details is displayed for name:  Sample Exam Client 2
    And User clicks Add>> button
    And User enters Add clients:  Sample Exam Client 3
    And Client Details is displayed for name:  Sample Exam Client 3
    And User clicks Add>> button
    And User enters random External id
    And User clicks Submit button
    Then New group is successfully created

User is successfully add inactive group with no client
    [Tags]  regression  test_6
    Given User is on Mifos X Client home page
    And User clicks on + Group button
    When User selects Office:  Head Office
    And User enters random Name
    And User selects Staff
    And User enters random External id
    And User clicks Submit button
    Then New group is successfully created

User is successfully add group filling only the Office and the Name
    [Tags]  regression  test_7
    Given User is on Mifos X Client home page
    And User clicks on + Group button
    When User selects Office:  Head Office
    And User enters random Name
    And User clicks Submit button
    Then New group is successfully created


User is successfully add group with clients also part of other group
    [Tags]  regression  test_8
    Given User is on Mifos X Client home page
    And User clicks on + Group button
    And User selects Office:  Head Office
    And User enters random Name
    And User selects Staff
    And User clicks Active checkbox
    And User enters Add clients:  Sample Exam Client 1
    And Client Details is displayed for name:  Sample Exam Client 1
    And User clicks Add>> button
    And User enters random External id
    And User clicks Submit button
    And New group is successfully created
    When User clicks on + Group button
    And User selects Office:  Head Office
    And User enters random Name
    And User selects Staff
    And User clicks Active checkbox
    And User enters Add clients:  Sample Exam Client 1
    And Client Details is displayed for name:  Sample Exam Client 1
    And User clicks Add>> button
    And User enters random External id
    And User clicks Submit button
    Then New group is successfully created

User cannot create group with existing group name
    [Tags]  regression  test_9
    Given User is on Mifos X Client home page
    And User clicks on + Group button
    When User selects Office:  Head Office
    And User enters Name:  Deejay
    And User selects Staff
    And User clicks Active checkbox
    And User clicks Submit button
    And User encounters error message:  Group with name 'Deejay' already exists


User cannot create group without filling out the Office
    [Tags]  regression  test_10
    Given User is on Mifos X Client home page
    And User clicks on + Group button
    When User enters random Name
    And User selects Staff
    And User clicks Active checkbox
    And User clicks Submit button
    Then User encounters error message:  field is required
    And User encounters error message:  Office is mandatory.

User cannot create group without filling out the Name
    [Tags]  regression  test_11
    Given User is on Mifos X Client home page
    And User clicks on + Group button
    When User selects Office:  Head Office
    And User enters Name:  Deejay
    And User clicks Active checkbox
    And User clicks Submit button
    Then User encounters error message:  field is required
    And User encounters error message:  Name is mandatory


Name field can accept alphanumeric and symbol characters
    [Tags]  regression  test_12
    Given User is on Mifos X Client home page
    And User clicks on + Group button
    When User enters Name:  Abcdefghijklmnopqrstuvwxyz123456789!@\#$%&*.
    Then Actual Name value is equal to expected:  Abcdefghijklmnopqrstuvwxyz123456789!@\#$%&*.


External id field can accept alphanumeric and symbol characters
    [Tags]  regression  test_13
    Given User is on Mifos X Client home page
    And User clicks on + Group button
    When User enters External id:  Abcdefghijklmnopqrstuvwxyz123456789!@\#$%&*.
    Then Actual External id value is equal to expected:  Abcdefghijklmnopqrstuvwxyz123456789!@\#$%&*.


Client Details is displayed when user selects client from Add clients search functionality
    [Tags]  regression  test_14
    Given User is on Mifos X Client home page
    And User clicks on + Group button
    When User enters Add clients:  Unused Client 1 Sample
    Then Client Details is displayed for name:  Unused Client 1 Sample

User cannot create new group when Activation date is less than date today
    [Tags]  regression  test_15
    Given User is on Mifos X Client home page
    And User clicks on + Group button
    When User selects Office:  Head Office
    And User enters random Name
    And User selects Staff
    And User clicks Active checkbox
    And User enters Activation date:  04 June 2021
    And User clicks Submit button
    Then User encounters error message:  error.msg.group.activationDate.in.the.future

User cannot create new group when Submitted on date is less than date today
    [Tags]  regression  test_16
    Given User is on Mifos X Client home page
    And User clicks on + Group button
    When User selects Office:  Head Office
    And User enters random Name
    And User selects Staff
    And User clicks Active checkbox
    And User enters Submitted on date:  04 June 2021
    And User clicks Submit button
    Then User encounters error message:  error.msg.group.submittedOnDate.in.the.future

User can delete added clients when creating new group
    [Tags]  regression  test_17
    Given User is on Mifos X Client home page
    And User clicks on + Group button
    And User selects Office:  Head Office
    And User enters random Name
    And User selects Staff
    And User clicks Active checkbox
    And User enters Add clients:  Unused Client 1 Sample
    And Client Details is displayed for name:  Unused Client 1 Sample
    And User clicks Add>> button
    And User enters Add clients:  Unused Client 2 Sample
    And Client Details is displayed for name:  Unused Client 2 Sample
    And User clicks Add>> button
    When User deletes added client name:  Unused Client 1 Sample
    And User deletes added client name:  Unused Client 2 Sample
    Then Added client is removed for name:  Unused Client 1 Sample

User can cancel creating new group
    [Tags]  regression  test_18
    Given User is on Mifos X Client home page
    And User clicks on + Group button
    And User selects Office:  Head Office
    And User enters random Name
    And User selects Staff
    And User clicks Active checkbox
    And User enters Add clients:  Unused Client 1 Sample
    And Client Details is displayed for name:  Unused Client 1 Sample
    And User clicks Add>> button
    When User clicks Cancel button
    Then User is redirected to list of groups page

*** Keywords ***
user clicks on + Group button
    click + Group button

User selects Office:
    [Arguments]  ${office_type}
    select office:  ${office_type}


User enters random Name
    enter random name

User enters Name:
    [Arguments]  ${name}
    enter name:  ${name}


User selects Staff
    Log  User selects available staff

User clicks Active checkbox
    click active checkbox


User enters Add clients:
    [Arguments]  ${add_clients_value}
    add client:  ${add_clients_value}


User clicks Add>> button
    click add button


User enters random External id
    enter random external id


User clicks Submit button
    click submit button


New group is successfully created
    verify new group is successfully created


User encounters error message:
    [Arguments]  ${error_message}
    verify error message is displayed in create group page:  ${error_message}




Actual Name value is equal to expected:
    [Arguments]  ${expected_name_value}
    verify actual name is the same as expected:  ${expected_name_value}


User enters External id:
    [Arguments]  ${external_id}
    enter external id:  ${external_id}


Actual External id value is equal to expected:
    [Arguments]  ${expected_id_value}
    verify actual external id is the same as expected:  ${expected_id_value}

Client Details is displayed for name:
    [Arguments]  ${client_name}
    verify add client - client details is displayed for client name:  ${client_name}

User enters Activation date:
    [Arguments]  ${activation_date}
    enter activation date:  ${activation_date}

User enters Submitted on date:
    [Arguments]  ${submitted_on_date}
    enter submitted on date:  ${submitted_on_date}

User deletes added client name:
    [Arguments]  ${client_name}
    click x button for client name:  ${client_name}

Added client is removed for name:
    [Arguments]  ${client_name}
    verify element should not be visible for added client name:  ${client_name}

User clicks Cancel button
    click cancel button

User is redirected to list of groups page
    User is redirected to url:  https://test.qe-360.com:8443/community-app/#/groups

