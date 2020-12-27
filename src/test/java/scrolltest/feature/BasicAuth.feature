Feature: Demo of Basic Auth

    Background: Get url
    * def global = karate.read("file:src/test/java/scrolltest/utils/globalVariables.json")
    * def userName = get global.userName
    * def userPassword = get global.userPassword
    * def final_url = "https://"+userName+":"+userPassword+"@"+global.baseURL
    * url get final_url


    Scenario: Basic Auth
    Given path "/"
    When method GET
    Then status 200
    Then match $ contains "Congratulations"
