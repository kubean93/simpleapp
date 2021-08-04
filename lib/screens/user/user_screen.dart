import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restfull_api/models/entities/user.dart';
import 'package:restfull_api/services/user_services.dart';

class UserListView extends StatelessWidget {
  final List<User> users;
  const UserListView({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            color: index % 2 == 0 ? Colors.greenAccent : Colors.cyan,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('userId: ${users[index].name}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0)),
                Text('title: ${users[index].displayName}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0))
              ],
            ),
          ),
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //             AlbumDetailScreen(albumId: users[index].id)));
          },
        );
      },
      itemCount: users.length,
    );
  }
}

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UsercreenState createState() => _UsercreenState();
}

class _UsercreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetch User from Api"),
      ),
      body: FutureBuilder(
        future: fetchAllUser(http.Client()),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData
              ? UserListView(users: snapshot.data)
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
