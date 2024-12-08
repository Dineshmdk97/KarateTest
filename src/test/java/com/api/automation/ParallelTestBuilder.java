package com.api.automation;

import org.junit.jupiter.api.Assertions;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;
import org.junit.jupiter.api.Test;

public class ParallelTestBuilder {
	@Test
	public void builderTest() {
		Builder build = new Builder();
		// All the feature files in the current package as well as in the child package will be executed
		build.path("classpath:com/api/automation");
		// Results class is coming from the Karate framework
		Results result = build.parallel(5);
		// Returns the number of features which the runner executed
		System.out.println("Total features are : "+result.getFeatureCount());
		// Returns the number of scenarios which the runner executed
		System.out.println("Total scenarios are : "+result.getScenarioCount());
		// Returns the number of passed scenarios
		System.out.println("Total passed scenarios are : "+result.getPassCount());
		// Assertions class is coming from JUnit framework
		// "This are some failed scenarios" -> The message will be included in the stack trace in case of failure
		// result.getFailCount() -> Returns the number of failed scenarios
		Assertions.assertEquals(0, result.getFailCount(), "This are some failed scenarios");
	}
}
