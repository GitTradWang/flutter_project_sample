import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterprojectsample/page/home/index/home_index_model.dart';
import 'package:flutterprojectsample/widget/base/base_page_widget.dart';

class HomeIndexPage extends StatefulWidget {
  @override
  _HomeIndexPageState createState() => _HomeIndexPageState();
}

class _HomeIndexPageState extends State<HomeIndexPage> with AutomaticKeepAliveClientMixin {
  HomeIndexModel _homeIndexModel = HomeIndexModel();

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
     _homeIndexModel.showContent();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BasePageWidget<HomeIndexModel>(
      create: (BuildContext context) => _homeIndexModel,
      appBar: AppBar(
        title: Text('首页'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text('首页'),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
