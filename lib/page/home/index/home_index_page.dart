import 'package:flutter/material.dart';
import 'package:flutterprojectsample/config/app_navigator.dart';
import 'package:flutterprojectsample/config/app_router.dart';

class HomeIndexPage extends StatefulWidget {
  @override
  _HomeIndexPageState createState() => _HomeIndexPageState();
}

class _HomeIndexPageState extends State<HomeIndexPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          MaterialButton(
            onPressed: () =>
                AppNavigator.navigateTo(context, RouterName.uiSamplePage),
            child: Text('跳转到例子页面'),
            color: Colors.greenAccent,
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
