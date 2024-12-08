Feature: To validate the GET Endpoint
To validate the GET Endpoint response
		
Background: Setup the base path
Given url 'http://localhost:9897'

Scenario: To get the data in JSON format and validate from a external file
Given path '/normal/webapi/all'
And header Accept = 'application/json'
When method get
Then status 200

# To identify the property in JSON format (.) operator, in XML format (/) operator
# In JSON array index starts from 0, In XML array index starts from 1
And match response.[0].jobId == 1
And match response.[0].experience[1] == 'Apple'
And match response.[0].project[0].projectName == 'Movie App'
And match response.[0].project[0].technology[2] == 'Gradle'

# Validate the size of an array using #[x] 
# Here, experience array has 3 elements  
And match response.[0].experience == '#[3]'
And match response.[0].project[0].technology == '#[3]'
# Avoid using index value and use [*] wild card instead
# This expression gives all values present in the array including the order. Hence order should NOT be changed while validation
And match response.[0].experience[*] == ['Google','Apple','Mobile Iron']
And match response.[0].project[0].technology[*] == ['Kotlin','SQL Lite','Gradle']
# We can use contains keyword to avoid the order issue while validation
And match response.[0].experience[*] contains ['Apple']
And match response.[0].project[0].technology[*] contains ['Kotlin','SQL Lite']
# We can also validate the property inside the JSON array using wildcard character [*]
And match response.[*].jobId contains 1

# https://jsonformatter.curiousconcept.com/#

#JSON Response
#[
#  {
#    "jobId": 1,
#    "jobTitle": "Software Engg",
#    "project": [
#      {
#          "technology": [
#          "Kotlin",
#          "SQL Lite",
#          "Gradle"
#        ],
#        "projectName": "Movie App"
#      }
#    ],
#    "jobDescription": "To develop andriod application",
#    "experience": [
#      "Google",
#      "Apple",	
#      "Mobile Iron"
#    ]
#  }
#]

#XML Response
#<List>
#  <item>
#    <jobId>1</jobId>
#    <jobTitle>Software Engg</jobTitle>
#    <jobDescription>To develop andriod application</jobDescription>
#    <experience>
#      <experience>Google</experience>
#      <experience>Apple</experience>
#      <experience>Mobile Iron</experience>
#    </experience>
#    <project>
#      <project>
#        <projectName>Movie App</projectName>
#        <technology>
#          <technology>Kotlin</technology>
#          <technology>SQL Lite</technology>
#          <technology>Gradle</technology>
#        </technology>
#      </project>
#    </project>
#  </item>
#</List>


Scenario: To get the data in JSON format using fuzzy matcher
Given path '/normal/webapi/all'
And header Accept = 'application/json'
When method get
Then status 200

# Fuzzy matcher reference: https://github.com/karatelabs/karate#self-validation-expressions
And match response.[0].jobId == '#present'
And match response.[0].experience[1] == '#notnull'
And match response.[0].project[0].projectName == '#ignore'
And match response.[0].project[0].technology == '#array'
And match response.[0].jobTitle == '#string'
And match response.[0].jobId == '#number'

# Complex fuzzy matcher
#? EXPR
#Note:
#EXPR represents any JavaScript expression which should either return true or false
#'#' can be replaced with any existing fuzzy matcher or keyword i.e., #number or #string (or) #array, etc.

#[NUM] EXPR
#Note:
#It is used for Array validation
#_ -> It is called "self" variable in JS, that points to the value which we will get after evaluating the expression 
#i.e., response.[0].jobId

# #? _ >= 1 is to verify if the value of the expression is >=1
And match response.[0].jobId == '#? _ >= 1'
# string? _.length >= 13 is to verify if the value of the expression is >=1
And match response.[0].jobTitle == '#string? _.length == 13'
# #[] just verify if the property type is array or not
And match response.[0].experience == '#[]'
# #[3] is to verify if the size of array is 3
And match response.[0].experience == '#[3]'
# #[3] #string is to verify if no. of entries in the array is 3 and all are string
And match response.[0].experience == '#[3] #string'
# #[3] #string #? _.length >= 2 is to verify if no. of entries in the array is 3 all are string and length of every entry is >= 2
And match response.[0].experience == '#[3] #string? _.length >= 2'

