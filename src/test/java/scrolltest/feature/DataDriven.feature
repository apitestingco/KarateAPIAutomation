Feature: Data Driven
Background:
    * url 'http://localhost:8081/'

Scenario Outline: Create, Read, Update and Delete
    Given path 'persons'
    And request
    """
    {
    "firstName": "<firstName>",
    "lastName": "<lastName>",
    "age": <age>,
    "address": "Chicago,USA",
    "phoneNumbers": "123-456-78910"
    }
    """ 
    When method POST
    Then status 201
    Then match response == '#object'

    Examples:
        | firstName | lastName | age |
        | Name Value 1  | Value 2  | 21  |
        | Name Value 2  | Value 2  | 22  |
        | Name Value 3  | Value 2  | 23  |

    # Examples:
    # | karate.read("file:src/test/java/scrolltest/resource/dataperson.csv")|    