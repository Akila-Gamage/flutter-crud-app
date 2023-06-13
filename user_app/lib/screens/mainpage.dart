import 'package:flutter/material.dart';
import 'package:user_app/const/colors.dart';
import 'package:user_app/widgets/navbar.dart';
import 'package:user_app/services/api_service.dart';
import 'package:user_app/models/user_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Container(
          color: backColor,
          padding: const EdgeInsets.all(8),
          child: FutureBuilder(
            future: getUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<User> users = snapshot.data as List<User>;
                return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.only(bottom: 20, top: 20, right: 10, left: 10),
                        child: ListTile(
                            title: Text(users[index].name,
                                style: TextStyle(color: textColor)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20,),
                                Text(
                                  users[index].email,
                                  style: TextStyle(color: textColor),
                                ),
                                Text(
                                  users[index].password,
                                  style: TextStyle(color: textColor),
                                )
                              ],
                            ),
                            
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: null,
                                  child: Text("Edit",
                                      style: TextStyle(color: secondaryTextColor)),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(primaryColor),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                ElevatedButton(
                                  onPressed: null,
                                  child: Text("Delete",
                                      style: TextStyle(color: Colors.white)),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red),
                                  ),
                                ),
                              ],
                            )),
                        color: Colors.grey.shade800,
                      );
                    });
              }
              if (snapshot.hasError) {
                print(snapshot.error.toString());
                return Text('error');
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }
}
