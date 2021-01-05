package com.gangar.app

import android.app.Application
import com.kakao.sdk.common.KakaoSdk

class GlobalApplication : Application() {
    override fun onCreate() {
        super.onCreate()

        KakaoSdk.init(this, "335872b23db3fc70cfeccce8aa143c43")
    }
}