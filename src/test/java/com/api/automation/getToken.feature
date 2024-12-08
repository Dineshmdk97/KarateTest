# Since this is just a helper file, we can add @ignore tag if required
@ignore
Feature: To get the JWT token for the user

# This is a helper feature file is used to register and generate token for the users.
Scenario: Register the user and generate the token
#Register the user
Given url 'http://localhost:9897/users/sign-up'
And headers {Accept:'application/json', Content-Type: 'application/json'}
And request {username: '#(username)', password: '#(password)'}
When method post
Then status 200

#Get the token
Given url 'http://localhost:9897/users/authenticate'
And headers {Accept:'application/json', Content-Type: 'application/json'}
And request {username: '#(username)', password: '#(password)'}
When method post
Then status 200
And def authToken = response.token