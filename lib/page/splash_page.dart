import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterprojectsample/channel/project_plugin.dart';
import 'package:flutterprojectsample/config/app_navigator.dart';
import 'package:flutterprojectsample/config/app_router.dart';
import 'package:flutterprojectsample/model/app_model.dart';
import 'package:flutterprojectsample/model/user_model.dart';
import 'package:flutterprojectsample/utils/debug_log.dart';

///广告页面
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static const _TIME_PASS = 3;

  Timer _timer;

  int time = _TIME_PASS;

  @override
  void initState() {
    super.initState();

    ProjectPlugin.getAppVersion().then((version) {
      debug(version);
    });

    prepareInitData().then((_) {
      _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
        setState(() {
          setState(() {
            time = _TIME_PASS - timer.tick;
          });
          if (time < 1) {
            timer.cancel();
            AppNavigator.navigateTo(context, RouterName.homePage,
                transition: TransitionType.fadeIn, replace: true);
          }
        });
      });
    }).catchError((error, stackTrace) {
      debug('数据初始化失败！', error: error, stackTrace: stackTrace);
      AppNavigator.navigateTo(context, RouterName.homePage,
          transition: TransitionType.fadeIn, replace: true);
    });
  }

  Future<void> prepareInitData() async {
    await AppModel.instance.init();
    await UserModel.instance.init();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 15, right: 15),
              child: InkWell(
                onTap: () => AppNavigator.navigateTo(
                    context, RouterName.homePage,
                    transition: TransitionType.fadeIn, replace: true),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Theme.of(context).disabledColor,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: Text(
                    '跳过  $time 秒',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
