Feature: To send the GET request with JWT token

Scenario: To send the GET request with JWT token
And def token = call read('../../getToken.feature') {username: 'john', password: 'admin'}
Given url 'http://localhost:9897/auth/webapi/all'
# Pass the Bearer token in headers
And headers {Accept:'application/json', Authorization: '#("Bearer "+token.authToken)'}
When method get
Then status 200