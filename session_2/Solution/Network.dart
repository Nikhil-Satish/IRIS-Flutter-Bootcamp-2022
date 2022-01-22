import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'Posts.dart';

Future<Posts> fetchPosts(String num) async {
  final response =
  // await http.get('https://jsonplaceholder.typicode.com/posts/${num}');
  // await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/${num}'));
  await http.get(Uri.parse('http://numbersapi.com/${num}'));


  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    log(response.body);
    return Posts.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
 