import 'package:flutter/material.dart';
import 'package:flutterprojectsample/widget/page_state_widget.dart';
import 'package:provider/provider.dart';

typedef ChildBuilder<T extends BaseProviderModel> = Widget Function(
    BuildContext context, T t);

typedef ErrorBuilder<T extends BaseProviderModel> = Widget Function(
    BuildContext context, T t);

typedef EmptyBuilder<T extends BaseProviderModel> = Widget Function(
    BuildContext context, T t);

typedef LoadingBuilder<T extends BaseProviderModel> = Widget Function(
    BuildContext context, T t);

class BaseProviderWidget<T extends BaseProviderModel> extends StatelessWidget {
  final Widget child;

  final Create<T> create;

  final ErrorBuilder<T> errorBuilder;

  final EmptyBuilder<T> emptyBuilder;

  final LoadingBuilder<T> loadingBuilder;

  BaseProviderWidget({
    @required this.child,
    @required this.create,
    @required this.errorBuilder,
    @required this.emptyBuilder,
    @required this.loadingBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: create,
      child: Consumer<T>(
        builder: (BuildContext context, T value, Widget child) {
          switch (value.widgetState) {
            case WidgetState.CONTENT:
              return child;
              break;
            case WidgetState.ERROR:
              return errorBuilder == null
                  ? Container()
                  : errorBuilder(context, value);
              break;
            case WidgetState.EMPTY:
              return emptyBuilder == null
                  ? Container()
                  : emptyBuilder(context, value);
              break;
            case WidgetState.LOADING:
              return loadingBuilder == null
                  ? Container()
                  : loadingBuilder(context, value);
              break;
          }
          return child;
        },
        child: child == null ? Container() : child,
      ),
    );
  }
}

class BaseProviderModel extends ChangeNotifier {
  WidgetState _widgetState;

  BaseProviderModel({WidgetState state})
      : _widgetState = state == null ? WidgetState.CONTENT : state;

  WidgetState get widgetState => _widgetState;

  set widgetState(WidgetState state) {
    _widgetState = state;
    notifyListeners();
  }
}

enum WidgetState {
  LOADING,
  CONTENT,
  EMPTY,
  ERROR,
}

class BasePageModel extends BaseProviderModel {
  String errorMessge ='';
  String emptyMessage='';
  String loadingMessage='';

  void Function(BasePageModel model) block;

  BasePageModel({WidgetState state}) : super(state: state);

  void showLoading({String message}) {
    loadingMessage = message;
    widgetState = WidgetState.LOADING;
  }

  void showContent() {
    widgetState = WidgetState.CONTENT;
  }

  void showError({String message, Function(BasePageModel model) block}) {
    errorMessge = message;
    widgetState = WidgetState.ERROR;
  }

  void showEmpty({String message}) {
    emptyMessage = message;
    widgetState = WidgetState.EMPTY;
  }
}

class BasePageWidget<T extends BasePageModel> extends StatelessWidget {
  final AppBar appBar;

  final Widget body;

  final Create<T> create;

  final ErrorBuilder<T> errorBuilder;

  final EmptyBuilder<T> emptyBuilder;

  final LoadingBuilder<T> loadingBuilder;

  BasePageWidget({
    @required this.create,
    this.appBar,
    this.body,
    this.errorBuilder,
    this.emptyBuilder,
    this.loadingBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: BaseProviderWidget<T>(
        child: body,
        create: create,
        emptyBuilder: emptyBuilder ??
            (context, T t) => PageEmptyWidget(
                  text: t.emptyMessage,
                ),
        errorBuilder: errorBuilder ??
            (context, T t) => PageErrorWidget(
                  text: t.errorMessge,
                  callback: () => t.block(t),
                ),
        loadingBuilder: loadingBuilder ??
            (context, T t) => PageLoadingWidget(
                  text: t.loadingMessage,
                ),
      ),
    );
  }
}
