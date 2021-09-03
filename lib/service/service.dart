abstract class ApiService {
  String get baseURL =>
      "http://localhost:3000/api";

  Map<String, String> get defaultHeader => {
    'Content-Type': 'application/json',
  };

  Map<String, String> authorizationHeader(String accessToken) => {
    'Authorization': 'Bearer $accessToken',
    'Content-Type': 'application/json',
  };
}