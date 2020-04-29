import 'package:flutter/material.dart';
import 'package:flutterprojectsample/widget/project_app_bar.dart';
import 'package:flutterprojectsample/widget/provider/base_page_widget.dart';

class UISamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseProviderPageWidget(
      appBar: ProjectAppBar(
        title: Text('UI使用示例'),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  color: Colors.red,
                  width: 375,
                  height: 40,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 40,
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  color: Colors.red,
                  width: 187.5,
                  height: 40,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Container(
                width: 1,
                color: Colors.blueAccent,
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ],
      ),
      create: (BuildContext context) {
        return UISamplePageModel();
      },
    );
  }
}

class UISamplePageModel extends BaseProviderPageModel {
}
