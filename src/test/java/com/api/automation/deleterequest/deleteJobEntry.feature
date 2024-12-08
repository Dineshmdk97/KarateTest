Feature: To delete the job entry from the test application

Background: Setup the base url
Given url 'http://localhost:9897'

Scenario: To delete the job entry from the test application
# CREATE
# Generating random numbers for jobId
And def getRandomNumber = function() {return Math.floor((100)*Math.random());}
And def createJobId = getRandomNumber()
# All variables should be specified in the form of JSON object
Given call read("../postrequest/data/createJobEntryWithVariables.feature") {_url: 'http://localhost:9897', _path: '/normal/webapi/add', _id: '#(createJobId)'}

#DELETE
Given path '/normal/webapi/remove/'+createJobId
And header Accept = 'application/json'
#delete keyword is coming from Karate framework
When method delete
Then status 200

#GET
Given path '/normal/webapi/find'
And params {id: '#(createJobId)', jobTitle: 'Software Test Engineer'}
And header Accept = 'application/json'
When method get
Then status 404


# Request chaining - Pass the response of a request as an input to another request
Scenario: To validate request chaining
# Create a job entry
# Extract the jobId and jobTitle from the response of POST request
# Send PATCH request, for which the value of query parameter will be set by the info extracted from the response of POST request
# Extract the jobId and jobTitle from the response of PATCH request
# GET request, for which the value of query parameter will be set by the info extracted from the response of PATCH request
# Add validation on the jobDescription from the response of GET request

# CREATE
And def getRandomNumber = function() {return Math.floor((100)*Math.random());}
And def createJobId = getRandomNumber()
And def createJob = call read("../postrequest/data/createJobEntryWithVariables.feature") {_url: 'http://localhost:9897', _path: '/normal/webapi/add', _id: '#(createJobId)'}
# createJob context contains both responseJobId and responseJobTitle
And def jobId = createJob.responseJobId
And def jobTitle = createJob.responseJobTitle

# PATCH
And def jobDesc = 'To develop android and iOS applications'
Given path '/normal/webapi/update/details'
And params {id: '#(jobId)', jobTitle: '#(jobTitle)', jobDescription: '#(jobDesc)'}
And header Accept = 'application/json'
And request {}
When method patch
Then status 200
And def jobId = response.jobId
And def jobTitle = response.jobTitle

#GET
Given path '/normal/webapi/find'
And params { id: '#(jobId)', jobTitle: '#(jobTitle)' }
And header Accept = 'application/json'
When method get
Then status 200
And match response.jobDescription == jobDesc
