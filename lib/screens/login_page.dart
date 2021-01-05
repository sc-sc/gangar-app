import 'package:flutter/material.dart';
import 'package:gangar/auth/kakao.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () async {
                final token =
                    await KakaoLoginClient.instance.loginWithKakaoTalk();
              },
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              child: Image.asset(
                "assets/images/kakao_login_large_narrow_en.png",
                filterQuality: FilterQuality.high,
                scale: 2,
              ),
            )
          ],
        ),
      ));
}
