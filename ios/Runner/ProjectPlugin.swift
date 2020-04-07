//
//  ProjectPlugin.swift
//  Runner
//
//  Created by TradWang on 2020/4/7.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Foundation

class ProjectPlugin: NSObject,FlutterPlugin {
    
    static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "com.tradwang.sample/plugin_method_channel", binaryMessenger: registrar.messenger())
        let instance = ProjectPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getAppVersion":
            ProjectPluginMethodHandler.getAppVersion(call: call, result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
