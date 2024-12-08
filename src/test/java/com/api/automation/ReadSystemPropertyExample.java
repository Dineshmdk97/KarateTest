package com.api.automation;

public class ReadSystemPropertyExample {

	public static void main(String[] args) {
		// We can use System.getProperty to get the values for tag and path instead of hard coding it.

		// For that we need to pass the value of both properties as VM argument.
		// Right click the file -> Run As -> run Configurations -> Select, Java Application
		// -> Click, New launch configuration button -> Search the class, ReadSystemProperty -> Ok
		// Now select, Arguments tab -> In VM arguments field, Enter
		// -Dlocation=com/api/automation -Dtags=@smoke
		// -> Apply -> Run

		System.out.println("Location : " + System.getProperty("location", "com/api/automation"));
		System.out.println("Tags : " + System.getProperty("tags", "@smoke"));
	}

}
