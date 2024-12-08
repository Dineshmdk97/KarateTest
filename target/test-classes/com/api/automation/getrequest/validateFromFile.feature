Feature: To validate the GET Endpoint from an external file
To validate the GET Endpoint response from an external file
		
Background: Setup the base path
Given url 'http://localhost:9897'

Scenario: To get the data in JSON format from an external JSON file
Given path '/normal/webapi/all'
And header Accept = 'application/json'
When method get
Then status 200
# Create a variable to store the data from a JSON file
# In Karate, there is an API called 'read' by which we can read data from an external file
And def actualResponse = read("../jsonResponse.json")
And print "JSON response => ", actualResponse
And match response == actualResponse

Scenario: To get the data in JSON format from an external XML file
Given path '/normal/webapi/all'
And header Accept = 'application/xml'
When method get
Then status 200
# Create a variable to store the data from a XML file
And def actualResponse = read("../xmlResponse.xml")
And print "XML response => ", actualResponse
And match response == actualResponse
