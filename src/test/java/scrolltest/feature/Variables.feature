Feature: Variables in the Karate

    Background: Set the url for scenarios
    * url "http://api.ipify.org/"
    * def variable1 =  "Pramod"
    * def regex_ip = '#regex ((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.|$)){4}'

    Scenario: Variables Demo
    Given path "/"
    When method GET
    Then status 200
    Then match $ == "103.69.25.117"
    # Reference Match - https://stackoverflow.com/questions/5284147/validating-ipv4-addresses-with-regexp
    Then match $ == regex_ip

    # These are Like JSON Array
    Scenario: Tables 
    Given table persons
        | name   | age |
        | 'Bob'  | 2   |
        | 'Wild' | 4   |
        | 'Nyan' | 3   |
    Then match persons == [{name: 'Bob', age: 2}, {name: 'Wild', age: 4}, {name: 'Nyan', age: 3}]
