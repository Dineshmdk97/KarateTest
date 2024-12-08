Feature: To create the job entry in the application
Use POST /normal/webapi/add to create job entry in the application

Background: Setup the base url
Given url 'http://localhost:9897'

@smoke
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

@regression
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

@sanity
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

@ignore
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

