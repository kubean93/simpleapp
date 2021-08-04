import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restfull_api/Models/Album.dart';
import 'package:restfull_api/commons/global.dart';

Future<Album> fetchAlbumById(http.Client client, int id) async {
  final response = await client.get(Uri.parse('$URL_ALBUM_BY_ID$id'));
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Fieled to load album');
  }
}

Future<List<Album>> fetchAlbums(http.Client client) async {
  final response = await client.get(Uri.parse(URL_ALBUMS));
  if (response.statusCode == 200) {
    final albums = jsonDecode(response.body).cast<Map<String, dynamic>>();
    final listOfAlbum =
        await albums.map<Album>((json) => Album.fromJson(json)).toList();
    return listOfAlbum;
  } else {
    throw Exception('Fieled to load album');
  }
}
