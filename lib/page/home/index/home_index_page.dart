import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprojectsample/config/app_navigator.dart';
import 'package:flutterprojectsample/config/app_router.dart';
import 'package:flutterprojectsample/page/home/index/home_index_model.dart';
import 'package:flutterprojectsample/widget/page_state_widget.dart';
import 'package:flutterprojectsample/widget/project_app_bar.dart';
import 'package:flutterprojectsample/widget/provider/base_page_widget.dart';
import 'package:shimmer/shimmer.dart';

class HomeIndexPage extends StatefulWidget {
  @override
  _HomeIndexPageState createState() => _HomeIndexPageState();
}

class _HomeIndexPageState extends State<HomeIndexPage>
    with AutomaticKeepAliveClientMixin {
  HomeIndexModel _homeIndexModel = HomeIndexModel();

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      _homeIndexModel.showContent();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BaseProviderPageWidget<HomeIndexModel>(
      create: (BuildContext context) => _homeIndexModel,
      loadingBuilder: (context, model) =>
          PageLoadingListWidget(
            itemBuilder: (BuildContext context, int index) =>
                Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  color: Colors.amber,
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 100,
                    ),
                  ),
                ),
          ),
      appBar: ProjectAppBar(
        title: Text('首页'),
      ),
      body:_Body(),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Center(
          child: RaisedButton(
            onPressed: () =>
                AppNavigator.navigateTo(context, RouterName.uiSamplePage),
          ),
        ),
        SizedBox(
          width: 200.0,
          height: 100.0,
          child: Shimmer.fromColors(
            baseColor: Colors.red,
            highlightColor: Colors.yellow,
            child: Text(
              'Shimmer',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

}
