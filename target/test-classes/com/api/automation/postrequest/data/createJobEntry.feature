Feature: To create job entry in the test application

Scenario: To create job entry with JSON data
Given url 'http://localhost:9897'
And path '/normal/webapi/add'

# Generating random numbers for jobId
And def getRandomNumber = function() {return Math.floor((100)*Math.random());}
And def id = getRandomNumber()

And request {"jobId":"#(id)","jobTitle":"Software Engineering","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
And headers {Accept : 'application/json', Content-Type : 'application/json'}
When method post
And print response
Then status 201