package com.api.automation.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class JsonPathTestRunner {
	@Test
	public Karate test() {
		return Karate.run("jsonPathExpression").relativeTo(getClass());
	}
}
