import 'package:flutter/material.dart';
import 'package:user_app/screens/login.dart';
import 'package:user_app/screens/signup.dart';
import 'package:user_app/screens/mainpage.dart';
import 'package:user_app/screens/secondpage.dart';

class NavigationServices{
  Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => LoginPage());
    case '/signup':
      return MaterialPageRoute(builder: (context) => SignUpPage());
    case '/mainpage':
      return MaterialPageRoute(builder: (context) => MainPage());
    case '/secondpage':
      return MaterialPageRoute(builder: (context) => SecondPage());
    default:
      return MaterialPageRoute(builder: (context) => LoginPage());
  }
}
}

