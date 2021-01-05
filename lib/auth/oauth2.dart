class OAuthToken {
  final String accessToken;
  final DateTime accessTokenExpiresAt;
  final String refreshToken;
  final DateTime refreshTokenExpiresAt;
  final List<String> scopes;

  const OAuthToken(this.accessToken, this.accessTokenExpiresAt,
      this.refreshToken, this.refreshTokenExpiresAt, this.scopes);

  factory OAuthToken.fromJson(Map<String, dynamic> json) => OAuthToken(
      json["accessToken"],
      DateTime.parse(json["accessTokenExpiresAt"]),
      json["refreshToken"],
      DateTime.tryParse(json["refreshTokenExpiresAt"] ?? ""),
      json["scopes"]);
}
