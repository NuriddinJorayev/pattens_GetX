import 'dart:convert';

import 'package:getx/models/post_model.dart';
import 'package:http/http.dart';

class Rest_APi {
  static String BASE = "jsonplaceholder.typicode.com";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  /* Http Apis */

  static String API_GET = "/posts";
  static String API_CREATE = "/posts";
  static String API_UPDATE = "/posts/"; //{id}
  static String API_DELETE = "/posts/"; //{id}

  /* Http Requests */

  static Future<List<Post>> GET_parsed_list() async {
    var uri = Uri.https(BASE, API_GET, paramsEmpty()); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return List<Post>.from(
          jsonDecode(response.body).map((e) => Post.fromJson(e)));
    }
    return [];
  }

  static Future<String> POST(Post p) async {
    var params = paramsCreate(p);
    var uri = Uri.https(BASE, API_CREATE); // http or https
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Create \n');
      print("response body = ${response.body}");
      print("status code = ${response.statusCode}");
      print('\n');
      return response.body;
    }
    return "";
  }

  static Future<String> PUT(Post p) async {
    var uri = Uri.https(BASE, API_UPDATE + p.id.toString()); // http or https
    var params = paramsUpdate(p);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      print('Updated \n');
      print("response body = ${response.body}");
      print("status code = ${response.statusCode}");
      print('\n');
      return response.body;
    }
    return "";
  }

  static Future<String> DEL(Post p) async {
    var uri = Uri.https(
        BASE, API_DELETE + p.id.toString(), paramsEmpty()); // http or https
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      print('Deleted \n');
      print("response body = ${response.body}");
      print("status code = ${response.statusCode}");
      print('\n');
      return response.body;
    }
    return "";
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      'title': post.title,
      'body': post.body,
      'userId': post.userId.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      'id': post.id.toString(),
      'title': post.title,
      'body': post.body,
      'userId': post.userId.toString(),
    });
    return params;
  }
}
