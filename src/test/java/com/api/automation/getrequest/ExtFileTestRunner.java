package com.api.automation.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class ExtFileTestRunner {
	@Test
	public Karate test() {
		return Karate.run("validateFromFile").relativeTo(getClass());
	}
}
