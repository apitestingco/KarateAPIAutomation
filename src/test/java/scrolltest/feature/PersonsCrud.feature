# Author : PRAMOD DUTTA
# Website :  https://scrolltest.com
# Objecti ve in Feature - CRUD of Persons API
# 1. Create A Person(POST)
# 2. Read a Person via GET Call, 
# 3. Update it Via PATCH, 
# 4. DELETE the personit via DELETE Call
# Download the POSTMAN Collection - https://www.getpostman.com/collections/82aa600946a690598ee8
# Download the JSON Server File - sdet.live/karate-ppt

Feature: Person CRUD
  Background:
    * url 'http://localhost:8081/'

  Scenario: Create, Read, Update and Delete
    Given path 'persons'
    And request
    """
    {
    "firstName": "Person firstName",
    "lastName": "Person lastName",
    "age": 30,
    "address": "Chicago,USA",
    "phoneNumbers": "123-456-78910"
    }
    """ 
    When method POST
    Then status 201
    Then match response == '#object'
    * def jsonSchemaExpected =
    """
      {
        "id" : "#number"
      }
    """
    Then match response == jsonSchemaExpected

    * def personId = response.id

    Given path 'persons/'+personId
    When method GET
    Then status 200
    Then match response.firstName == "Person firstName"
    Then match response.lastName == "Person lastName"

    Given path 'persons/'+personId
    And request
    """
    {
    "firstName": "Updated firstName",
    "lastName": "Updated lastName",
    "age": 30,
    "address": "Chicago,USA",
    "phoneNumbers": "123-456-78910"
    }
    """ 
    When method PATCH
    Then status 200
    Then match response.firstName == "Updated firstName"
    Then match response.lastName == "Updated lastName"

    Given path 'persons/'+personId
    When method DELETE
    Then status 200
    Then match response == "#object" 
    Then match response == {}


