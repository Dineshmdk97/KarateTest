package com.api.automation;

import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;

public class TagsRunnerForSingleValue {
	
	public static final String CLASS_PATH = "classpath:";
	
	@Test
	public void runnerTest() {
		Builder build = new Builder();
		build.path(getLocation());
		build.parallel(5);
		build.tags(getTags());
		Runner.parallel(build);
		
		// We can use System.getProperty to get the value for tag and path instead of hard coding.

		// For that we need to pass the value of both properties as VM argument.
		// Right click the file -> Run As -> Run Configurations -> Select, Java Application
		// -> Click, New launch configuration button -> Search the class name, TagsRunnerForSingleValue -> Ok
		// -> Now select, Arguments tab -> In VM arguments field, Enter
		// -Dlocation=com/api/automation -Dtags=@smoke
		// -> Apply -> Run
		}
	
		private List<String> getTags() {
			String aTags = System.getProperty("tags", "@smoke");
			
		// If the values is added in VM arguments, then we can get the value by providing the property name
		//	String aTags = System.getProperty("tags");
			List<String> aTagsList = Arrays.asList(aTags);
			return aTagsList;
		}
		
		private List<String> getLocation() {
			String aLocation = System.getProperty("location", "com/api/automation");
			
		// If the value is added in VM arguments, then we can get the value by providing the property name
		//	String aLocation = System.getProperty("location");
			List<String> aLocationList = Arrays.asList(CLASS_PATH + aLocation);
			return aLocationList;
		}
		
		
		// After completing the script, If we want to validate each and every step
		// We can also set Debug configuration
		
		// For that we need to pass the value of both properties as VM argument.
		// Right click the runner file -> Debug As -> Debug Configurations -> Select, JUnit 
		// -> Click, New launch configuration button -> Search the class name, TagsRunnerForSingleValue -> Ok
		// -> Now select, Arguments tab -> In VM arguments field, Enter
		// -Dlocation=com/api/automation -Dtags=@smoke
		// -> Apply -> Debug
		// Now click, 'Step Over' button (or F6) at the top of Eclispe and validate each steps one by one
		
	
}
