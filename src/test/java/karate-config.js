function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  // Global configuration and can be accessed in the feature file using the variable name
  var config = {
    env: env,
    myVarName: 'Hello There!',
    username: 'john',
    password: 'admin'
  }
  
  // Go to the Test Runner file -> Run AS -> Run Configurations -> Arugments -> In VM Arguments, Enter
  // -Dkarate.env=dev
  // This will modify the values of variables username and password as given in this 'if block'
  if (env == 'dev') {
    config.username= 'Tyler Durden';
    config.password= 'Fight Club';
    
  // Go to the Test Runner file -> Run AS -> Run Configurations -> Arugments -> In VM Arguments, Enter7
  // -Dkarate.env=dev
  // This will modify the values of variables username and password as given in this 'else if block'
  } else if (env == 'e2e') {
    config.username= 'Tony Montana';
    config.password= 'Scarface';
  }
  
  // We can set, different environments for testing
  else if (env == 'Staging') {
    config.username= 'Staging';
    config.password= 'Staging';
  }
  else if (env == 'Pre-prod') {
    config.username= 'Pre-prod';
    config.password= 'Pre-prod';
  }
  else if (env == 'Prod') {
    config.username= 'Prod';
    config.password= 'Prod';
  }
  return config;
}