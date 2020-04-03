package com.tradwang.flutterprojectsample.channel

import android.app.Activity
import android.content.Context
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

object ProjectHandlerMethod {

    @JvmStatic
    fun getAppVersion(applicationContext: Context, call: MethodCall, result: MethodChannel.Result) {
        result.success("1.0.0")
    }

    @JvmStatic
    fun startSelectedImage(activity: Activity?, call: MethodCall, result: MethodChannel.Result) {

    }
}