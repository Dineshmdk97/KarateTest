Feature: To create the job entry in the application
Use POST /normal/webapi/add to create job entry in the application

Background: Setup the base url
Given url 'http://localhost:9897'

Scenario: To create the job entry in JSON format
Given path '/normal/webapi/add'
# request keyword is used to attach the body
And request {"jobId":1,"jobTitle":"Software Engg","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
# headers keyword is used for attaching one or more headers
And headers {Accept : 'application/json', Content-Type : 'application/json'}
When method post
And status 201
And print response
And match response.jobTitle == 'Software Engg'

Scenario: To create the job entry in XML format
Given path '/normal/webapi/add'
# request keyword is used to attach the body
And request <item><jobId>1</jobId><jobTitle>Software Engg</jobTitle><jobDescription>To develop andriod application</jobDescription><experience><experience>Google</experience><experience>Apple</experience><experience>Mobile Iron</experience></experience><project><project><projectName>Movie App</projectName><technology><technology>Kotlin</technology><technology>SQL Lite</technology><technology>Gradle</technology></technology></project></project></item>
# headers keyword is used for attaching one or more headers
And headers {Accept : 'application/json', Content-Type : 'application/xml'}
When method post
And status 201
And print response
And match response.jobId == 1

Scenario: To create the job entry in XML format and also receive the response in XML format
Given path '/normal/webapi/add'
# request keyword is used to attach the body
And request <item><jobId>1</jobId><jobTitle>Software Engg</jobTitle><jobDescription>To develop andriod application</jobDescription><experience><experience>Google</experience><experience>Apple</experience><experience>Mobile Iron</experience></experience><project><project><projectName>Movie App</projectName><technology><technology>Kotlin</technology><technology>SQL Lite</technology><technology>Gradle</technology></technology></project></project></item>
# headers keyword is used for attaching one or more headers
And headers {Accept : 'application/xml', Content-Type : 'application/xml'}
When method post
And status 201
And print response
And match response/Job/jobId == 1

Scenario: To create the job entry in JSON format using external JSON file
Given path '/normal/webapi/add'
And def body = read('data/jobEntry.json')
# request keyword is used to attach the body
And request body
# headers keyword is used for attaching one or more headers
And headers {Accept : 'application/json', Content-Type : 'application/json'}
When method post
And status 201
And print response
And match response.jobTitle == 'Software Engg'

Scenario: To create the job entry in XML format using external XML file
Given path '/normal/webapi/add'
And def body = read('data/jobEntry.xml')
# request keyword is used to attach the body
And request body
# headers keyword is used for attaching one or more headers
And headers {Accept : 'application/json', Content-Type : 'application/xml'}
When method post
And status 201
And print response
And match response.jobId == 1

Scenario: To create the job entry in JSON format with embedded expression
Given path '/normal/webapi/add'
And def getJobId = function() {return Math.floor((100) * Math.random());}
And def jobID = getJobId()
# We need to define embedded expressions in #()
# In JSON we need to specify embedded expressions in single or double quotes
And request {"jobId":"#(jobID)","jobTitle":"Software Engg","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
And headers {Accept : 'application/json', Content-Type : 'application/json'}
When method post
And status 201
And print response
And match response.jobTitle == 'Software Engg'

Scenario: To create the job entry in XML format with embedded expression
Given path '/normal/webapi/add'
And def getJobId = function() {return Math.floor((100) * Math.random());}
And def jobID = getJobId()
# We need to define embedded expressions in #()
# In XML we need not specify single or double quotes for embedded expressions
And request <item><jobId>#(jobID)</jobId><jobTitle>Software Engg</jobTitle><jobDescription>To develop andriod application</jobDescription><experience><experience>Google</experience><experience>Apple</experience><experience>Mobile Iron</experience></experience><project><project><projectName>Movie App</projectName><technology><technology>Kotlin</technology><technology>SQL Lite</technology><technology>Gradle</technology></technology></project></project></item>
And headers {Accept : 'application/json', Content-Type : 'application/xml'}
When method post
And status 201
And print response
And match response.jobId == '#(jobID)'