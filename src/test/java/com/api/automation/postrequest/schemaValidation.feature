Feature: Validate the JSON schema
To validate the JSON for POST /normal/webapi/add

Background: Setup the base url
Given url 'http://localhost:9897'

Scenario: To create the job entry in JSON format using external JSON file
Given path '/normal/webapi/add'
And def body = read('data/jobEntry.json')
And request body
And headers {Accept : 'application/json', Content-Type : 'application/json'}
When method post
And status 201

#Use Fuzzy matcher to create the schema for validation purpose
# Karate framework supports scheme validation only for JSON
# Schema generator for JSON: https://www.liquid-technologies.com/online-json-to-schema-converter

# JSON response
#{
#    "jobId": 1,
#    "jobTitle": "Software Engg",
#    "jobDescription": "To develop andriod application",
#    "experience": [
#        "Google",
#        "Apple",
#        "Mobile Iron"
#    ],
#    "project": [
#        {
#            "projectName": "Movie App",
#            "technology": [
#                "Kotlin",
#                "SQL Lite",
#                "Gradle"
#            ]
#        }
#    ]
#}

# Schema validation
And match response ==
"""
{
"jobId": "#number",
"jobTitle": "#string",
"jobDescription": "#string",
"experience": "#[] #string",
"project": "#[] #object"
}
}
"""

Scenario: Schema validation for GET endpoint
Given path '/normal/webapi/all'
And header Accept = 'application/json'
When method get
Then status 200
And def projectSchema = { "projectName": "#string", "technology": "#[] #string" }
# #[] -> It defines array
# In ##(projectSchema) ---> # is the fuzzy matcher & #(projectSchema) is the embedded expression 
And def mainSchema = {"jobId": "#number", "jobTitle": "#string", "jobDescription": "#string", "experience": "#[] #string", "project": "#[] ##(projectSchema)" }

#Fuzzy match need to be enclosed in single or double quotes, so --> "#[] ##(mainSchema)"
And match response ==
"""
"#[] ##(mainSchema)"
"""

