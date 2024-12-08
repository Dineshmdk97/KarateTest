package com.api.automation.patchrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class PATCHTestRunner {
	@Test
	public Karate test() {
		return Karate.run("partialUpdateJobDescription").relativeTo(getClass());
	}
}
