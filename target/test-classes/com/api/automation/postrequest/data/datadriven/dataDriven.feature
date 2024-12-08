Feature: To test job description in the test application

Background: Read the data for data driven
And def testdata = read("testData.csv")

# Using a variable in Scenario Outline is possible only in Karate whereas not possible in Cucumber
Scenario Outline: To test job description in the test application using data driven for method - <method>
Given print '<url>'
Then print '<path>'
When print '<method>'
And print '<status>'

Examples:
|url 				   |path 				|method 	|status |
|http://localhost:9897 |/normal/webapi/all	|get		|200	|
|http://localhost:9897 |/normal/webapi/add	|post		|201	|
|http://localhost:9897 |/normal/webapi/add	|put		|201	|

Scenario Outline: To test job description in the test application using data driven for job id - <jobId>
# In JSON body, we cannot use variable directly like this <xxx>; we need to use embedded expression #(xxx)
Given url 'http://localhost:9897'
And path '/normal/webapi/add'
And request {"jobId":"#(jobId)","jobTitle":"#(jobTitle)","jobDescription":"#(jobDescription)","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
And headers {Accept: "application/json", Content-Type: "application/json"}
When method post
And status <status>

Examples:
|jobId				   |jobTitle			|jobDescription						|status |
|1 					   |Software Engg		|To develop andriod application		|201	|
|fake id 1 			   |Software Engg		|To develop andriod application		|400	|
|fake id 2 			   |Software Engg		|To develop andriod application		|400	|

Scenario Outline: To test job description in the test application using data driven from csv file
Given url 'http://localhost:9897'
And path '/normal/webapi/add'
# Variables name should be same as the column headers in the CSV
And request {"jobId":"#(jobId)","jobTitle":"#(jobTitle)","jobDescription":"#(jobDescription)","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
And headers {Accept: "application/json", Content-Type: "application/json"}
When method post
And status <status>

Examples:
# Two ways of reading data from external files
# Method - 1: We can directly use 'read' keyword in Examples
#|read("testData.csv")|

# Method - 2: Define the variable in the Background and use that variable in Examples
|testdata|