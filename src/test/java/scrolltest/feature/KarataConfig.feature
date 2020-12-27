Feature: Karate Config Check
Scenario: Test
    Given url baseUrl
    When method GET
    Then match response == '#notnull'


