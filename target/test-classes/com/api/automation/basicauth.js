function auth(cred) {
	// We need to access Java API i.e., java.util.Base64 to generate a base64 encoded string
	var info = cred.username +':'+ cred.password;
	// Karate provides a way by which we can access Java library inside JavaScript function --> Java.type()
	// Go to https://docs.oracle.com/javase/8/docs/api/java/util/Base64.html -> Copy the API, 'java.util.Base64' 
	var base64 = Java.type('java.util.Base64');
	var encodedStr = base64.getEncoder().encodeToString(info.bytes);
	return 'Basic ' + encodedStr;
}