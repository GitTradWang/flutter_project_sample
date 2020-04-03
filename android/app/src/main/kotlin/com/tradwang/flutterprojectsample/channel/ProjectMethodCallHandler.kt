package com.tradwang.flutterprojectsample.channel

import android.content.Context
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class ProjectMethodCallHandler(private val messenger: BinaryMessenger, private val context: Context) : MethodChannel.MethodCallHandler {

    var activityPluginBinding: ActivityPluginBinding? = null

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "getAppVersion" -> ProjectHandlerMethod.getAppVersion(applicationContext(), call, result)
            "startSelectedImage"->ProjectHandlerMethod.startSelectedImage(activity(),call,result)
            else -> result.notImplemented()

        }
    }

    fun setUpActivityPluginBinding(activityPluginBinding: ActivityPluginBinding?) {
        this.activityPluginBinding = activityPluginBinding
    }

    private fun applicationContext() = activityPluginBinding?.activity?.applicationContext ?: context

    private fun activity() = activityPluginBinding?.activity

}