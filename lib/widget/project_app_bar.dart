import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProjectAppBar extends PreferredSize {
  final Widget title;
  final Widget leading;
  final List<Widget> actions;
  final VoidCallback onBackPressed;

  ProjectAppBar({
    @required this.title,
    this.leading,
    this.onBackPressed,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    var canPop = ModalRoute.of(context).canPop;
    return AppBar(
      title: title,
      centerTitle: true,
      automaticallyImplyLeading: true,
      actions: actions ?? [],
      leading: (leading == null && canPop)
          ? IconButton(
              icon: const Icon(CupertinoIcons.back),
              tooltip: MaterialLocalizations.of(context).backButtonTooltip,
              onPressed: () => onBackPressed == null ? Navigator.maybePop(context) : onBackPressed())
          : leading,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
