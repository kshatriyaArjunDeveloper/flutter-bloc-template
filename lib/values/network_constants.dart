class NetworkConstants {
  NetworkConstants._();

  // todo @Project Setup: Update the base URL
  static const baseURL = 'https://api.test.flyesta.app/';
  static const connectTimeoutSeconds = 10000;
  static const receiveTimeoutSeconds = 30000;
}

class ApiEndpoints {
  ApiEndpoints._privateConstructor();

  // User
  static const String getUserProfile = '/api/v1/users/get-profile';
  static const String refreshToken = '/refresh';

// todo @Project Setup: Delete
  // Miscellaneous
  static const getAllLanguages = '/api/v1/languages';
}
