Feature: GraphQL
  Background:
    * url 'https://api.graphql.jobs'

  Scenario: GraphQL
    Given path '/'
    Given text query =
    """
    query {
        jobs{
            id,title
        }
    }
    """

    And request { query: '#(query)' }
    When method POST
    Then status 200
    Then match $ == "#object"
    Then match $.data.jobs[76].title == "Backend Engineer"

