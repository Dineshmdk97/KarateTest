Feature: To upload the file using Karate

Background: Setup the base url
Given url 'http://localhost:9897'

Scenario: To upload the text file in test application
Given path '/normal/webapi/upload'
# Multiform/form-data is an encoding type that allows file to be sent through a POST
# 'multipart file' ->  keyword is coming from the Karate framework
# 'file' -> is the parameter name for upload endpoint in the test application - http://localhost:9897/swagger-ui.html#/
# Location of the file, Name of the file, Content-Type details to be sent in JSON format {}
And multipart file file = {read: "fileToUpload.txt", filename: "fileToUpload.txt", Content-Type: "multipart/form-data"}
When method post
Then status 200
And print response