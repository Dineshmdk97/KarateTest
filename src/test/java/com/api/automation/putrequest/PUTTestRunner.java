package com.api.automation.putrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class PUTTestRunner {
	@Test
	public Karate test() {
		return Karate.run("updateJobEntry").relativeTo(getClass());
	}
}
