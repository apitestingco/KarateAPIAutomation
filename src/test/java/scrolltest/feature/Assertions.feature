Feature: Assertions
Scenario: Assertions Take
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    * print 'I got IP is :', karate.pretty(response)
    Then assert response == '103.69.25.68'