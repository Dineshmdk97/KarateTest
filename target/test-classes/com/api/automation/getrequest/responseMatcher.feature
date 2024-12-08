Feature: To validate the GET Endpoint
To validate the GET Endpoint response
		
Background: Setup the base path
Given url 'http://localhost:9897'

Scenario: To get the data in JSON format with complete match validation on response
Given path '/normal/webapi/all'
And header Accept = 'application/json'
When method get
Then status 200
# response variable stores the response of a request
And print response

# match keyword is used to add additional validation or assertion in a scenario. We can
# Validate complete response
# Use with negate condition
# Validate a specific property in response

And match response ==
"""
[
  {
    "jobId": 1,
    "jobTitle": "Software Engg",
    "project": [
      {
        "technology": [
          "Kotlin",
          "SQL Lite",
          "Gradle"
        ],
        "projectName": "Movie App"
      }
    ],
    "jobDescription": "To develop andriod application",
    "experience": [
      "Google",
      "Apple",
      "Mobile Iron"
    ]
  }
]
"""

Scenario: To get the data in XML format with complete match validation on response
Given path '/normal/webapi/all'
And header Accept = 'application/xml'
When method get
Then status 200
# response variable stores the response of a request
And print response
And match response ==
"""
<List>
  <item>
    <jobId>1</jobId>
    <jobTitle>Software Engg</jobTitle>
    <jobDescription>To develop andriod application</jobDescription>
    <experience>
      <experience>Google</experience>
      <experience>Apple</experience>
      <experience>Mobile Iron</experience>
    </experience>
    <project>
      <project>
        <projectName>Movie App</projectName>
        <technology>
          <technology>Kotlin</technology>
          <technology>SQL Lite</technology>
          <technology>Gradle</technology>
        </technology>
      </project>
    </project>
  </item>
</List>
"""

Scenario: To get the data in JSON format with negate validation on response
Given path '/normal/webapi/all'
And header Accept = 'application/json'
When method get
Then status 200
And print response
# Negate condition can be validated by using != operator
And match response !=
"""
[
  {
    "jobId": xxxxxxxxxxxxx,
    "jobTitle": "Software Engg",
    "project": [
      {
        "technology": [
          "Kotlin",
          "SQL Lite",
          "Gradle"
        ],
        "projectName": "Movie App"
      }
    ],
    "jobDescription": "To develop andriod application",
    "experience": [
      "Google",
      "Apple",
      "Mobile Iron"
    ]
  }
]
"""

Scenario: To get the data in JSON format with validation on sepcific property in a response
Given path '/normal/webapi/all'
And header Accept = 'application/json'
When method get
Then status 200
And print response
# deep keyword is used whenever we need to validate a property which is present under nested JSON array
And match response contains deep {"jobDescription": "To develop andriod application"}
# Since {"projectName": "Movie App"} is inside project array. We need to define it along with project array in deep
# Note: [] is JSON array, {} is JSON object
And match response contains deep {"project": [{"projectName": "Movie App"}]}



