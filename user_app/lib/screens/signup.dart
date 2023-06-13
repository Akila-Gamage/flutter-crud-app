import 'package:flutter/material.dart';
import 'package:user_app/const/colors.dart';
import 'package:user_app/services/api_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController  usernameController = TextEditingController();
  final TextEditingController  emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signup() async {
    final isSignedUp = await signUp(
      usernameController.text,
      emailController.text,
      passwordController.text
    );
    if (isSignedUp) {
           Navigator.pushNamed(context, '/mainpage');
    }else {
      print("Sign Up unsuccessful");
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
                      "https://img.indiafilings.com/learn/wp-content/uploads/2015/07/12011038/starting-a-business-in-India-for-foreign-company-1024x683.jpg"),
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
                          "SIGN UP",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
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
                    padding: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
                    child: TextFormField(
                      // validator:,
                      decoration:
                          InputDecoration(hintText: "Enter your username"),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.alternate_email,
                            color: primaryColor,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Email Address",
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
                          InputDecoration(hintText: "Enter your Email address"),
                    ),
                  ),
                  SizedBox(height: 15,),
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
                  SizedBox(height: 35,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        child: OutlinedButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/'),
                          child: Text('Sign In'),
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
                          onPressed: signup,
                          child: Text('Sign Up'),
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
          )
        ],
      ),
    );
  }
}