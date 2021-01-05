import 'package:flutter/services.dart';
import 'package:gangar/auth/oauth2.dart';

class KakaoLoginClient {
  static const _methodChannel = MethodChannel("com.gangar.app/kakao");

  static final instance = KakaoLoginClient._();

  KakaoLoginClient._();

  Future<OAuthToken> loginWithKakaoTalk() async {
    final Map<String, dynamic> result =
        Map.from(await _methodChannel.invokeMethod("loginWithKakaoTalk"));

    return OAuthToken.fromJson(result);
  }
}
