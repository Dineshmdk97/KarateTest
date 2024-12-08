Feature: To test the updation of job entry in the test application

Background: Setup the base url
Given url 'http://localhost:9897'

@smoke @ignore
Scenario: To update the job entry for existing job
# CREATE
Given path '/normal/webapi/add'

# Generating random numbers for jobId
And def getRandomNumber = function() {return Math.floor((100)*Math.random());}
And def id = getRandomNumber()

And request {"jobId":"#(id)","jobTitle":"Software Engg","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
And headers {Accept : 'application/json', Content-Type : 'application/json'}
When method post
And print response
Then status 201

# PUT
Given path 'normal/webapi/update'
# Edit the request by modifying details and adding additional array
# jobId should not be changed as it the parameter for PUT request
And request
"""
{
    "jobId": "#(id)",
    "jobTitle": "Software Engineering Role",
    "jobDescription": "To develop andriod application",
    "experience": [
        "Google",
        "Apple",
        "Mobile Iron"
    ],
    "project": [
        {
            "projectName": "Movie App",
            "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle"
            ]
        },
        {
            "projectName": "Movie App2",
            "technology": [
                "Kotlin2",
                "SQL Lite2",
                "Gradle2"
            ]
        }
        
    ]
}
"""
And headers {Accept : 'application/json', Content-Type : 'application/json'}
When method put
And print response
Then status 200


# Validation of updated array is equal to 2, after adding an additional array
# For more understanding on Operators -> https://github.com/json-path/JsonPath
And def updatedProjectArray = karate.jsonPath(response, "$[?(@.jobId == "+id+")].project")
And print updatedProjectArray
# Result of jsonPath() API is an array so we need to use the index as [0]
And match updatedProjectArray[0] == '#[2]'


@smoke
Scenario: To update the job entry for existing job
# CREATE
Given path '/normal/webapi/add'

# Generating random numbers for jobId
And def getRandomNumber = function() {return Math.floor((100)*Math.random());}
And def id = getRandomNumber()

And request {"jobId":"#(id)","jobTitle":"Software Engg","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
And headers {Accept : 'application/json', Content-Type : 'application/json'}
When method post
And print response
Then status 201

# PUT
Given path 'normal/webapi/update'
# Edit the request by modifying details and adding additional array
# jobId should not be changed as it the parameter for PUT request
And request
"""
{
    "jobId": "#(id)",
    "jobTitle": "Software Engineering Role",
    "jobDescription": "To develop andriod application",
    "experience": [
        "Google",
        "Apple",
        "Mobile Iron"
    ],
    "project": [
        {
            "projectName": "Movie App",
            "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle"
            ]
        },
        {
            "projectName": "Movie App2",
            "technology": [
                "Kotlin2",
                "SQL Lite2",
                "Gradle2"
            ]
        }
        
    ]
}
"""
And headers {Accept : 'application/json', Content-Type : 'application/json'}
When method put
And print response
Then status 200
