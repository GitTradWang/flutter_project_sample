import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterprojectsample/config/app_navigator.dart';
import 'package:flutterprojectsample/config/app_router.dart';
import 'package:flutterprojectsample/config/app_theme.dart';
import 'package:flutterprojectsample/model/app_model.dart';
import 'package:flutterprojectsample/model/user_model.dart';
import 'package:flutterprojectsample/page/splash_page.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:screen_ratio_adapter/screen_ratio_adapter.dart';

void main() {
  runFxApp(App(), uiSize: Size(375, 667));
  _init();
}

_init() {
  defineRoutes(AppNavigator.router);
  if (Platform.isAndroid) {
    //透明状态栏
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<AppModel>(
            create: (BuildContext context) => AppModel()),
        ChangeNotifierProvider<UserModel>(
            create: (BuildContext context) => UserModel()),
      ],
      child: MaterialApp(
        title: '例子',
        theme: AppTheme.theme,
        darkTheme: AppTheme.darkTheme,
        home: SplashPage(),
        themeMode: ThemeMode.system,
        navigatorKey: AppNavigator.navigatorKey,
        onGenerateRoute: (RouteSettings settings) =>
            AppNavigator.router.generator(settings),
        debugShowCheckedModeBanner: false,
        navigatorObservers: [AppNavigator.appNavigatorManager],
      ),
    );
  }
}
