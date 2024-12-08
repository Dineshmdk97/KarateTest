Feature: To access GET endpoint which is secured with basic authentication

Background: Setup the base path
Given url 'http://localhost:9897'

Scenario: To access GET endpoint which is secured with basic authentication
Given path '/secure/webapi/all'
# Username: admin and password: welcome is encrypted as -> Basic YWRtaW46d2VsY29tZQ==
And headers {Accept:'application/json',Authorization:'Basic YWRtaW46d2VsY29tZQ=='}
When method get
Then status 200
And match response == '#notnull'

Scenario: To access GET endpoint which is secured without basic authentication
Given path '/secure/webapi/all'
# Username: admin and password: welcome is encrypted as -> Basic YWRtaW46d2VsY29tZQ==
And headers {Accept:'application/json'}
When method get
Then status 401

Scenario: To access GET endpoint which is secured with basic authentication via JavaScript function
Given path '/secure/webapi/all'
And def auth = call read('../../basicauth.js') {username:'admin',password:'welcome'}
And print "Encoded string is : ", auth
# Username: admin and password: welcome is encrypted as -> Basic YWRtaW46d2VsY29tZQ==
And headers {Accept:'application/json',Authorization:'#(auth)'}
When method get
Then status 200
And match response == '#notnull'