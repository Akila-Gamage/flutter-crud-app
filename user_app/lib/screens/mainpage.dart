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
        title: Text("List View - User data"),
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
                      color: Colors.grey.shade800,
                      margin: const EdgeInsets.only(
                          bottom: 20, top: 20, right: 10, left: 10),
                      child: ListTile(
                          title: Text(users[index].name,
                              style: const TextStyle(color: textColor)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                users[index].email,
                                style: const TextStyle(color: textColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                users[index].password,
                                style: const TextStyle(color: textColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: null,
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(primaryColor),
                                ),
                                child: const Text("Edit",
                                    style:
                                        TextStyle(color: secondaryTextColor)),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                onPressed: null,
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                ),
                                child: const Text("Delete",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          )),
                    );
                  });
            }
            if (snapshot.hasError) {
              print(snapshot.error.toString());
              return Text('error');
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
