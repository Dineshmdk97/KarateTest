package com.api.automation;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

public class ParallelBuilderWithCucumberReport {
	@Test
	public void builderTest() {
		Builder build = new Builder();
		build.path("classpath:com/api/automation/getrequest");
		Results result = build.parallel(5);
		System.out.println("Total features are : "+result.getFeatureCount());
		System.out.println("Total scenarios are : "+result.getScenarioCount());
		System.out.println("Total passed scenarios are : "+result.getPassCount());
		// result.getReportDir() is used to get the location of the report directory
		generateCucumberReport(result.getReportDir());
		Assertions.assertEquals(0, result.getFailCount(), "This are some failed scenarios");
	}
	
		// reportDirLocation = C:\Users\dines\eclipse-workspace\KarateFramework\target\surefire-reports
	private void generateCucumberReport(String reportDirLocation) {
		File reportDir = new File(reportDirLocation);
		// Parameters are (directory, extensions, recursive)
		Collection<File> jsonCollections = FileUtils.listFiles(reportDir, new String[] {"json"}, true);
		List<String> jsonFiles = new ArrayList<String>();
		// Path of files are stored in jsonFiles object
		jsonCollections.forEach(file -> jsonFiles.add(file.getAbsolutePath()));
		// Parameters are (File, String)
		Configuration configuration = new Configuration(reportDir, "Karate Test");
		// Parameters are (List<String>, Configuration)
		ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
		reportBuilder.generateReports();
	}
	// Once test run is completed, go to C:\Users\dines\eclipse-workspace\KarateFramework\target\surefire-reports\cucumber-html-reports
	// Open, overview-features.html
}
