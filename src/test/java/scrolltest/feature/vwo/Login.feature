Feature: Login to VWO
    Scenario: VALID Login
        Given url 'https://app.vwo.com/login'
        And request
        """
        {"username":"93npu2yyb0@esiix.com","password":"Wingify@123","remember":false,"recaptcha_response_field":""}
        """
        When method POST
        * def cookieValue = responseCookies
        Then status 200
