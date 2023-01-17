class UserResponse {
  String? kind;
  String? localId;
  String? email;
  String? displayName;
  String? idToken;
  bool? registered;
  String? refreshToken;
  String? expiresIn;

  UserResponse(
      {this.kind,
        this.localId,
        this.email,
        this.displayName,
        this.idToken,
        this.registered,
        this.refreshToken,
        this.expiresIn});

  UserResponse.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    localId = json['localId'];
    email = json['email'];
    displayName = json['displayName'];
    idToken = json['idToken'];
    registered = json['registered'];
    refreshToken = json['refreshToken'];
    expiresIn = json['expiresIn'];
  }


}
