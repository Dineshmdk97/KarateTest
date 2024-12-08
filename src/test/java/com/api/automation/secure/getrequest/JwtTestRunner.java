package com.api.automation.secure.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class JwtTestRunner {
	@Test
	public Karate runTest() {
		 return Karate.run("getWithJwtToken").relativeTo(getClass());
	}
}
