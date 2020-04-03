package com.tradwang.flutterprojectsample.channel

import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

class ProjectPlugin : FlutterPlugin, ActivityAware {

    private var channel: MethodChannel? = null
    private var handler: ProjectMethodCallHandler? = null

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        setupMethodChannel(binding.binaryMessenger, binding.applicationContext)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        tearDownChannel()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        handler?.setUpActivityPluginBinding(binding)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        handler?.setUpActivityPluginBinding(binding)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        handler?.setUpActivityPluginBinding(null)
    }

    override fun onDetachedFromActivity() {
        handler?.setUpActivityPluginBinding(null)
    }

    private fun setupMethodChannel(messenger: BinaryMessenger, context: Context) {
        channel = MethodChannel(messenger, "com.tradwang.sample/plugin_method_channel")
        handler = ProjectMethodCallHandler(messenger, context)
        channel?.setMethodCallHandler(handler)
    }

    private fun tearDownChannel() {
        channel?.setMethodCallHandler(null)
        channel = null
        handler = null
    }
}


