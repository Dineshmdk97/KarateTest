Feature: To execute the JavaScript function

Scenario: Execute JavaScript function with and without parameter
# Skip the function name when the implementation is defined in the feature file
And def getIntValue = function() {return 10;}
Then print "Function value => ", getIntValue()
# The Math.floor() function rounds a number down to the nearest integer.
And def getRandomValue = function() {return Math.floor(100 * Math.random());}
Then print "Function value => ", getRandomValue()
And def getStringValue = function(arg1) {return "Hello "+ arg1;}
Then print "Function value => ", getStringValue("World")