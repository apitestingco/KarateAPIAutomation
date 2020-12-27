Feature: Yaml

    Background: Load Yaml
    * def expectedYaml = karate.read("file:src/test/java/scrolltest/resource/data.yaml")

    Scenario: Match Yaml
        * text actualYaml = 
            """
            name: Pramod
            input:
                id: 1
                subType: 
                name: Roy
                deleted: false
            """
        * yaml expectedYaml = expectedYaml  
        * yaml actualYaml = actualYaml
        * match  expectedYaml ==  
        """
            {
                name: 'Pramod',
                input: { 
                id: 1,
                subType: { name: 'Roy', deleted: false }    
                }
            }
        """


