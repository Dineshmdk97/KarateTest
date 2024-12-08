Feature: To validate the GET Endpoint
To validate the GET Endpoint response
		
Background: Setup the base path
Given url 'http://localhost:9897'

Scenario: To get the data in XML format 
Given path '/normal/webapi/all'
And header Accept = 'application/xml'
When method get
Then status 200

# To identify the property in JSON format (.) operator, in XML format (/) operator
# In JSON array index starts from 0, In XML array index starts from 1
And match response/List/item/jobId == 1
And match response/List/item/jobTitle == 'Software Engg'
And match response/List/item/experience/experience[1] == 'Google'
And match response/List/item/project/project/projectName == 'Movie App'
And match response/List/item/project/project/technology/technology[2] == 'SQL Lite'

# We can also write without the response keyword
And match /List/item/experience/experience[1] == 'Google'

# Traverse the XML similar to JSON
# Instead of (/) we can use (.)
# Instead of index [1] we need to start from index [0] if we use (.) operator
And match response.List.item.experience.experience[0] == 'Google'


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


Scenario: To get the data in XML format 
Given path '/normal/webapi/all'
And header Accept = 'application/xml'
When method get
Then status 200

# Fuzzy matcher reference: https://github.com/karatelabs/karate#self-validation-expressions
And match response/List/item/jobId == '#notnull'
And match response/List/item/jobTitle == '#string'
And match response/List/item/experience/experience[1] == '#notnull'
And match response/List/item/project/project/projectName == '#present'
And match response/List/item/project/project/technology/technology[2] == '#ignore'

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
And match response/List/item/jobId == '#? _ >= 1'
# string? _.length >= 13 is to verify if the value of the expression is >=1
And match response/List/item/jobTitle == '#string? _.length >= 13'


