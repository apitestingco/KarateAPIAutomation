function fn() {
  var env = karate.env; // get system property 'karate.env'
  var os = karate.os;
  karate.log('karate.env system property was:', env);
  karate.log("Your OS Is",os);

  if (!env) {
    env = 'dev';

  }
  var config = {
    env: env,
    baseUrl: 'http://localhost:8081',
    os : os
  }
  if (env == 'dev') {
    config.baseUrl = 'http://localhost:8081/api'
  } else if (env == 'e2e') {
    config.baseUrl = 'http://api.ipify.org/';
  }
  return config;
}