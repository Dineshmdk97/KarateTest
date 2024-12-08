package com.api.automation.configuration;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class ConfigTestRunner {
	@Test
	public Karate test1() {
		return Karate.run("getGlobalConfig").relativeTo(getClass());
	}

}
