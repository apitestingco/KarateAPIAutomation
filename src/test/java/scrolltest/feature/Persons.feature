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

  Scenario: Get Single Person
    Given path '/persons/1'
    When method get
    Then status 200
    # use def keyword fo the variable
    * def id = response.id
    Then match id == 1
    # contains example
    Then match response contains {"firstName": "dasd"}
    Then match response.firstName ==  'dasd'
    Then match response.firstName !=  'pramod'

  Scenario: Get all persons with verification of JSON
    Given path 'persons'
    When method get
    Then status 200
    Then match response == '#array'
    Then match each response[*] ==
    """
        {
        "firstName": "#string",
        "lastName": "#string",
        "age": "#number",
        "id": "#number",
        "address": "#string",
        "phoneNumbers": "#string"
        }
    """

    Scenario: Create a New Person
      Given path 'persons'
      And request
      """
      {
        "firstName": "abc",
        "lastName": "Singh",
        "age" : 23,
        "address": "G-1",
        "phoneNumbers": "9823232323"
      }
      """
      When method POST
      Then status 201
      * def personId = response.id

      Given path 'persons/'+personId
      When method get
      Then status 200
