import 'package:flutter/material.dart';
import 'package:mvc_application/controller.dart' show ControllerMVC;
import 'package:mvc_application/view.dart' show AppStatefulWidget,AppState;
import 'package:flashcard_app/FrontEnd/ScreenController.dart' show ScreenView;
import 'package:flashcard_app/BackEnd/Menu.dart';


class StartApp extends AppStatefulWidget {
  // Allows for hot reloads.
  @override
  AppState createView() => _StartApp();
}

class _StartApp extends AppState {
  factory _StartApp() => _this ??= _StartApp._();
  _StartApp._()
      : super(
    home: ScreenView(),
    theme: ThemeData(
      primaryColor: Colors.blue,
    ),
    debugShowCheckedModeBanner: false,
  );
  static _StartApp? _this;
}

class Controller extends ControllerMVC {
  // Supply only one instance of this Controller class.
  factory Controller() => _this ??= Controller();
  static Controller? _this;

  Controller.Controller() {
    model = Menu();
  }
  late Menu model;

}

