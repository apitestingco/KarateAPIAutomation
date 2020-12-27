Feature: Call Java

    Scenario: Call Java
    * def objHelper = Java.type('scrolltest.Helper')
    * def result = objHelper.printName('Pramod')
    * assert result == 'hello Pramod'

