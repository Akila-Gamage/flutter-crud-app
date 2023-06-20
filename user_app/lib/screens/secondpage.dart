import 'package:flutter/material.dart';
import 'package:user_app/const/colors.dart';
import 'package:user_app/widgets/navbar.dart';
import 'package:user_app/services/api_service.dart';
import 'package:user_app/models/user_model.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Grid View - User data"),
      ),
      body: Container(
        color: backColor,
        padding: const EdgeInsets.all(8),
        child: FutureBuilder(
          future: getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<User> users = snapshot.data as List<User>;
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.grey.shade800,
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
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: null,
                                  style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all<Size>(Size(20, 50)),
                                    backgroundColor:
                                        MaterialStateProperty.all(primaryColor),
                                  ),
                                  child: const Icon(Icons.edit,
                                      color: secondaryTextColor,),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton(
                                  onPressed: null,
                                  style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all<Size>(Size(20, 50)),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red),
                                  ),
                                  child: const Icon(Icons.delete,
                                      color: textColor,),
                                ),
                              ],
                            ),
                          ],
                        ),

                      ),
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
