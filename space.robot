*** Settings ***
Library           SeleniumLibrary
Library           Collections

*** Keywords ***
Open Browser To Login Page
    Open Browser    https://demo.testim.io/    Firefox
    Maximize Browser Window

login to page
    Open Browser To Login Page
    Click Element    //*[@id="app"]/div/header/div/div[2]/ul/li/button
    Input Text    //*[@id="login"]/div[1]/input    testuser
    Input Text    //*[@id="login"]/div[2]/input    password123
    Click Button    //*[@id="app"]/div/section[3]/div/div[2]/div/nav/button[2]


*** Test Cases ***
Login With Valid Credentials
    Open Browser To Login Page
    Click Element    //*[@id="app"]/div/header/div/div[2]/ul/li/button
    Input Text    //*[@id="login"]/div[1]/input    testuser
    Input Text    //*[@id="login"]/div[2]/input    password123
    Click Button    //*[@id="app"]/div/section[3]/div/div[2]/div/nav/button[2]
    Close Browser

Login With Invalid Credentials
    Open Browser To Login Page
    Click Element    //*[@id="app"]/div/header/div/div[2]/ul/li/button
    Input Text    //*[@id="login"]/div[1]/input    invalid_user
    Input Text    //*[@id="login"]/div[2]/input    invalid_password
    Click Button    //*[@id="app"]/div/section[3]/div/div[2]/div/nav/button[2]
    Page Should Not Contain Element    //*[@id="app"]/div/section[2]/div[1]/h2
    Close Browser

login without credentials
    Open Browser To Login Page
    Click Element    //*[@id="app"]/div/header/div/div[2]/ul/li/button
    Click Button    //*[@id="app"]/div/section[3]/div/div[2]/div/nav/button[2]
    Location Should Be    https://demo.testim.io/login
    Close Browser

logout after login
    Open Browser To Login Page
    Click Element    //*[@id="app"]/div/header/div/div[2]/ul/li/button
    Input Text    //*[@id="login"]/div[1]/input    testuser
    Input Text    //*[@id="login"]/div[2]/input    password123
    Click Button    //*[@id="app"]/div/section[3]/div/div[2]/div/nav/button[2]
    Click Element    //*[@id="app"]/div/header/div/div[2]/ul/div/button/span[1]
    Click Element    //*[@id="app"]/div/header/div/div[2]/ul/div/ul/li/a
    Location Should Be    https://demo.testim.io/
    Close Browser

*** Test Cases ***

Fooldal Betoltese
    login to page
    Page Should Contain Element    //*[@id="app"]/div/section[2]/div[1]/h2
    Close Browser

Menu Navigacio
    login to page
    Location Should Be    https://demo.testim.io/
    Close Browser

Vissza Gomb Mukodese
    login to page
    Go Back
    Location Should Be    https://demo.testim.io/
    Close Browser


*** Test Cases ***

Termekek Listazasa
    login to page
    Page Should Contain Element    //*[@id="app"]/div/section[2]
    Close Browser

Termek Reszletek Megtekintese
    login to page
    Click Element    //*[@id="app"]/div/section[2]/div[1]
    Page Should Contain Element    //*[@id="app"]/div/section
    Close Browser

Termek Szures Kategoria Alapjan
    login to page
    Click Element    //*[@id="app"]/div/section[2]/div[3]/div/div/div[1]/div/input
    Page Should Contain Element    //*[@id="app"]/div/section[2]/div[3]/div/div/div[1]/ul
    Click Element    //*[@id="app"]/div/section[2]/div[3]/div/div/div[1]/ul/li[7]
    Close Browser