Feature: To create job entry in the test application

Scenario: To create job entry with JSON data
# Passing the variables to called feature file from this calling feature file
Given url _url
And path _path
And request {"jobId":"#(_id)","jobTitle":"Software Engineering","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
And headers {Accept : 'application/json', Content-Type : 'application/json'}
When method post
And print response
Then status 201
And def responseJobId = response.jobId
And def responseJobTitle = response.jobTitle