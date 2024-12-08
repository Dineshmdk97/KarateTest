package com.api.automation;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;

public class TagsRunnerForMultipleValues {
	
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
	// -> Click, New launch configuration button -> Search the class name, TagsRunnerForMultipleValues -> Ok
	// -> Now select, Arguments tab -> In VM arguments field, Enter
	// -Dlocation=com/api/automation,com/api/automation/getrequest,com/api/automation/putrequest -Dtags=@smoke,@sanity
	// -> Apply -> Run
		
	// Note: While providing tags in Arugments, It takes and performs AND condition
	// And it will pick up the scenarios or feature file which have all three tags
	// In short, Tags which is commonly present across feature files will run
	
	}
	
// In case of multiple locations with multiple tags 
// We need to specify values for all locations and tags with the help of comma (,) a.k.a DELIMITER 
// Split the string using delimiter and create the list out of it
	
	private List<String> getTags() {
			String aTags = System.getProperty("tags");
			List<String> aTagsList = Collections.emptyList();
			if(aTags.contains(",")) {
				String tagArray[] = aTags.split(",");
				aTagsList = Arrays.asList(tagArray);
				return aTagsList;
			}
			aTagsList = Arrays.asList(aTags);
			return aTagsList;
		}
		
		private List<String> getLocation() {
			String aLocation = System.getProperty("location");
			List<String> aLocationList = Collections.emptyList();
			if(aLocation.contains(",")) {
				String locationArray[] = aLocation.split(",");
				aLocationList = Arrays.asList(locationArray);
				// Adding CLASS_PATH a.k.a classpath: with each location
				// Here entry is nothing but location
				aLocationList.replaceAll((entry) -> {
					return CLASS_PATH + entry;
				});
				return aLocationList;
			}
			aLocationList = Arrays.asList(CLASS_PATH + aLocation);
			return aLocationList;
		}
}
