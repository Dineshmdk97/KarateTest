package com.api.automation;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;

public class TagsRunner {
	@Test
	public void runnerTest() {
		Builder build = new Builder();
		build.path("classpath:com/api/automation/tags");
		build.parallel(5);
		// Tags is used at feature level (all scenarios in the feature file will be executed)
		// Tags is used at scenario level (specific scenario will be executed)
		
		// To ignore a feature file or scenario, we can use negate operator with tagging (~)
		// Ex: We can use '~@ignore' to ignore a feature or scenario
		build.tags("@smoke", "~@ignore");
		// build.tags("@regression");
		// build.tags("@sanity");
		Runner.parallel(build);
	}
}




