import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:restfull_api/Models/Album.dart';
import 'package:restfull_api/Screens/AlbumDetailScreen.dart';
import 'package:restfull_api/Services/AlbumService.dart';

class AlbumList extends StatelessWidget {
  final List<Album> albums;
  AlbumList({Key? key, required this.albums}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            padding: EdgeInsets.all(10.0),
            color: index % 2 == 0 ? Colors.greenAccent : Colors.cyan,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text('userId: ${albums[index].userId.toString()}',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                new Text('title: ${albums[index].title}',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0))
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AlbumDetailScreen(albumId: albums[index].id)));
          },
        );
      },
      itemCount: albums.length,
    );
  }
}

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Albums from Restfull Api"),
      ),
      body: FutureBuilder(
        future: fetchAlbums(http.Client()),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData
              ? AlbumList(albums: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
