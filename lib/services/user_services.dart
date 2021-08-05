import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restfull_api/commons/global.dart';
import 'package:restfull_api/models/entities/user.dart';

//fetch user by id
Future<User> fetchUserById(http.Client client, String id) async {
  final response = await client.get(Uri.parse('$URL_GET_USER/$id'));
  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Faild to load user');
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
    throw Exception('Failed to load list users');
  }
}

//create an user
Future<User> createUser(http.Client client, User user) async {
  final response = await http.post(
    Uri.parse(URL_GET_USER),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: user.toJson(),
  );
  if (response.statusCode == 200) {
    return user;
  } else {
    throw Exception('Failed to add user');
  }
}

//update patch an user info
Future<bool> updateUserData(
    http.Client client, String userId, User user) async {
  var json = user.toJson();
  print(Uri.parse('${URL_GET_USER}/$userId'));
  print(jsonEncode(json));
  final response = await client.patch(Uri.parse('${URL_GET_USER}/$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(json));
  if (response.statusCode == 200) {
    return true;
  }
  return false;
}
