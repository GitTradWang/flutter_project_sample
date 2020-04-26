import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprojectsample/config/app_navigator.dart';

class LoadingDialog {
  ///弹出
  static Future<void> show(BuildContext context, {backDismiss = true}) async {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => WillPopScope(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            height: 250,
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                CupertinoActivityIndicator(
                  radius:35,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  '加载中',
                  style: Theme.of(context).textTheme.subhead,
                ),
              ],
            ),
          ),
        ),
        onWillPop: () async => backDismiss,
      ),
    );
  }
  ///取消弹窗
  static Future<void> dismiss(BuildContext context) async {
    //防止误杀页面
    if (AppNavigator.appNavigatorManager.currentIsDialog()) {
      Navigator.of(context).pop();
    }
  }
}
