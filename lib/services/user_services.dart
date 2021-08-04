import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restfull_api/commons/global.dart';
import 'package:restfull_api/models/entities/user.dart';

//fetch user by id
Future<User> fetchUserById(http.Client client, int id) async {
  final response = await client.get(Uri.parse('$URL_GET_USER/$id'));
  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Fieled to load album');
  }
}

//fetch all user data
Future<List<User>> fetchAllUser(http.Client client) async {
  final response = await client.get(Uri.parse(URL_GET_USER));
  if (response.statusCode == 200) {
    final Map<String, dynamic> res = jsonDecode(response.body);
    if (res['status'] == 1) {
      final data = res['result'];
      final content = data['content'].cast<Map<String, dynamic>>();
      final userList =
          await content.map<User>((json) => User.fromJson(json)).toList();
      return userList;
    } else
      return [];
  } else {
    throw Exception('Fieled to load album');
  }
}
