Feature: Read and Verify from CSV

    Background: Read From CSV
    * def expectedData = karate.read("file:src/test/java/scrolltest/resource/data.csv")

    Scenario: Verify data
        * match expectedData == 
        """
        [ 
            {
                "id" : "1",
                "name": "Pramod"
            },
            {
                "id" : "2",
                "name": "Dutta"
            },
            {
                "id" : "3",
                "name" : "Lucky"    
            }
        ]
        """