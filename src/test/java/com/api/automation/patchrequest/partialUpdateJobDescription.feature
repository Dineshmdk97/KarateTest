Feature: To partially update the job description

Background: Setup the base url
Given url 'http://localhost:9897'

Scenario: To partially update the job description for newly added job entry
# Create Job Entry
And def getRandomNumber = function() {return Math.floor((100)*Math.random());}
And def createJobId =  getRandomNumber()
And def createJob = call read("../postrequest/data/createJobEntryWithVariables.feature") {_url: 'http://localhost:9897', _path: '/normal/webapi/add', _id: '#(createJobId)'}

# PATCH
# Updated job description
And def jobDesc = 'To develop Android and iOS applications'
Given url 'http://localhost:9897'
And path '/normal/webapi/update/details'
# Here, jobId and jobTitle are the required parameters to partially update jobDescription
# id, jobTitle, jobDescription: are the parameters for PATCH endpoint
And params {id: '#(createJobId)', jobTitle: 'Software Engineering', jobDescription: '#(jobDesc)'}
And headers {Accept: 'application/json'}

# PATCH request has request body which contains updated information
# Even if we don’t have any updated information in the request body. 
# We need to define empty request body while sending patch the request
And request {}

When method patch
Then status 200
And match response.jobDescription == jobDesc