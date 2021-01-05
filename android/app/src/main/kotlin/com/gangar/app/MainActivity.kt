package com.gangar.app

import android.annotation.SuppressLint
import com.kakao.sdk.auth.LoginClient
import com.kakao.sdk.auth.model.OAuthToken
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.text.SimpleDateFormat

class MainActivity : FlutterActivity() {
    companion object {
        private const val CHANNEL = "com.gangar.app/kakao"

        @SuppressLint("SimpleDateFormat")
        private val DATE_FORMAT = SimpleDateFormat("yyyy-MM-dd'T'HH:mm")
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "loginWithKakaoTalk" -> {
                    LoginClient.instance.loginWithKakaoTalk(context) { token, error ->
                        if (error != null) {
                            result.error("LOGIN_ERROR", error.message, null)
                        } else if (token != null) {
                            OAuthToken
                            result.success(
                                token.toJson()
                            )
                        }
                    }
                }
                else -> {
                    result.notImplemented()
                }
            }
        }

    }

    fun OAuthToken.toJson() = mapOf(
        "accessToken" to accessToken,
        "accessTokenExpiresAt" to DATE_FORMAT.format(accessTokenExpiresAt),
        "refreshToken" to refreshToken,
        "refreshTokenExpiresAt" to
            if (refreshTokenExpiresAt != null)
                null
            else
                DATE_FORMAT.format(refreshTokenExpiresAt!!),
        "scopes" to scopes
    )
}
