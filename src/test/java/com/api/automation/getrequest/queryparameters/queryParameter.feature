Feature: To get the data using query parameter

Background: Setup the base url
Given url 'http://localhost:9897'

Scenario: To get the data using query parameter
 # Create job by calling another feature file
#-------------------------------------------------

 # Generating random numbers for jobId
 And def getRandomNumber = function () { return Math.floor((100) * Math.random()); }
 And def createJobId = getRandomNumber();
 And def createJob = call read("../../postrequest/data/createJobEntryWithVariables.feature") {_url: 'http://localhost:9897', _path: '/normal/webapi/add', _id: '#(createJobId)'}

 # Get data using query paramter
 #------------------------------
 Given path '/normal/webapi/find'
 # 'param' keyword is to specify query parameter. The paramter should be in key-value pair
 
 # In case of few parameters, we can use direcly using 'param' keyword
 # And param id = createJobId
 # And param jobTitle = 'Software Test Engineer'
 
 # In case of more one than param, we can also use 'params' keyword
 And params {id: '#(createJobId)', jobTitle: 'Software Engineering'}
 
 And headers {Accept: 'application/json'}
 When method get
 Then status 200
 And match response.jobId == createJobId