import 'package:flutter/material.dart';
import 'package:user_app/const/colors.dart';
import 'package:user_app/services/api_service.dart';
import 'package:form_field_validator/form_field_validator.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String _getErrorText() {
    if (formkey.currentState == null || !formkey.currentState!.validate()) {
      return "";
    }
    return "";
  } 

  @override
  void initState() {
    super.initState();
    // Reset the form and clear the text controller
    formkey.currentState?.reset();
    usernameController.clear();
    passwordController.clear();
  }

  Future<void> login() async {
    final isLoggedIn =
        await loginIn(usernameController.text, passwordController.text);

    if (isLoggedIn) {
      Navigator.pushNamed(context, '/mainpage');
    } else {
      print("Invalid credentials");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://thebluecube.com/wp-content/uploads/2022/10/lee-campbell-DtDlVpy-vvQ-unsplash-scaled.jpg"),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: 0, right: 0, top: 10, bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "SIGN IN",
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 15, bottom: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.only(right: 16),
                              child: Icon(
                                Icons.person_3_outlined,
                                color: primaryColor,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Username",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 0, bottom: 0),
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* required"),
                          ]),
                          controller: usernameController,
                          decoration: InputDecoration(
                            hintText: "Enter your username",
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        _getErrorText(),
                        style: TextStyle(color: Colors.red),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 0, bottom: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.only(right: 16),
                              child: Icon(
                                Icons.lock,
                                color: primaryColor,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Password",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 0, bottom: 15),
                        child: TextFormField(
                          obscureText: true,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* required"),
                            MinLengthValidator(6,errorText: "Password should be atleast 6 characters")
                          ]),
                          controller: passwordController,
                          decoration:
                              InputDecoration(hintText: "Enter your password (at least 8 characters)"),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        _getErrorText(),
                        style: TextStyle(color: Colors.red),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 150,
                            child: OutlinedButton(
                              onPressed: ()=>
                                  Navigator.pushNamed(context, '/signup'),
                              child: Text('Sign Up'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: primaryColor,
                                side: BorderSide(
                                  width: 1,
                                  color: primaryColor,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: (){if (formkey.currentState!.validate() ) {
                                                print("Validated");
                                                login();
                                              }else{
                                                  print("Not Validated");
                                              }},
                              child: Text('Sign In'),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  foregroundColor: backColor,
                                  side: BorderSide(
                                    width: 1,
                                    color: primaryColor,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
    
  }
  
}

