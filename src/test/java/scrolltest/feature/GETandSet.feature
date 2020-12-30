Feature: GET AND SET ExAMPLE
    # Scenario: Test
    # Given url 'https://reqres.in/api/users/'
    # When method GET
    # * def ids = get response.data[*].id
    # * def emails = get response.data[*].email
    # * print 'Ids -> ',ids
    # * print 'emails -> ',emails
    # Then match ids == [1,2,3,4,5,6]

    # Scenario: Test
    # Given url 'https://reqres.in/api/users/'
    # When method GET
    # * def ids = $response.data[*].id
    # * def emails = $response.data[*].email
    # * print 'Ids -> ',ids
    # * print 'emails -> ',emails
    # Then match ids == [1,2,3,4,5,6]

    # #Get Single Value
    # Scenario: Test
    # Given url 'https://reqres.in/api/users/'
    # When method GET
    # * def data = get[0] response.data[?(@.id==3)]
    # * print 'emails -> ',data.email
    # Then match data.email == 'emma.wong@reqres.in'

    # Scenario: Set the variables
    # * def myJson = { foo: 'bar' }
    # * set myJson.foo = 'world'
    # * match myJson == { foo: 'world' }  


    Scenario: set multiple
    * def cat = { name: '' }
    * set cat
    | path   | value |
    | name   | 'Bob' |
    | age    | 5     |

    * match cat == { name: 'Bob', age: 5 }


    # https://github.com/intuit/karate/blob/master/karate-demo/src/test/java/demo/headers/headers.feature
    Scenario: Set headers config, json, normal json
    * def token = 1
    * def time = 2
    * def demoBaseUrl = 3
    # * configure headers = read('file:src/test/java/scrolltest/resource/headers.js')
    # * configure headers = { Authorization: '#(token + time + demoBaseUrl + os.type)' }
    # * headers { Authorization: '#(token + time + demoBaseUrl)' }
    # * headers { foo: 'bar' }
    * url 'http://localhost:8081/ping'
    Given path 'headers', "token1"
    When method get
    Then status 200
    