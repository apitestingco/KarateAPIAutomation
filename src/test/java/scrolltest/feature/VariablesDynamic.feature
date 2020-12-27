Feature: Feature name

    Scenario: Table with Dynamic values
        * def personId = 1
        * def personObject = 
            """
                {
                    "firstName" : "Pramod",
                    "lastName" : "Dutta"
                }
            """
        * table test_table
        | id        | personName                                     |
        | personId  | personObject.firstName + personObject.lastName |
        * match test_table == [{ id: 1, personName : "PramodDutta"}] 