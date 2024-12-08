package com.api.automation.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class VariableTestRunner {
	@Test
	public Karate test() {
		return Karate.run("variable").relativeTo(getClass());
	}
	
}
