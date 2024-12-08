@ignore
Feature: To test the GET endpoint of the application
To test different GET end point with different data format supported by the application
		
# We can use Background keyword to specify common steps across all Scenario/Scenario Outline
Background: Setup the base path
Given url 'http://localhost:9897'
# print is used to print the string which is to be displayed in the console
And print '------------------------'

# Every endpoint URL is divided into two parts i.e., base path & context path
# base path - http://localhost:9897
# context path - /normal/webapi/all

# We can give the End point URL completely (or) we can break it into base and context path
# Define the base path in Background and context path in Scsenario

# Method -1: Giving the End point URL completely
#-----------------------------------------------
# Scenario: To get all data from the appilcation in JSON format
# url keyword is used to define the end point URL
# Given url http://localhost:9897/get/normal/webapi/all

# method keyword is used to specify HTTP method
# get keyword represents HTTP GET method
# When method get

# status keyword is used for matching HTTP status and it should be 200
# Then status 200
# Then status 201 #Test case should fail if status is 201

# Method -2: Breaking into base and context path
#----------------------------------------------------
Scenario: To get all data from the appilcation in JSON format using path variable
# Both And and Given are used to specify the context path
Given path '/normal/webapi/all'
# header keyword is used to specify the header
And header Accept = 'application/json'
When method get
Then status 200
# Then status 201 #Test case should fail if status is given as 201

Scenario: To get all data from the appilcation in XML format using path variable
# Both And and Given are used to specify the context path
And path '/normal/webapi/all'
And header Accept = 'application/xml'
When method get
Then status 200
# Then status 201 #Test case should fail if status is given as 201






