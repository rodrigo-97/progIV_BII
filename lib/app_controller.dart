import 'package:flutter/foundation.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();
  
  bool switchValue = false;
  String themeValue = "Theme Dark";
  changeSwitch (){
    switchValue = !switchValue;

    if (switchValue){
      themeValue = "Theme Dark";
    }else{
      themeValue = "Theme Light";
    }
    notifyListeners();
  }
}