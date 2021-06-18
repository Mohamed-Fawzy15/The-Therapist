class UserHeaders{
  final String? access_token;
  final String? client;
  final String? uid;


  UserHeaders({this.uid, this.access_token, this.client});

  factory UserHeaders.fromJson(Map<String, dynamic> json) {
    return UserHeaders(
      uid: json['uid'],
      access_token: json['access-token'],
      client: json['client'],
    );
  }
}
