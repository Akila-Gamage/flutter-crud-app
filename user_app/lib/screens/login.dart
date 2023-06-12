import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:user_app/const/colors.dart';
import 'package:user_app/screens/signup.dart';
import 'package:user_app/routes/router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "SIGN IN",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 45,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 0),
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
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
                    child: TextField(
                      decoration:
                          InputDecoration(hintText: "Enter your username"),
                    ),
                  ),
                  SizedBox(height: 35,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
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
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 15),
                    child: TextField(
                      decoration:
                          InputDecoration(hintText: "Enter your password"),
                    ),
                  ),
                  SizedBox(height: 45,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        child: OutlinedButton(
                          onPressed: () =>
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
                          onPressed: () =>
                              Navigator.pushNamed(context, '/mainpage'),
                          child: Text('Sign In'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
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
          )
        ],
      ),
    );
  }
}
