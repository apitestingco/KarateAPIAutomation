# Author : PRAMOD DUTTA
# Website :  https://scrolltest.com

Feature: Verify Persons

  Background:
    Given url 'http://localhost:8081/'

  Scenario: Get all persons
    Given path 'persons'
    When method get
    Then status 200
    Then match response == '#array'
