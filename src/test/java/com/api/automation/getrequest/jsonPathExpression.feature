Feature: To validate with JsonPath Expressions

Background: Setup the base path
Given url 'http://localhost:9897'

Scenario: To get the data in JSON format with complete match validation on response
Given path '/normal/webapi/all'
And header Accept = 'application/json'
When method get
Then status 200

# For more understanding on Operators
# Refer: https://github.com/json-path/JsonPath
# ---------------------------------------------------------------------
#$	The root element to query. This starts all path expressions.
#@	The current node being processed by a filter predicate.
#.<name>	Dot-notated child
#[?(<expression>)]	Filter expression. Expression must evaluate to a boolean value.
#----------------------------------------------------------------------

#Explanation
# $[?(@.jobId==1)] -> This expression returns the JSON object {} where 'jobId' is located 
# $[?(@.jobId==1)].jobTitle -> This expressions gets the value of jobTitle located in the return JSON object

# To evaluate the JsonPath Expressions online
# Refer: https://jsonpath.com/

#Syntax => karate.jsonPath(document, jsonPathExpression)
And def jobTitle = karate.jsonPath(response, "$[?(@.jobId==1)].jobTitle")
And def jobDescription = karate.jsonPath(response, "$[?(@.jobId==1)].jobDescription")
And def experience = karate.jsonPath(response, "$[?(@.jobId==1)].experience")

And print "Job title is => ", jobTitle
And print "Job description is => ", jobDescription
And print "Experience is => ", experience