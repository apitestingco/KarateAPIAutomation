Feature: JSON Schema Validation

Scenario: Validate with the Third Party
* jsonSchemaExpected =
"""
    {
    "$schema": "http://json-schema.org/draft-07/schema",
    "$id": "http://example.com/example.json",
    "type": "object",
    "title": "The root schema",
    "description": "The root schema comprises the entire JSON document.",
    "default": {},
    "examples": [
        {
            "id": 1,
            "name": "pramod"
        }
    ],
    "required": [
        "id",
        "name"
    ],
    "properties": {
        "id": {
            "$id": "#/properties/id",
            "type": "integer",
            "title": "The id schema",
            "description": "An explanation about the purpose of this instance.",
            "default": 0,
            "examples": [
                1
            ]
        },
        "name": {
            "$id": "#/properties/name",
            "type": "string",
            "title": "The name schema",
            "description": "An explanation about the purpose of this instance.",
            "default": "",
            "examples": [
                "pramod"
            ]
        }
    },
    "additionalProperties": true
}
"""
* jsonDataActual =
"""
    {
        "id": 1,
        "name": "pramod"
    }       
"""
* def SchemaUtils = Java.type('com.intuit.karate.demo.util.SchemaUtils')
* assert SchemaUtils.isValid(jsonDataActual, jsonSchemaExpected)
