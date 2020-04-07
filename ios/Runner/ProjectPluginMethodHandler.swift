//
//  ProjectPluginMethodHandler.swift
//  Runner
//
//  Created by TradWang on 2020/4/7.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Foundation
import Flutter

enum ProjectPluginMethodHandler {

    static func getAppVersion(call: FlutterMethodCall, result: @escaping FlutterResult){
        result("1.0.0")
    }
}
