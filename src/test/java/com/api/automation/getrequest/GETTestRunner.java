package com.api.automation.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class GETTestRunner {
	// API is coming from karate-junit5 added in pom.xml
	// .run() method will invoke and run all methods defined in the feature file
	
	// Two ways to specify the location of the feature file
	// Method -1 : using relativeTo() 
	// When we execute the test, It will create an object of this class
	// getClass() method returns the runtime class i.e., GETTestRunner along with the package structure
	// based on that the relativeTo() method will identify where the feature file is located and then invoke it
	
	@Test
	public Karate test1() {
		return Karate.run("getRequest", "responseMatcher", "validateJsonResponse", "validateXmlResponse").relativeTo(getClass());
	}
	// Methode -2: using Classpath
	@Test
	public Karate test2() {
		return Karate.run("classpath:com/api/automation/getrequest/getRequest.feature");
	}
	
}
