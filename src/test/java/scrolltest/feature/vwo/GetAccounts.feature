Feature: Get Auth Account data.
    Background: Background
    * def cookie = call read('classpath:Login.feature')
    * def authToken = signIn.authToken


    Scenario: Yes
        Given url 'https://app.vwo.com/account?accountId=531510'
        When method GET
        Then status 200
        Then match response.id = '531510'


