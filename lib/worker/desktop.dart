import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:bitsdojo_window/bitsdojo_window.dart';

bool desktopFeature({bool web = false}) {
  return (Platform.isWindows ||
      Platform.isLinux ||
      Platform.isMacOS ||
      (web ? kIsWeb : false));
}

bool desktopLayout(BuildContext context,
    {bool web = false, double? value, double valueCap = 1000}) {
  value ??= MediaQuery.of(context).size.width;
  return (desktopFeature(web: web) || value >= valueCap);
}

bool desktopLayoutRequired(BuildContext context,
    {bool web = false, double? value, double valueCap = 1000}) {
  value ??= MediaQuery.of(context).size.width;
  return (desktopFeature(web: web) && value >= valueCap);
}

Widget desktopControls(BuildContext context) {
  return SizedBox(
      height: 200,
      child: WindowTitleBarBox(
          child: Row(
        children: [
          SizedBox(
              width: 46,
              height: 200,
              child: MinimizeWindowButton(
                  animate: true,
                  colors: WindowButtonColors(
                      iconNormal: Theme.of(context).colorScheme.primary))),
          SizedBox(
              width: 46,
              height: 72,
              child: MaximizeWindowButton(
                  animate: true,
                  colors: WindowButtonColors(
                      iconNormal: Theme.of(context).colorScheme.primary))),
          SizedBox(
              width: 46,
              height: 72,
              child: CloseWindowButton(
                  animate: true,
                  colors: WindowButtonColors(
                      iconNormal: Theme.of(context).colorScheme.primary))),
        ],
      )));
}

List<Widget>? desktopControlsActions(BuildContext context,
    [List<Widget>? ifNotAvailable]) {
  return desktopFeature() ? <Widget>[desktopControls(context)] : ifNotAvailable;
}
