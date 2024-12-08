package com.api.automation.postrequest.data.datadriven;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class DataDrivenTestRunner {
	@Test
	public Karate test() {
		return Karate.run("dataDriven").relativeTo(getClass());
	}
}
