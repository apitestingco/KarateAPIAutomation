Feature: File Upload
  Background:
    * url 'https://filebin.net'

  Scenario: Upload File
    Given path '/'
    And header Content-Type = "image/png"
    And request karate.read('file:src/test/java/scrolltest/resource/budhha.jpg')
    When method POST
    Then status 201

