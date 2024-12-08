package com.api.automation;

import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;
import org.junit.jupiter.api.Test;
public class ParallelTestRunner {
	@Test
	public void runnerTest() {
		// getClass() retunrs the runtime class of this object, which executes all tests under its package
		// Runner.parallel(getClass(), 5);
		
		// We can also Builder class configuration with Runner class
		Builder build = new Builder();
		build.path("classpath:com/api/automation");
		build.parallel(5);
		Runner.parallel(build);
	}
}
