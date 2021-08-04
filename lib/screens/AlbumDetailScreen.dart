import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restfull_api/Models/Album.dart';
import 'package:restfull_api/Services/AlbumService.dart';

class AlbumDetailScreen extends StatefulWidget {
  final albumId;
  const AlbumDetailScreen({Key? key, required this.albumId}) : super(key: key);

  @override
  _AlbumDetailScreenState createState() => _AlbumDetailScreenState();
}

class _AlbumDetailScreenState extends State<AlbumDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Album Detail"),
        actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: FutureBuilder(
        future: fetchAlbumById(http.Client(), widget.albumId),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? AlbumDetail(albumDetail: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class AlbumDetail extends StatelessWidget {
  final Album albumDetail;
  const AlbumDetail({Key? key, required this.albumDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text('id: ${albumDetail.id}'),
          new Text('userId: ${albumDetail.userId}'),
          new Text('title: ${albumDetail.title}'),
        ],
      ),
    );
  }
}
