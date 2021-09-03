class SignInResponse{
  final String token;

  SignInResponse({this.token});

  factory SignInResponse.fromJson(Map<String, dynamic> json){
    return SignInResponse(
      token: json['token'],
    );
  }
}