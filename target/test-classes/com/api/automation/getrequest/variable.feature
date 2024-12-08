Feature: Variable Creation
#Syntax - 1
# <gherkin keyword> <def> <variable_name> = <value>

# Also, during the variable creation, the gherkin keyword is optional.
# We can also use '*' character instead of Gherkin keyword
# Syntax - 2
# * <def> <variable_name> = <value>

#Use cases of Variable:
# For repeating values
# Storing the data from external file
# In the matcher expression
# Passing the data from one feature file to another

# Key notes:- 
# Variable type i.e., number, string, json, array, xml, etc. will be automatically inferred from the value
# def is keyword in Karate used for defining a new variable
# Scope of a variable is within the scenario. It CANNOT be used outside the scenario
# Variable defined in Background can be used in ALL scenario

Background: Initialize Variables
Given def app_name = 'Google'
And def date = '30-05-1997'

Scenario: To create a Variable
Given def var_int = 10
And def var_string = 'KarateTest'
Then print "Integer => ", var_int
And print "String => ", var_string
And def var_int_2 = var_int + 90
And print "New Integer => ", var_int_2
And print "Application and date are ", app_name, date