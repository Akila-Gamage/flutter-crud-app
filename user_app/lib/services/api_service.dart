import 'dart:convert';
import 'package:user_app/models/user_model.dart';
import 'package:http/http.dart' as http;

Future<bool> loginIn(String username, String password) async {
  final url = Uri.parse('http://localhost:6050/login');
  final logUser = {
    "name": username,
    "password": password,
  };
  final body = jsonEncode(logUser);

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode == 201) {
      print(response.body);
      return true;
    } else {
      print("Login failed");
      return false;
    }
  } catch (e) {
    print("Error : $e");
    return false;
  }
}

Future<bool> signUp(String username, String email, String password) async {
  final url = Uri.parse('http://localhost:6050/user');
  final registerUser = {
      "name": username,
      "email": email,
      "password": password,
  };
  final body = jsonEncode(registerUser);

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode == 201) {
      print(response.body);
      return true;
    } else {
      print("Login failed");
      return false;
    }
  } catch (e) {
    print("Error : $e");
    return false;
  }
}

Future<List<User>> getUsers() async {
  String uri = "http://localhost:6050/users";
  final response = await http.get(Uri.parse(uri));

  var responseData = json.decode(response.body);

  List<User> users = [];
  for (var singleUser in responseData["data"]["data"]) {
  User user = User.fromJson(singleUser);

      //Adding user to the list.
      users.add(user);
    }
    return users;
}
