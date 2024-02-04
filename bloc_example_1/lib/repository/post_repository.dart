import 'dart:convert';
import 'dart:io';

import 'package:bloc_example_1/models/posts_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostsModel>> fetchPosts() async {
    List<PostsModel> postList = [];
    try {
      final http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if (response.statusCode == 200) {
        var decodedResponse = json.decode(response.body.toString());

        postList = (decodedResponse as List).map((e) => PostsModel.fromJson(e)).toList();
        return postList;
      }
    } on SocketException {
      throw Exception('No Internet');
    }

    return postList;
  }
}
