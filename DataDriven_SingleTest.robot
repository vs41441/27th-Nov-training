*** Settings ***
Resource                      ../resources/common.robot
Library                       DataDriver    reader_class=TestDataApi    name=Leads.csv    #iterates through the Leads csv
Suite Setup                   Setup Browser
Suite Teardown                End suite

*** Test Cases ***
Entering A Lead With Data
    [tags]                    Lead
    Appstate                  Home
    LaunchApp                 Sales

    ClickText                 Leads
    VerifyText                Change Owner
    ClickText                 New
    VerifyText                Lead Information
    UseModal                  On                          # Only find fields from open modal dialog

    TypeText                  First Name                  ${First Name}
    TypeText                  Last Name                   ${Last Name}
    Picklist                  Lead Status                 New
    TypeText                  Phone                       ${Phone}                    First Name
    TypeText                  Company                     ${Company}                  Last Name
    TypeText                  Website                     ${Website}

    Picklist                  Lead Source                 Partner
    ClickText                 Save                        partial_match=False
    UseModal                  Off
    Sleep                     1
    
