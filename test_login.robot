*** Settings ***
Library  SeleniumLibrary

Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en
${BROWSER}        Chrome
${SIGNINBUTTON}     xpath=//*[text() = 'Sign in']
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//*[@id="__next"]/div[1]/header/div/h6
${NAMEINPUT}    xpath=//div[1]/div/div/div/input
${PLAYERSTITLE}     xpath=/html/head/title


*** Test Cases ***
Login to the system
    Open Login Page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]    Close Browser


Changing Language
    Open Login Page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click on the Polish button
    [Teardown]    Close Browser

Remind password
    Open Login Page
    Click on Remind password button
    [Teardown]    Close Browser

Searching name in players page
    Open Login Page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click On The Players Button
    Sleep   3s
    Scroll
    Click On Filter Table Button
    Type Name In The Name Field
    Close Filter Tab Window
    [Teardown]    Close Browser

Submitting empty add player form
    Open Login Page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click on the Add player button
    Click on the Submit form button
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser        ${LOGIN URL}      ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}   user07@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}    Test-1234
Click on the Submit button
    Click Element    xpath=//*[text() = 'Sign in']
Assert dashboard
    Wait Until Element Is Visible    ${PAGELOGO}
    Title Should Be    Scouts panel
Assert Players Page
    Wait Until Element Is Visible    ${PLAYERSTITLE}
    Title Should Be    Players
Click on the Players button
    Click Element    xpath=//div[1]/div/div/div/ul[1]/div[2]
Click on the Polish button
    Click Element    xpath=//div[1]/div/div/div/ul[2]//child::div
Click on Remind password button
    Click Element    xpath=//a
Click on Filter table button
    Click Element   xpath=//*[@aria-label = 'Filter Table']
Type name in the Name field
    Input Text      ${NAMEINPUT}    cat
Close Filter tab window
    Click Element    xpath=//*[@aria-label = 'Close']
Click on the Submit form button
    Click Element   xpath=//*[text() = 'Submit']
Click on the Add player button
    Click Element    xpath=//*[@href='/en/players/add']
Scroll
    Scroll Element Into View    xpath=//*[@aria-label = 'Filter Table']
#    Capture Element Screenshot    alert.png
#Provided precondition
#    Setup system under test