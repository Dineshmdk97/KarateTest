package com.api.automation.deleterequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class DELETETestRunner {
	@Test
	public Karate test1() {
		return Karate.run("deleteJobEntry").relativeTo(getClass());
	}

}
