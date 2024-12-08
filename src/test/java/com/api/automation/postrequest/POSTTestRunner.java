package com.api.automation.postrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class POSTTestRunner {
	@Test
	public Karate test() {
		return Karate.run("createJobEntry", "schemaValidation", "javaScriptExecutor").relativeTo(getClass());
	}
}
